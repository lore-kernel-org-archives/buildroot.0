From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Tue, 26 Apr 2011 16:40:22 +0700
Subject: [Buildroot] Buildroot 2011.02 images won't load on Qemu with
	qemu_arm_versatile_defconfig
Message-ID: <BANLkTi=r-0A6Fy8FNMq+Y398sjOd6_cbPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I found issue when trying to load buildroot images on Qemu. Following is my
configuration:

1. Buildroot configured with make qemu_arm_versatile_defconfig
2. Using uClibc toolchain
3. rootfs.cpio, initramfs of linux kernel

Basically, I just did: make qemu_arm_versatile_defconfig; make then use the
resulting images available under output/images

I run qemu with following command:

qemu-system-arm -M versatilepb -m 128M -kernel output/images/zImage -initrd
output/images/rootfs.cpio.gz -append "root=/dev/ram rdinit=/bin/sh"

Qemu launched but there is nothing shown.

Then I tried another trick by building linux kernel inside
output/build/linux-2.6.36 with CROSS_COMPILE parameter pointed to Code
Sourcery toolchain and I found the very same result. Qemu did not show
anything.

I changed linux kernel version from buildroot menuconfig with 2.6.27.58,
then configured buildroot with qemu_arm_versatile_defconfig following with
make, then Qemu can load the kernel.

Has anyone experienced this kind of issue?

Thanks in advance,
DWI


-- 
Good software can't be measured by `wc -l software.c`
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110426/0fc98092/attachment.html>
