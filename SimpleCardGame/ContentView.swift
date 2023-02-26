//
//  ContentView.swift
//  SimpleCardGame
//
//  Created by Nicolae Chivriga on 25/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var backgroundImage = "background-plain"
    @State var playerCard = "card11"
    @State var cpuCard = "card14"
    @State var playerScore = 0
    @State  var cpuScore = 0
    
    var body: some View {
        
        ZStack {
            
            //MARK: Set Background
            
            Image(backgroundImage)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                
                //MARK: Set Logo
                
                Image("logo")
                
                Spacer()
                HStack{
                    //MARK: Set card Player
                    
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    //MARK: set CPU card
                    Image(cpuCard)
                    Spacer()
                    
                }
                Spacer()
                //MARK: set Button for deal
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        
                        Text("Player")
                            .font(.largeTitle)
                        //MARK: score for Player
                        Text("\(playerScore)")
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        
                        Text("CPU")
                            .font(.largeTitle)
                        //MARK: score for CPU
                        Text("\(cpuScore)")
                            .font(.largeTitle)
                        
                    }
                    Spacer()
                }
            }
        } .foregroundColor(.white)
    }
    
    //MARK: logic button action
    
    func deal() {
        let numberRandomPlayer = Int.random(in: 2...14)
        let numberRandomCPU = Int.random(in: 2...14)
        
        playerCard = "card" + String(numberRandomPlayer)
        cpuCard = "card" + String(numberRandomCPU)
        
        if numberRandomPlayer > numberRandomCPU {
            //MARK: Player Win
            playerScore += 1
        }
        else if numberRandomCPU > numberRandomPlayer{
            //MARK: CPU Win
            cpuScore += 1
            
        }
        else {
            //MARK: Tie
            backgroundImage = "background-wood-grain"
        }
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
