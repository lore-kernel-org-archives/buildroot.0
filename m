From: NEAL, RYAN <RYAN_NEAL@appsig.com>
Date: Wed, 25 Nov 2009 14:49:41 -0800
Subject: [Buildroot] Help Booting Kernel on an ml507
Message-ID: <4B2CB099CF3D4F40B1B1442281CA94FFC4C8E2@EXCHANGEVS01.appsig.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 

I am trying to use buildroot to create a rootfs (specifically a
initramfs) that I can incorporate with the Xilinx linux kernel (2.6...).


 

I am able build properly, I have the rootfs becoming a cpio.gz and the
initramfs is enabled.  I then take this pass it to the linux kernel
build environment and get a single elf file.  When I run this I get the
following problems:

 

Bootline:              Linux/PowerPC load: console=ttyS0 ip=on 

                Bad trap at PC: 4801f1b4, SR: 2d000, vector=2010

Bootline:              Linux/PowerPC load: console=ttyS0 ip=on
root=/dev/ram

                Bad trap at PC: 4801f1b4, SR: 2d000, vector=2010

 

I then tried to just get to a shell by doing the following:

Bootline:              Linux/PowerPC load: console=ttyS0 ip=on
rdinit=/bin/sh

Bootline:              Linux/PowerPC load: console=ttyS0 ip=on
root=/dev/ram rdinit=/bin/sh

 

Bad trap at PC: 4801f1b4, SR: 2d000, vector=2010

init has generated signal 5 but has no handler for it

Kernel panic - not syncing: Attempted to kill init!

Call Trace:

[cf831d80] [c0005f88] show_stack+0x48/0x15c (unreliable)

[cf831db0] [c0220c80] panic+0x94/0x174

[cf831e00] [c0038490] do_group_exit+0x0/0xb8

[cf831e50] [c000bf68] _exception+0x19c/0x1a4

[cf831f40] [c000e8c0] ret_from_except_full+0x0/0x4c

Rebooting in 180 seconds.. 

 

 

First, do I need the root=/dev/ram line?  

 

Second, does anyone know what signal 5 is and if it is an error in my
configuration of BR?  I think it is this because I can "boot" with
another initramfs image (see:
http://www.aclevername.com/articles/linux-xilinx-tutorial/minimalist-ini
tramfs.html).

 

Any help would be really great! Thanks in advance!!

 

:: Ryan Neal

Office: 490/279

Phone: 408.774.2747

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091125/f0fd7bd5/attachment-0001.htm>
