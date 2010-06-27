From: =?ISO-8859-1?Q?Ob=E9lix?= <obelix0@yahoo.fr>
Date: Sun, 27 Jun 2010 21:30:01 +0200
Subject: [Buildroot] Helps for CV860A (VIA C3) Motherboard
Message-ID: <4C27A6B9.8010805@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I have a CV860A (VIA C3) motherboard and I would like to build a small 
kernel with a small filesystem based on busybox to use it on a compact 
flash of 1go. I think that buildroot can be the right way to do it !

I did a first test to build a cpio root fs with grub and a vmlinuz kernel :
BR2_TARGET_ROOTFS_CPIO=y
BR2_TARGET_GRUB=y
BR2_KERNEL_LINUX_ADVANCED=y
BR2_LINUX_BIN_VMLINUX=y

I did the "make", when buildroot ask me to configure the kernel, I 
changed nothing and i build this :
------------------
ls -hl output/images/
total 984M
-rw-r--r-- 1 user user 855M 2010-06-24 20:29 rootfs.cpio
-rwxr-xr-x 1 user user 129M 2010-06-24 16:56 vmlinux
------------------

I'm a little bit surprised by the size of the root fs and the kernel. I 
chekc the fs and I found that I have a lot of modules but I don't need 
of Xserver or wifi driver. How can I know modules that I can select or 
unselect in the make linux26-menuconfig" ? Is there somebody who have a 
.config to share ?

Moreover, I think that during the building I can preapre the compact 
flash to receive the kernel and fs. Have you got a method to do it ?

Thanks for your help.

Best regards

David
