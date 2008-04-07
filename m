From: Sam Liddicott <sam@liddicott.com>
Date: Mon, 7 Apr 2008 21:07:12 +0100
Subject: [Buildroot] Creating a bootable filesystem image?
Message-ID: <20080407200406.A0C4F2FE0348@sam.liddicott.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a script in scripts which does most of this which I psoted a patch for recently.

The script still needs modifying to use LBA mode not CHS which I will do soon, or you could...

Sam

-----Original Message-----
From: John Voltz <john.voltz@gmail.com>
Sent: 07 April 2008 20:29
To: Buildroot List <buildroot@uclibc.org>
Subject: Re: [Buildroot] Creating a bootable filesystem image?

You need a bootloader like grub to kickstart everything. Buildroot will build grub for you. You have to do a little tweaking of /boot/grub/menu.lst to point grub at your kernel. You can look inside /scripts/create-ext3-img to see what needs to be done, or just use that script to do your bidding.

John


On Mon, Apr 7, 2008 at 2:58 PM, Arun Reddy <reddyac@gmail.com> wrote:
Hi everyone,

I was able to create a filesystem image and .iso using buildroot.

In experimenting with booting up the new kernel on a virtual machine (VirtualBox), I found that I needed to convert my rootfs.i386.ext2 filesystem image to a .vdi file (using VirtualBox software).
 I tried booting the .vdi alone, but unfortunately I encountered an immediate error that stated "no bootable medium could be found." To get passed this error, I mounted the .iso as well along with my .vdi file. Using some help from the mailing list members, I got passed a few minor problems during bootup, and got the kernel running with a shell.

With that milestone complete, I now want to avoid using both the .iso and the harddisk (.vdi) together. I just want to be able to convert the rootfs.i386.ext2 to a .vdi file and run that alone. The fact that this .vdi cannot boot alone leads me to believe the filesystem that buildroot creates for me is not bootable. (I may have missed an important part in my reading, but either the filesystem absolutely needs an .iso to work, or it is used for the user to chroot into it and boot from there).

My question is, does anyone know if there is a way to configure buildroot to make rootfs.i386.ext2 bootable? Please note that I disabled RAMDISK in the kernel .config before compiling buildroot because I don't need to use one
