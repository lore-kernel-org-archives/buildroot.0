From: Arun Reddy <reddyac@gmail.com>
Date: Tue, 8 Apr 2008 13:27:28 -0700
Subject: [Buildroot] Fwd:  Creating a bootable filesystem image?
In-Reply-To: <326f33790804081325s680eb37bg9b8e73663277f4c2@mail.gmail.com>
References: <326f33790804071158h125bc8c3n9701bf1774ce5611@mail.gmail.com>
	<47FB42D2.7040905@arcor.de>
	<326f33790804081325s680eb37bg9b8e73663277f4c2@mail.gmail.com>
Message-ID: <326f33790804081327n55f93beajbf2fb7ea7fafc913@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I apologize I forgot to send the message below to the whole mailing list.

---------- Forwarded message ----------
From: Arun Reddy <reddyac@gmail.com>
Date: Tue, Apr 8, 2008 at 1:25 PM
Subject: Re: [Buildroot] Creating a bootable filesystem image?
To: Sebastian <bastisoft@arcor.de>


Hi Sebastian,

Thank you for this email. Would you be willing to explain why I would need
to change ext3 in order to use grub? Can grub not work on ext3 filesystem? I
just picked ext2 in the kernel configuration as a test but I can really use
any filesystem I want (ext2, ext3, etc). So if the script will create for me
a bootable ext3 filesystem cannot I just use that as it is?


On Tue, Apr 8, 2008 at 3:02 AM, Sebastian <bastisoft@arcor.de> wrote:

> Hello Arun,
>
>  > My question is, does anyone know if there is a way to configure
> buildroot to make rootfs.i386.ext2 bootable? Please note that I disabled
> RAMDISK in the > kernel .config before compiling buildroot because I
> don't need to use one.
>
> This is because rootfs.i386.ext2 is only a file system image, not a hard
> disk image. It is missing the boot sector of the disk, which contains
> the Master Boot Record and the partition table. The BIOS on i386 does
> only execute the first sector on the disk (the MBR code) which usually
> only boots from the active partition. So you need a bootloader, as the
> kernel itself is not able to be loaded this way.
>
> Like John said, you can use GRUB. But if you only want to boot a ext2
> partition, you can easily get away with Extlinux. It is a syslinux
> derivate with support for ext2 (and ext3) instead of FAT. It installs
> only into the partition (not into the master boot record), which means
> you should be fine by creating and activating the partition containing
> your ext2 image.
>
> The changes in scripts/build-ext3-img references ext3 only while
> creating the file system. So you only need to change that if you want to
> use grub.
>
> Best regards,
> Sebastian
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080408/b5f5dabf/attachment.htm 
