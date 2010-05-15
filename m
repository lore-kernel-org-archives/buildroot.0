From: Marcel <korgull@home.nl>
Date: Sat, 15 May 2010 15:47:02 +0200
Subject: [Buildroot] endian issue
Message-ID: <201005151547.02656.korgull@home.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using an Atmel sam9g45 using buildroot with linux 2.6.33.

I currently have most of my things working but run into an issue which is 
endian related.

My driver outputs it's data in big-endian mode (ADC data). This is fine with 
me.I added a package to buildroot with my own software that talks to the 
driver. This package than transfers the results either over ethernet, usb or 
rs232. This all works great as long as I don't perform any calculations in the 
package that I added. When I do so, all data will be messed up and I'm sure 
it's related to endiannes.
I think my package is compiled in little-endian mode and I'm quite sure this 
is the issue. I did some byte swapping to proof it's the issue and this byte 
swapping makes things fine. 

Is there any way to compile my package in big-endian mode from buildroot ?
Or is there another way I should force this ?

Best regards,
Marcel
