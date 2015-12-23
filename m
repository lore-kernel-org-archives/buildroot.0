From: Craig Swank <craigswank@fastmail.fm>
Date: Wed, 23 Dec 2015 09:04:56 -0800
Subject: [Buildroot] trying to use https://github.com/beagleboard/linux.git
	with buildroot
Message-ID: <1450890296.2355509.475056490.71128E4E@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I?m trying to use a more updated kernel for my beagle bone black
build.  I tried copying the way the raspberry pi defconfig does it.  My
menuconfig for the kernel looks like:


[*] Linux Kernel
      Kernel version (Custom Git repository)  --->
(file:///home/craig/workspace/beaglebone/linux) URL of custom repository
(4.1.4-ti-r9) Custom repository version
()    Custom kernel patches
      Kernel configuration (Using an in-tree defconfig file)  --->
(bb.org) Defconfig name
()    Additional configuration fragment files
      Kernel binary format (zImage)  --->
      Kernel compression format (gzip compression)  --->
[*]   Build a Device Tree Blob (DTB)
        Device tree source (Use a device tree present in the kernel.) 
        --->
(am335x-bone am335x-boneblack) Device Tree Source file names
[ ]   Install kernel image to /boot in target
      Linux Kernel Extensions  --->
      Linux KernelTools?>

where the linux at file:///home/craig/workspace/beaglebone/linux is from
https://github.com/beagleboard/linux.

The instructions at that repo say to build the linux kernel by doing:

$ git checkout 4.1.4-ti-r9 -b tmp
make ARCH=arm bb.org_defconfig
so, following the pattern of the raspberry pi defconfig in buildroot,
the defconfig name should be ?bb.org?

when I run ?make? in buildroot it all seems to build fine, but when I
install the output to my sd card and start up my beaglebone I get:

U-Boot SPL 2013.10 (Dec 23 2015 - 09:23:34)
reading args
spl: error reading image args, err - -1
reading u-boot.img
reading u-boot.img


U-Boot 2013.10 (Dec 23 2015 - 09:23:34)

I2C:   ready
DRAM:  512 MiB
WARNING: Caches not enabled
NAND:  0 MiB
MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
*** Warning - readenv() failed, using default environment

Net:   <ethaddr> not set. Validating first E-fuse MAC
cpsw, usb_ether
Hit any key to stop autoboot:  0 
mmc0 is current device
SD/MMC found on device 0
reading uEnv.txt
96 bytes read in 3 ms (31.3 KiB/s)
Loaded environment from uEnv.txt
Importing environment from mmc ...
Running uenvcmd ...
reading /zImage
7416160 bytes read in 688 ms (10.3 MiB/s)
reading ramdisk.gz
** Unable to read file ramdisk.gz **
reading /am335x-boneblack.dtb
57860 bytes read in 12 ms (4.6 MiB/s)
Booting from ramdisk ...
Kernel image @ 0x80200000 [ 0x000000 - 0x712960 ]
Wrong Ramdisk Image Format
Ramdisk image is corrupt or invalid
reading /zImage
7416160 bytes read in 689 ms (10.3 MiB/s)
reading /am335x-boneblack.dtb
57860 bytes read in 11 ms (5 MiB/s)
Kernel image @ 0x80200000 [ 0x000000 - 0x712960 ]
## Flattened Device Tree blob at 80f80000
   Booting using the fdt blob at 0x80f80000
   Using Device Tree in place at 80f80000, end 80f91203

Starting kernel ...


After ?Starting kernel ?? there is no more output and no leds are
flashing.  It just dies there.

Am I doing something wrong?

-- 
  Craig Swank
  craigswank at fastmail.fm
