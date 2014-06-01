From: Javier Domingo Cansino <javierdo1@gmail.com>
Date: Sun, 1 Jun 2014 15:48:52 +0200
Subject: [Buildroot]  [PATCH 1/1] configs: bump zedboard to 2014.1
Message-ID: <CALZVapnO=eXG1utmqQM7TTyNbci91K2yYM4uRNQ5N5eQaFRs_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

I am trying to use this patch to boot a zedboard, but I can't get it
working, I also tried doing it without the patch, and didn't succeed
neither.

I had started rewriting a more complete readme.txt to make it easier
for people create a buildroot based system[1], but didn't get zedboard
boot with those instructions neither.

Regarding your patch, I followed the specified commands in the readme,
and I noticed a failure on it, the path to copy the sources to has a
typo, needs to be board instead of boards:

>+output/build/uboot-xilinx-v2014.1/boards/xilinx/zynq/
+output/build/uboot-xilinx-v2014.1/board/xilinx/zynq/

The steps I made after make (as stated in the readme) ended, have been

cp output/images/uImage SD/
cp output/images/rootfs.cpio.uboot SD/uramdisk.image
gzip SD/uramdisk.image
cp output/images/boot.bin SD/
cp output/images/zynq-zed.dtb SD/devicetree.dtb

The board doesn't even boot, nor load with the blue led (DONE one).

I will be in #buildroot as txomon or txomon|home , and can have the
card available for testing for one week,

Cheers,

Javier Domingo Cansino

[1] Github buildroot clone: https://github.com/txomon/buildroot ->
doc/zedboard-instructions
