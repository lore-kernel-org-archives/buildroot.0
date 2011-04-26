From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Apr 2011 11:46:25 +0200
Subject: [Buildroot] Buildroot 2011.02 images won't load on Qemu with
	qemu_arm_versatile_defconfig
In-Reply-To: <BANLkTi=r-0A6Fy8FNMq+Y398sjOd6_cbPA@mail.gmail.com> (Dwi
	Sasongko Supriyadi's message of "Tue, 26 Apr 2011 16:40:22 +0700")
References: <BANLkTi=r-0A6Fy8FNMq+Y398sjOd6_cbPA@mail.gmail.com>
Message-ID: <87ipu15or2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dwi" == Dwi Sasongko Supriyadi <ruckuus@gmail.com> writes:

 Dwi> Hello All,
 Dwi> I found issue when trying to load buildroot images on Qemu. Following is my
 Dwi> configuration:

 Dwi> 1. Buildroot configured with make qemu_arm_versatile_defconfig
 Dwi> 2. Using uClibc toolchain
 Dwi> 3. rootfs.cpio, initramfs of linux kernel

 Dwi> Basically, I just did: make qemu_arm_versatile_defconfig; make then use the
 Dwi> resulting images available under output/images

 Dwi> I run qemu with following command:

 Dwi> qemu-system-arm -M versatilepb -m 128M -kernel output/images/zImage -initrd
 Dwi> output/images/rootfs.cpio.gz -append "root=/dev/ram rdinit=/bin/sh"

 Dwi> Qemu launched but there is nothing shown.

Odd, I've using the versatile config pretty often here. I do configure
it slightly differently, as I normally don't care about graphics output
- So I use the serial output:

qemu-system-arm -M versatilepb -kernel output/images/zImage -append
   'console=ttyAMA0,115200 root=/dev/sda' -nographic -net nic -net user
   -hda output/images/rootfs.ext2

I've tweaked the versatile config a bit in git since the 2011.02
release though (enabled getty on serial port).

Perhaps you could give the default versatile config in git a try before
changing to initramfs?

-- 
Bye, Peter Korsgaard
