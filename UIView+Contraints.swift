//
//  UIView+Contraints.swift
//  Constraints
//
//  Created by Ygor Yuri De Pinho Pessoa on 22.01.24.
//

import UIKit

extension UIView {
    @discardableResult
    public func constraint(
        top: CGFloat = 0,
        leading: CGFloat = 0,
        bottom: CGFloat = 0,
        trailing: CGFloat = 0,
        useSafeArea: Bool = false
    ) -> Self {
        self.top(top, useSafeArea: useSafeArea)
        self.leading(leading, useSafeArea: useSafeArea)
        self.bottom(bottom, useSafeArea: useSafeArea)
        self.trailing(trailing, useSafeArea: useSafeArea)

        return self
    }
    
    @discardableResult
    public func constraint(
        _ constant: CGFloat = 0,
        useSafeArea: Bool = false
    ) -> Self {
        constraint(
            top: constant,
            leading: constant,
            bottom: -constant,
            trailing: -constant,
            useSafeArea: useSafeArea
        )
        return self
    }
}

// MARK: - Top Constraints

extension UIView {
    @discardableResult
    public func top(
        _ constant: CGFloat = 0,
        toTopOf view: UIView? = nil,
        useSafeArea: Bool = false
    ) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        let anchor = view?.topAnchor ?? topSuperviewAnchor(useSafeArea: useSafeArea)
        self.topAnchor.constraint(
            equalTo: anchor,
            constant: constant
        ).isActive = true
        
        return self
    }
    
    @discardableResult
    public func top(
        _ constant: CGFloat = 0,
        toBottomOf view: UIView,
        useSafeArea: Bool = false
    ) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(
            equalTo: view.bottomAnchor(useSafeArea: useSafeArea),
            constant: constant
        ).isActive = true
        
        return self
    }
    
    func topSuperviewAnchor(useSafeArea: Bool) -> NSLayoutYAxisAnchor {
        guard let superview = self.superview else {
            fatalError("Constraint cannot be applied because view does not have a superview.")
        }
        return superview.topAnchor(useSafeArea: useSafeArea)
    }
    
    func topAnchor(useSafeArea: Bool) -> NSLayoutYAxisAnchor {
        if #available(iOS 11, *), useSafeArea {
            return self.safeAreaLayoutGuide.topAnchor
        }
        return self.topAnchor
    }
}

// MARK: - Leading Constraints

extension UIView {
    @discardableResult
    public func leading(
        _ constant: CGFloat = 0,
        toLeadingOf view: UIView? = nil,
        useSafeArea: Bool = false
    ) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        let anchor = view?.leadingAnchor ?? leadingSuperviewAnchor(useSafeArea: useSafeArea)
        self.leadingAnchor.constraint(
            equalTo: anchor,
            constant: constant
        ).isActive = true
        
        return self
    }
    
    @discardableResult
    public func leading(
        _ constant: CGFloat = 0,
        toTrailingOf view: UIView,
        useSafeArea: Bool = false
    ) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(
            equalTo: view.trailingAnchor(useSafeArea: useSafeArea),
            constant: constant
        ).isActive = true
        
        return self
    }
    
    func leadingSuperviewAnchor(useSafeArea: Bool) -> NSLayoutXAxisAnchor {
        guard let superview = self.superview else {
            fatalError("Constraint cannot be applied because view does not have a superview.")
        }
        return superview.leadingAnchor(useSafeArea: useSafeArea)
    }
    
    func leadingAnchor(useSafeArea: Bool) -> NSLayoutXAxisAnchor {
        if #available(iOS 11, *), useSafeArea {
            return self.safeAreaLayoutGuide.leadingAnchor
        }
        return self.leadingAnchor
    }
}

// MARK: - Bottom Constraints

extension UIView {
    @discardableResult
    public func bottom(
        _ constant: CGFloat = 0,
        toBottomOf view: UIView? = nil,
        useSafeArea: Bool = false
    ) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        let anchor = view?.bottomAnchor ?? bottomSuperviewAnchor(useSafeArea: useSafeArea)
        self.bottomAnchor.constraint(
            equalTo: anchor,
            constant: constant
        ).isActive = true
        
