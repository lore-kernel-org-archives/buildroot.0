From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 7 May 2008 11:25:22 +0200
Subject: [Buildroot] Booting from USB Memory Stick
References: <B44D4D5BF344094DABB900C4E0F6E353016EB1F1A1@srv02.nortechonline.net>
Message-ID: <01aa01c8b02a$589405f0$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi There,

> I've got a board based around  the Atmel AT91SAM9260, due to limitations in the 
> amount of flash on the board (only 4MB) I'd like to boot of a USB Memory Stick instead.

> The plan is to format the memory stick with ext2 and copy my rootfs onto there. The Kernel will go into the 4MB DataFlash on the 
> board. From u-boot I'll set bootargs so it includes "root=/dev/sda1"

> Only when I boot the device, it sees the memory stick but doesn't set "/dev/sda1" up.

[snip]



> Simon

You need to have something that will automount the device.

udev and similar things are used to create the /dev file system,

but udev is located inside the file system....

Maybe you need to have an Initramfs?

Have not used that myself except for prebuilt demos, but others might know.

You could probably fit an initramfs on the dataflash, alternatively you could

partition your USB stick so that you have a FAT partition with the initramfs

which is loaded into SDRAM before boot.



The normal way of using a USB stick is to store a ramdisk 

and load it into the SDRAM before boot.

This obviously does not give you persistant storage.



Best Regards

Ulf Samuelsson
