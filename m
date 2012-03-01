From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Mar 2012 17:59:21 +0100
Subject: [Buildroot] Using buildroot images (iso/ext2) in real target
 device (flash drive)
In-Reply-To: <jio6ql$25v$1@dough.gmane.org>
References: <jio6ql$25v$1@dough.gmane.org>
Message-ID: <20120301175921.5811b398@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 01 Mar 2012 17:06:44 +0100,
Willy <willy@willygroup.org> a ?crit :

> I have created my system images (iso and ext2) and I would put one of 
> them in the flash drive of the target system.
> 
> So far I've used unetbootin to create a bootable system which loaded
> in RAM, now the image is too big for my RAM.
> 
> Now I've used dd to put my image in the flash drive:
> sudo dd if=rootfs.ext2 of=/dev/sdc1
> 
> Then when the machine starts I got the error:
> 
> Missing operating system
> DISK BOOT FAILURE, PLEASE INSERT...

Yes, you need a bootloader.

> I "think" I've installed grub on my buildroot image
> ( package BR2_TARGET_GRUB [=y] ).
> How can I test if grub is properly installed and how can I setup it?

You need to run grub so that it installs itself on your /dev/sdc
device. Something like:

printf "device (hd0) /dev/sdc\nroot (hd0,0)\nsetup (hd0)\nquit\n" | output/staging/sbin/grub --device-map=/dev/null --no-floppy

Let us know if that works. We should certainly extend the documentation
with more details about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
