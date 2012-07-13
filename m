From: Bart J. Smit <bart@smits.co.uk>
Date: Fri, 13 Jul 2012 08:23:17 +0000
Subject: [Buildroot] Starting from scratch fails - how do I get to a
 basic PXE boot?
In-Reply-To: <mailman.29648.1342161106.7700.buildroot@busybox.net>
References: <mailman.29648.1342161106.7700.buildroot@busybox.net>
Message-ID: <07221C471CA1C044B6D10EC0D483C95708D3FE8B@hercules.clumpton.homeip.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I was under the impression from the on-line help that the BR2_LINUX_KERNEL_DEFCONFIG option had to specify one of the defconfig files from the configs directory. 

I've changed the defconfig option to
	BR2_LINUX_KERNEL_DEFCONFIG=i386

It now builds without error, but booting the VM from the resulting bzImage and rootfs.cpio.gz causes it to stall at the same point as before. Could this be because I haven't cleaned the config? Any thoughts on how to wipe the slate clean? Will make clean do the trick?

I don't think PXE has any influence on the problem - it's just the method I'm using to boot. There's obviously no block device other than the initial ramdisk.

I just want to get to a simple booting system and add in complexity from there. It seems I'm still missing a vital component. There must be others on the list who are booting a i386 embedded system.

Bart...

-----Original Message-----
Date: Fri, 13 Jul 2012 00:13:41 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: buildroot at busybox.net
Subject: Re: [Buildroot] Starting from scratch fails - how do I get to
	a basic PXE boot?
Message-ID: <20120713001341.046da315@skate>
Content-Type: text/plain; charset=UTF-8

Le Thu, 12 Jul 2012 10:54:27 +0000,
"Bart J. Smit" <bart@smits.co.uk> a ?crit :

> kernel changes for VM:
> 	BR2_LINUX_KERNEL=y
> 	BR2_LINUX_KERNEL_DEFCONFIG=qemu_x86

This line doesn't make sense, since the kernel does not have a
arch/x86/configs/qemu_x86_defconfig file. For x86, only two defconfigs
are available: i386 and x86_64.

> What steps did I miss? Is there a better/easier way to get from a clean buildroot to a working PXE setup?

Does PXE has anything to do with this? I think PXE just boots a kernel
+ optionally an initrd/initramfs, no?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
