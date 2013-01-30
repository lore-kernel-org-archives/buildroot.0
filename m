From: Adeel Nafis <adeel@linkwisetech.com>
Date: Wed, 30 Jan 2013 13:59:52 +0500
Subject: [Buildroot] can not open ttyUSB0
In-Reply-To: <mailman.83869.1359534753.32592.buildroot@busybox.net>
References: <mailman.83869.1359534753.32592.buildroot@busybox.net>
Message-ID: <5108E108.2020801@linkwisetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
To: Adeel Nafis<adeel@linkwisetech.com>
Cc:buildroot at busybox.net
Subject: Re: [Buildroot] can not open ttyUSB0
Message-ID: <20130130093112.73034ecd@skate>
Content-Type: text/plain; charset=US-ASCII

> Before trying to access the device through /dev, make sure that your
> kernel has actually detected this device, and that a driver has been
> bound to it:
>
>   *) Check your dmesg to see if there is something related to your 3G
>   modem and the creation of ttyUSB0
>
>   *) Check /sys/class/tty/ and check if there is a ttyUSB0 symlink.
>   Until there is no ttyUSB0 symlink, it means that the kernel hasn't
>   detected the device, or that a driver is missing for it.
Thanks,
the listing from dmesg does indicate the first detection and not the 
subsequent mode switching or connection to the ttyUSB0 of the modem

usb 1-1: new full speed USB device using s3c2410-ohci and address 4
usb 1-1: configuration #1 chosen from 1 choice
scsi4 : SCSI emulation for USB Mass Storage devices
usb-storage: device found at 4
usb-storage: waiting for device to settle before scanning
scsi5 : SCSI emulation for USB Mass Storage devices
usb-storage: device found at 4
usb-storage: waiting for device to settle before scanning
mmc0: starting CMD25 arg 00360d30 flags 00000035
mmc0: req done (CMD25): 0/0/0: 00000900 00000000 00000000 00000000
mmc0: starting CMD13 arg e6240000 flags 00000015
mmc0: req done (CMD13): 0/0/0: 00000900 00000000 00000000 00000000
mmc0: starting CMD25 arg 00360d48 flags 00000035
mmc0: req done (CMD25): 0/0/0: 00000900 00000000 00000000 00000000
mmc0: starting CMD13 arg e6240000 flags 00000015
mmc0: req done (CMD13): 0/0/0: 00000900 00000000 00000000 00000000
scsi 4:0:0:0: CD-ROM            HUAWEI   Mass Storage     2.31 PQ: 0 ANSI: 2
scsi 5:0:0:0: Direct-Access     HUAWEI   MMC Storage      2.31 PQ: 0 ANSI: 2
usb-storage: device scan complete
sd 5:0:0:0: Attached scsi removable disk sda
usb-storage: device scan complete

there is no symlink for /sys/class/tty/ttyUSB0, so I guess this 
indicates that there is a missing driver, but which one? I have also 
tried doing the following

modprobe usbserial vendor=0x12d1 product=0x1446

but it makes no difference.

-- 
Adeel Ahmed Nafis
Design Engineer
LINKWISE TECHNOLOGY PTE LTD
Blk 3 Ang Mo Kio Industrial Park 2A
#06-08, AMK TECH 1
Singapore 568050
