//
//  RegisterViewController.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/6/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let scrollViewWallSegue = "SignupSuccesful"
    let tableViewWallSegue = "SignupSuccesfulTable"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func signUpPressed(sender: AnyObject) {
        //TODO
        //If signup sucessful:
        let user = PFUser()
        
        user.username = userTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackgroundWithBlock { succeeded, error in
            if (succeeded) {
                self.performSegueWithIdentifier(self.scrollViewWallSegue, sender: nil)
            } else if let error = error {
                self.showErrorView(error)
            }
        }
    }
}
