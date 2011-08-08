From: Sam Nazarko <samnazarko@stmteam.com>
Date: Mon, 8 Aug 2011 05:03:39 +0100
Subject: [Buildroot] Still can't boot 2011.05 system
Message-ID: <000501cc5580$27ba08e0$772e1aa0$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 

I am unable to reply to my existing message because my notifications were
not set correctly with the mailing list, so I cannot reply to an unsent
message. A user suggested that my hang (which indeed does occur briefly
after Starting network..) was a Serial Port issue. I am not sure how to
resolve this. I have it set to the default of ttyS0 and I even set the
baudrate to "kernel default" but this did not resolve the problem. I looked
at innitab and saw this line:

 

ttyS0::respawn:/sbin/getty -L ttys0 0 vt100 #GENERIC_SERIAL

 

After commenting it out, the problem still persists. VirtualBox booting
brings:

 

Initializing random number generator... done.

Starting network...

                ip used greatest stack depth: 6088 bytes left

                usb 1-1: new full speed USB device using ohci_hcd and
address 2

                usb 1-1: New USB device found, idVendor=80ee, idProduct=0021

                usb 1-1: New USB device strings: Mfr=1, Product=3,
SerialNumber=0

                usb 1-1: Product: USB Tablet

                usb 1-1: Manufacturer: VirtualBox

                input: VirtualBox USB Tablet as
/devices/pci0000:00/0000:00:06.0/usb1-1/1-1:1.0/input/input4

                generic usb 003:80EE:0021.001: input, hidraw0, USB HID
V1.1.0 Mouse [VirtualBox USB Tablet} on usb-0000:00:06.0-1/input0

 

 

Thank you

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110808/90e07104/attachment.html>
