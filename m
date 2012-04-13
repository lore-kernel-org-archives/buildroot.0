From: =?iso-8859-1?Q?Mikael_=C5sberg?= <mikael.asberg@mdh.se>
Date: Fri, 13 Apr 2012 09:38:58 +0200
Subject: [Buildroot] Kernel does not boot on I.MX28
Message-ID: <63D6870D443E63419AC4A0C97B86C0920D358F816B@MBXCLUSTER.mdh.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to run a kernel on a I.MX28 EVK board.
I'm using u-boot (from LTIB) on a SD card to boot my kernel.

First I did 'make menuconfig' and set mxs_defconfig, and then 'make'.
Then I do 'make linux-menuconfig' (adding as many UART options as possible).
I do a 'make menuconfig' again and set Kernel --> Kernel configuration --> Using a custom config file.
I change file path to output/build/linux-3.2.6/.config (instead of mxs_defconfig).
Finally, I do 'make'.

However after uncompression, it stops:

----------------------------------------------------------------------------------------
U-Boot 2009.08 (Apr 12 2012 - 17:31:26)

Freescale i.MX28 family
CPU:   454 MHz
BUS:   151 MHz
EMI:   205 MHz
GPMI:   24 MHz
DRAM:  128 MB
MMC:   IMX_SSP_MMC: 0, IMX_SSP_MMC: 1
In:    serial
Out:   serial
Err:   serial
Net:   got MAC address from IIM: 00:04:9f:01:d4:04
FEC0
Hit any key to stop autoboot:  0
reading /uimage

2824696 bytes read
## Booting kernel from Legacy Image at 42000000 ...
   Image Name:   Linux-3.2.6
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2824632 Bytes =  2.7 MB
   Load Address: 40008000
   Entry Point:  40008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
----------------------------------------------------------------------------------------

--------------------------------------------------------------
Mikael ?sberg
PhD student (Doktorand), Computer Engineering
School of Innovation, Design and Engineering
M?lardalen University, V?ster?s Sweden
Phone: +46(0)21 101502
Room nr: U1-145
Mail: mikael.asberg at mdh.se
--------------------------------------------------------------