        return self
    }
    
    @discardableResult
    public func bottom(
        _ constant: CGFloat = 0,
        toTopOf view: UIView,
        useSafeArea: Bool = false
    ) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(
            equalTo: view.topAnchor(useSafeArea: useSafeArea),
            constant: constant
        ).isActive = true
        
        return self
    }
    
    func bottomAnchor(useSafeArea: Bool) -> NSLayoutYAxisAnchor {
        if #available(iOS 11, *), useSafeArea {
            return self.safeAreaLayoutGuide.bottomAnchor
        }
        return self.bottomAnchor
    }
    
    func bottomSuperviewAnchor(useSafeArea: Bool) -> NSLayoutYAxisAnchor {
        guard let superview = self.superview else {
            fatalError("Constraint cannot be applied because view does not have a superview.")
        }
        return superview.bottomAnchor(useSafeArea: useSafeArea)
    }
}

// MARK: - Trailling Constraints

extension UIView {
    @discardableResult
    public func trailing(
        _ constant: CGFloat = 0,
        toLeadingOf view: UIView,
        useSafeArea: Bool = false
    ) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(
            equalTo: view.leadingAnchor(useSafeArea: useSafeArea),
            constant: constant
        ).isActive = true
        
        return self
    }
    
    @discardableResult
    public func trailing(
        _ constant: CGFloat = 0,
        toTrailingOf view: UIView? = nil,
        useSafeArea: Bool = false
    ) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        let anchor = view?.trailingAnchor ?? trailingSuperviewAnchor(useSafeArea: useSafeArea)
        self.trailingAnchor.constraint(
            equalTo: anchor,
            constant: constant
        ).isActive = true
        
        return self
    }
    
    func trailingSuperviewAnchor(useSafeArea: Bool) -> NSLayoutXAxisAnchor {
        guard let superview = self.superview else {
            fatalError("Constraint cannot be applied because view does not have a superview.")
        }
        return superview.trailingAnchor(useSafeArea: useSafeArea)
    }
    
    func trailingAnchor(useSafeArea: Bool) -> NSLayoutXAxisAnchor {
        if #available(iOS 11, *), useSafeArea {
            return self.safeAreaLayoutGuide.trailingAnchor
        }
        return self.trailingAnchor
    }
}

// MARK: - Width Constraints

extension UIView {
    @discardableResult
    public func width(_ constant: CGFloat = 0) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func widthAnchor(
        equalTo view: UIView,
        multiplier: CGFloat = 1.0,
        constant: CGFloat = 0
    ) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor
            .constraint(
                equalTo: view.widthAnchor,
                multiplier: multiplier,
                constant: constant
            ).isActive = true
        return self
    }
    
    @discardableResult
    public func widthAnchor(
        equalTo layout: NSLayoutDimension,
        multiplier: CGFloat = 1.0,
        constant: CGFloat = 0
    ) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor
            .constraint(
                equalTo: layout,
                multiplier: multiplier,
                constant: constant
            ).isActive = true
        return self
    }
}

// MARK: - Height Constraints

extension UIView {
    @discardableResult
    public func height(_ constant: CGFloat = 0) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func heightAnchor(
        equalTo layout: NSLayoutDimension,
        multiplier: CGFloat = 1.0,
        constant: CGFloat = 0
    ) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor
            .constraint(
                equalTo: layout,
                multiplier: multiplier,
                constant: constant
            ).isActive = true
        return self
    }
}

// MARK: - Center Constraints

extension UIView {
    @discardableResult
    public func center() -> Self {
        self.centerHorizontally()
            .centerVertically()
    }
    
    @discardableResult
    public func centerHorizontally(_ constant: CGFloat = 0) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        guard let parent = self.superview
        else {
            return self
        }
        self.centerXAnchor.constraint(
            equalTo: parent.centerXAnchor,
            constant: constant
        ).isActive = true
        
        return self
    }
    
    @discardableResult
    public func centerVertically(_ constant: CGFloat = 0) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        guard let parent = self.superview
        else {
            return self
        }
        self.centerYAnchor.constraint(
            equalTo: parent.centerYAnchor,
            constant: constant
        ).isActive = true
        
        return self
    }
}
