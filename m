From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 15:10:56 +0200
Subject: [Buildroot] Boot Buildroot OS from CF(compact flash)
In-Reply-To: <CAMGEwNnz=741u4PTeMQBOWT28bA8wNJbfzogZsdQpySfxF8F3Q@mail.gmail.com>
References: <CAMGEwNnz=741u4PTeMQBOWT28bA8wNJbfzogZsdQpySfxF8F3Q@mail.gmail.com>
Message-ID: <20171010151056.2fb6a82f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Oct 2017 18:22:48 +0530, sunil m wrote:

> i created partition of 1GB (/dev/sdb1) on my thumbdrive by using "fdisk"
> which is of FAT32 System ID(b). then i used "grub-install" utility to
> install grub on /dev/sdb1.
> 
> mkdir /mnt/USB && mount /dev/sdb1 /mnt/USB
> grub-install --force --removable --boot-directory=/mnt/USB/boot /dev/sdb
> 
> i've builded and copied bzimage(initial RAM filesystem linked into linux
> kernel) to /boot of /dev/sdb1(/mnt/USB/boot).
> i've copied grub.cfg(attached in mail) file which is having location of
> bzimage to /boot/grub/ of /dev/sdb1(/mnt/USB/boot/grub/).
> connect the USB to target mechine and then boot the buildroot OS on target
> mechine (RAM) by setting boot option as thumbdrive.
> once the OS is boot in RAM, i'm able to see CF(compact flash) disk. (fdisk
> -l)
> from here, how can i install grub on CF & copy the buildroot
> images(bzImage, rootfs.cpio) to CF and boot from CF? as i can see there is
> no "grub-install" utility in buildroot OS.
> 
> i tried one way is," dd if=/dev/sdb1 of=/dev/sda1 ", with this command i'm
> able to boot from compact flash. will that be good approach to flash os on
> CF(compact flash)?

Assuming you're using grub2 (and not the deprecated grub that has been
removed from Buildroot recently), then you should read
boot/grub2/readme.txt that has lots of details on how to setup grub2.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
