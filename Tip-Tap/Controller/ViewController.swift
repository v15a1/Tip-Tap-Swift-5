 //
 //  ViewController.swift
 //  Tip-Tap
 //
 //  Created by Visal Rajapakse on 5/21/20.
 //  Copyright © 2020 Visal Rajapakse. All rights reserved.
 //
 
 import UIKit
 
 class ViewController: UIViewController {
    
    //accessing the UI elements
    @IBOutlet weak var billInput: UITextField!
    @IBOutlet weak var zeroPercentTipButton: UIButton!
    @IBOutlet weak var tenPercentTipButton: UIButton!
    @IBOutlet weak var twentyPercentTipButton: UIButton!
    @IBOutlet weak var splitCount: UILabel!
    @IBOutlet weak var splitCountStepper: UIStepper!
    @IBOutlet weak var calculateButton: UIButton!
    
    var numberOfSplits = 1
    var selectedTipPercentage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting border radius of all buttons
        calculateButton.layer.cornerRadius = 5.0
        zeroPercentTipButton.layer.cornerRadius = 5.0
        tenPercentTipButton.layer.cornerRadius = 5.0
        twentyPercentTipButton.layer.cornerRadius = 5.0
        
        updateSplit()
    }
    
    @IBAction func calculateTip(_ sender: UIButton) {
        print(billInput.text ?? "Nothing found")
    }
    
    //function to update the stepper count
    @IBAction func splitStepperAction(_ sender: UIStepper) {
        numberOfSplits = Int(sender.value)
        updateSplit()
    }
    
    @IBAction func selectTipAction(_ sender: UIButton) {
        if (sender.currentTitle == "0%") {
            selectedTipPercentage = 0
            updateTipButton(buttonNumber: 0)
        }else if (sender.currentTitle == "10%"){
            selectedTipPercentage = 10
            updateTipButton(buttonNumber: 1)
        }else if (sender.currentTitle == "20%"){
            selectedTipPercentage = 20
            updateTipButton(buttonNumber: 2)
        }
    }
    
    //function to update the splits
    func updateSplit(){
        //setting number of splits
        splitCount.text = String(numberOfSplits)
    }
    
    //function to update the button UI on selected button
    func updateTipButton(buttonNumber : Int){
        
        //variables & constants
        let buttonNames = [zeroPercentTipButton, tenPercentTipButton, twentyPercentTipButton]
        
        var tappedButton : UIButton?

        //traversing an array of UIButtons to search for a button
        for index in 0..<3 {
            if index == buttonNumber {
                tappedButton = buttonNames[index]
            }else{
                buttonNames[index]!.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                buttonNames[index]!.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
        
        //changing the tapped buttons UI colors for emphasis
        if tappedButton != nil {
            tappedButton!.setTitleColor(#colorLiteral(red: 1, green: 0.937254902, blue: 0.9607843137, alpha: 1), for: .normal)
            tappedButton!.backgroundColor = #colorLiteral(red: 0.9494454265, green: 0.4158070087, blue: 0.5246289372, alpha: 1)
        }
    }
    
 }
 
