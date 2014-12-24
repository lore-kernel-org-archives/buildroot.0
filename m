From: Arthur Lambert <lambertarthur22@gmail.com>
Date: Wed, 24 Dec 2014 15:24:00 +0100
Subject: [Buildroot] Generate a sdcard for imx6sololiteevk
Message-ID: <CAGpqJgrUgYciRtPe4JsiU2LPa7SR+=tyxZce8+PD95Gzh_7S0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I would like to use Buildroot to generate a linux for imx6 sololitevk.
I found an existing configuration done for this board in the master
branch of Buildroot.

To generate my image :

make freescale_imx6sololiteevk_defconfig
make all

Then I used this script in
board/freescale/imx6sabresd/create-boot-sd.sh to generate an sd card
by typing :

sudo ./create-boot-sd.sh /dev/mmcblk0

When I tried to run my sdcard on the board current result is :

_______________________________________________________
reading uImage
5258568 bytes read in 267 ms (18.8 MiB/s)
Booting from mmc ...
reading imx6sl-evk.dtb
33925 bytes read in 18 ms (1.8 MiB/s)
## Booting kernel from Legacy Image at 80800000 ...
   Image Name:   Linux-3.10.17
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    5258504 Bytes = 5 MiB
   Load Address: 10008000
   Entry Point:  10008000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 83000000
   Booting using the fdt blob at 0x83000000
   Loading Kernel Image ... data abort

    MAYBE you should read doc/README.arm-unaligned-accesses

pc : [<bff939d8>]          lr : [<bff70ee8>]
sp : bfc6b9d0  ip : 00000000     fp : 00000000
r10: 80d03d48  r9 : 00000000     r8 : bfc6bf38
r7 : 80800000  r6 : 00000000     r5 : bfc6ba14  r4 : 10008000
r3 : 00000000  r2 : 00503d08     r1 : 80800040  r0 : 10008000
Flags: Nzcv  IRQs off  FIQs off  Mode SVC_32
Resetting CPU ...

resetting ...
_______________________________________________________

Is it normal ? Do I wrong somewhere in my process ?
Do I must add a patch on uboot to fix that ?
I see some stuff like this for example :
https://gitorious.org/rowboat/u-boot/commit/7894b625259b89cd117685a0855a2c84b11a38f5

Thanks & Regards,
Arthur.
