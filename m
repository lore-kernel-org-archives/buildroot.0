From: Hodgson, Simon <Simon.Hodgson@nortechonline.co.uk>
Date: Tue, 6 May 2008 18:25:14 +0100
Subject: [Buildroot] Booting from USB Memory Stick
Message-ID: <B44D4D5BF344094DABB900C4E0F6E353016EB1F1A1@srv02.nortechonline.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi There,

I've got a board based around  the Atmel AT91SAM9260, due to limitations in the amount of flash on the board (only 4MB) I'd like to boot of a USB Memory Stick instead.

The plan is to format the memory stick with ext2 and copy my rootfs onto there. The Kernel will go into the 4MB DataFlash on the board. From u-boot I'll set bootargs so it includes "root=/dev/sda1"

Only when I boot the device, it sees the memory stick but doesn't set "/dev/sda1" up.

Extract of the relevant Kernel boot output provided below (full text attached):

at91_ohci at91_ohci: AT91 OHCI
at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
at91_ohci at91_ohci: irq 20, io mem 0x00500000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
usb usb1: Product: AT91 OHCI
usb usb1: Manufacturer: Linux 2.6.24.4 ohci_hcd
usb usb1: SerialNumber: at91
Initializing USB Mass Storage driver...
usb 1-1: new full speed USB device using at91_ohci and address 2
usb 1-1: configuration #1 chosen from 1 choice
usb 1-1: Product: DataTraveler 2.0
usb 1-1: Manufacturer: Kingston
usb 1-1: SerialNumber: 89900000000000000000028E
scsi0 : SCSI emulation for USB Mass Storage devices
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver libusual
usbcore: registered new interface driver usbserial
drivers/usb/serial/usb-serial.c: USB Serial support registered for generic
usbcore: registered new interface driver usbserial_generic
drivers/usb/serial/usb-serial.c: USB Serial Driver core

I've got all the USB stuff compiled into the kernel, not set as modules, but maybe I'm missing a Kernel option?

Any ideas anyone?

Many Thanks


Simon
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: dmesg.txt
Url: http://busybox.net/lists/buildroot/attachments/20080506/2b461a00/attachment.txt 
