From: Joseph G. Boike <joe.boike@acsatlanta.com>
Date: Thu, 26 Jun 2008 09:42:02 -0500
Subject: [Buildroot] Problem automounting USB
Message-ID: <4863AABA.3050209@acsatlanta.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm seeing something similar to hartleys problem.
I have USBMOUNT and USBUTILS enabled in my .config (buildroot v. 22508)
I also have CONFIG_USB_STORAGE enabled in my kernel .config. (kernel 
2.6.24.4)
I plug in a thumb drive and get the following messages:

[root at at91sam9260dfc ~]# usb 1-1: new full speed USB device using 
at91_ohci and address 2
usb 1-1: configuration #1 chosen from 1 choice
scsi0 : SCSI emulation for USB Mass Storage devices
usb 1-1: Product: USB Flash Drive
usb 1-1: Manufacturer: USB 2.0
usb 1-1: SerialNumber: cf304250c3b36b
scsi 0:0:0:0: Direct-Access     USB 2.0  USB Flash Drive  0.00 PQ: 0 ANSI: 2
sd 0:0:0:0: [sda] 31588352 512-byte hardware sectors (16173 MB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Assuming drive cache: write through
sd 0:0:0:0: [sda] 31588352 512-byte hardware sectors (16173 MB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Assuming drive cache: write through
 sda: sda1
sd 0:0:0:0: [sda] Attached SCSI removable disk

I didn't have a dev/sda or sda1 so I manually did mknod to create them 
but still see the same results.
The readme for the usbmount pkg referred to the device being attached as 
/media/usb[n].
I have a /media/usb0 directory but I can't see the thumb drive there either.

After seeing the post about hotplug, I thought that may fix things, but 
I don't see an option anywhere in menuconfig to enable it.
So, what am I missing?
Regards,
Joe
