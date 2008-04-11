From: Arun Reddy <reddyac@gmail.com>
Date: Fri, 11 Apr 2008 14:51:31 -0400
Subject: [Buildroot] Creating a bootable filesystem image?
In-Reply-To: <47FCD648.8040007@arcor.de>
References: <326f33790804071158h125bc8c3n9701bf1774ce5611@mail.gmail.com>
	<47FB42D2.7040905@arcor.de>
	<326f33790804081325s680eb37bg9b8e73663277f4c2@mail.gmail.com>
	<47FBE4A8.9080104@arcor.de>
	<326f33790804081526m5d6fa19bi16dcd55c8e1c5cdf@mail.gmail.com>
	<47FBF3F3.4040001@arcor.de>
	<326f33790804081650r61d9cac7m7cbbd70c9bb3adee@mail.gmail.com>
	<47FCD648.8040007@arcor.de>
Message-ID: <326f33790804111151k7373bbf3j7e13f6dc8e2d981@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sebastian and Buildroot members

I will try this as soon as I can. Right now I am not near my machine with my
build system. If anyone can please try this out for themselves to give
further feedback I would greatly appreciate it. This might be something I
can submit as a bug if everyone is experiencing it. Thank you and I will let
you know about my results as soon as I can.

Arun

On Wed, Apr 9, 2008 at 10:44 AM, Sebastian <bastisoft@arcor.de> wrote:

> Hello Arun,
>
> I tried to create an ext2 file system myself (i486 architecture without
> any applications enabled).
>
> The first two questions I answered with return, the last one with
> /home/basti/linux/buildroot/binaries/uclibc/ and then I noticed that the
> fdisk command gave the same error message as you wrote.
>
> But it doesn't create a partition, so I create one myself: (n)ew,
> (p)rimary, (1), return, return, (w)rite. Then it tries to install grub which
> fails for me, as it can't find /boot/grub/stage1 on the image. If I could
> provide these files, it should work, as grub recognizes the partition.
>
> Maybe you could try to build no ISO image at all, just the ext2 (ext3)
> root file system. I have really no idea why it tries to copy your iso file
> onto the image, as it is not to be placed there.
>
> Best regards,
> Sebastian
>
>
>         Sebastian,
> >
> >        Thanks for the information, I do understand it much clearer
> >        now. I am attempting to run the script and find out whether my
> >        input will result in the bootable filesystem I want. When
> >        running build-ext-img, I input
> >
> >        Enter the path to the image:
> >
> >        I input "/root/buildroot/scripts/" since that is where the
> >        filesystem image is located.
> >
> >        Enter the name of the image file:
> >
> >        I input "buildroot.img"
> >
> >        Enter the path to the root filesystem that you want to install
> >        the image
> >
> >        I input "/root/buildroot/binaries/uclibc/" since this is where
> >        my filesystem image (rootfs.i386.ext2) is located.
> >
> >        When the script runs, it looks like everything is ok at first,
> >        but eventually I get the warning stating Device contains
> >        neither a valid DOS partition table, nor Sun, SGI... etc. It
> >        builds a new DOS disklabel for me, so I go ahead and continue.
> >        I also get a warning that there is an invalid flag 0x0000 of
> >        partition table 4 that will be corrected by w(rite) which I go
> >        ahead an accept. I then type q to quit and continue building
> >        the bootable FS.
> >
> >        I am finally left with
> >
> >        cp: writing /root/buildroot/scripts/temp/rootfs.i386.iso: No
> >        space left on device.
> >
> >        I examined the script and noticed when installing software to
> >        the image, ${IMAGE} is mounted to ${IMAGE_PATH}/temp, then
> >        ${ROOT_PATH}/* is copied to that location, and then the temp
> >        folder is unmounted and removed. Am I getting that there is no
> >        space on the device because it is trying to copy to a folder
> >        where the image is mounted? Or did I not correctly interpret
> >        the inputs correctly above? Thanks for answering these. I
> >        should point out I am using Snapshot from 4-1-2008.
> >
> >
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080411/32c10b3a/attachment.htm 
