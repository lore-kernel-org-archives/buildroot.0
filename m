From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Fri, 25 Apr 2014 20:37:40 +0200
Subject: [Buildroot] How transfer what image(s) to target-CF?
In-Reply-To: <535985BA.1020009@mind.be>
References: <CAEzGmjA3wbjEFb6sQYov_rJFJuB8oJFx2Y6XOA7WWHce743=dg@mail.gmail.com>
 <5357DD2D.1030702@mind.be>
 <CAEzGmjCXKEQTEEbz7a9JfX80rVafF4XedTjfZDQYyVOypASgAA@mail.gmail.com>
 <535985BA.1020009@mind.be>
Message-ID: <CAEzGmjC+Hob859rdVSD74BsX5R+mwkNRtwsA5Pet=rM+uY4hwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Then you have two options: either create an ext3 image, or create a
>tarball and format the CF card from a separate script.
>
>1. Set the following options:
 >
 >BR2_TARGET_ROOTFS_EXT2=y
 >BR2_TARGET_ROOTFS_EXT2_3=y
 >BR2_TARGET_ROOTFS_EXT2_BLOCKS=1000000
 >(the latter is assuming you have a 1GB CF card).
 >
 >This will create a rootfs.ext3 image.
 >You can write this to your CF card with
 >cat output/images/rootfs.ext3 > /dev/sdX1
 >(assuming you've partitioned it already, and your rootfs is partition 1).
>
 >2. Select the tarball as the target rootfs.
>
 >Now in a separate script, use mkfs.ext3 to create the rootfs directly on
 >the CF card. Then mount it and untar output/images/rootfs.tar to the
rootfs.
>
>
 >In both cases, you'll probably want to use grub2 as the bootloader and
 >select the BR2_LINUX_KERNEL_INSTALL_TARGET option.

Thanks Arnout!
As for grub2, I understand that I can only chose grub(-legacy) in make
menuconfig.
Any tip on that, please?
/Lennart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140425/32bf88ca/attachment.html>
