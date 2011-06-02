From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 2 Jun 2011 10:53:32 +0200
Subject: [Buildroot] GCC 4.6.x building : bootstraps and some other packages
	fail
Message-ID: <9E448A3C2A524B28B241DFDCA22CF9DC@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

 

Just tried a rebuild of my existing configuration build with gcc 4.5.x and
now I used  GCC 4.6.0 to build it.

 

Bootstrap build failed, and some other fatal issues with other packages also
exist.

 

It seems using GCC 4.6.x would need some package specific patches,  or  GCC
may need some extra work.

 

So for me I will keep using GCC 4.5.x  

 

 

/usr/bin/make -j2
CROSS_COMPILE=/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uc
libcgnueabi- \

                          -C
/home/johan/buildroot/output/build/at91bootstrap-1.16/board/at91sam9260ek/na
ndflash

make[1]: Entering directory
`/home/johan/buildroot-2011.05/output/build/at91bootstrap-1.16/board/at91sam
9260ek/nandflash'

rm -f *.o *.bin *.elf *.map

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -g -mcpu=arm926ej-s -c -Os -Wall -DAT91SAM9260
-I./../../../board/at91sam9260ek/nandflash -DTOP_OF_MEM=0x301000
../../../crt0_gnu.S -o crt0_gnu.o

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -c -g -mcpu=arm926ej-s -Os -Wall -DAT91SAM9260
-I./../../../board/at91sam9260ek/nandflash -fno-exceptions
-fno-unwind-tables -fno-asynchronous-unwind-tables
../../../board/at91sam9260ek/at91sam9260ek.c -o at91sam9260ek.o

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -c -g -mcpu=arm926ej-s -Os -Wall -DAT91SAM9260
-I./../../../board/at91sam9260ek/nandflash -fno-exceptions
-fno-unwind-tables -fno-asynchronous-unwind-tables ../../../main.c -o main.o

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -c -g -mcpu=arm926ej-s -Os -Wall -DAT91SAM9260
-I./../../../board/at91sam9260ek/nandflash -fno-exceptions
-fno-unwind-tables -fno-asynchronous-unwind-tables ../../../driver/gpio.c -o
gpio.o

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -c -g -mcpu=arm926ej-s -Os -Wall -DAT91SAM9260
-I./../../../board/at91sam9260ek/nandflash -fno-exceptions
-fno-unwind-tables -fno-asynchronous-unwind-tables ../../../driver/pmc.c -o
pmc.o

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -c -g -mcpu=arm926ej-s -Os -Wall -DAT91SAM9260
-I./../../../board/at91sam9260ek/nandflash -fno-exceptions
-fno-unwind-tables -fno-asynchronous-unwind-tables ../../../driver/debug.c
-o debug.o

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -c -g -mcpu=arm926ej-s -Os -Wall -DAT91SAM9260
-I./../../../board/at91sam9260ek/nandflash -fno-exceptions
-fno-unwind-tables -fno-asynchronous-unwind-tables ../../../driver/sdramc.c
-o sdramc.o

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -c -g -mcpu=arm926ej-s -Os -Wall -DAT91SAM9260
-I./../../../board/at91sam9260ek/nandflash -fno-exceptions
-fno-unwind-tables -fno-asynchronous-unwind-tables
../../../driver/nandflash.c -o nandflash.o

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -g -mcpu=arm926ej-s -c -Os -Wall -DAT91SAM9260
-I./../../../board/at91sam9260ek/nandflash -DTOP_OF_MEM=0x301000
../../../lib/_udivsi3.S -o _udivsi3.o

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -g -mcpu=arm926ej-s -c -Os -Wall -DAT91SAM9260
-I./../../../board/at91sam9260ek/nandflash -DTOP_OF_MEM=0x301000
../../../lib/_umodsi3.S -o _umodsi3.o

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -c -g -mcpu=arm926ej-s -Os -Wall -DAT91SAM9260
-I./../../../board/at91sam9260ek/nandflash -fno-exceptions
-fno-unwind-tables -fno-asynchronous-unwind-tables ../../../lib/div0.c -o
div0.o

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -c -g -mcpu=arm926ej-s -Os -Wall -DAT91SAM9260
-I./../../../board/at91sam9260ek/nandflash -fno-exceptions
-fno-unwind-tables -fno-asynchronous-unwind-tables ../../../lib/udiv.c -o
udiv.o

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -c -g -mcpu=arm926ej-s -Os -Wall -DAT91SAM9260
-I./../../../board/at91sam9260ek/nandflash -fno-exceptions
-fno-unwind-tables -fno-asynchronous-unwind-tables ../../../lib/string.c -o
string.o

/home/johan/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gc
c -nostartfiles -nostdlib -Wl,-Map=nandflash_at91sam9260ek.map,--cref -T
../../../elf32-littlearm.lds -Ttext 0x200000 -n -o
nandflash_at91sam9260ek.elf crt0_gnu.o at91sam9260ek.o main.o gpio.o pmc.o
debug.o sdramc.o nandflash.o _udivsi3.o _umodsi3.o div0.o udiv.o string.o

/home/johan/buildroot-2011.05/output/host/usr/bin/../lib/gcc/arm-unknown-lin
ux-uclibcgnueabi/4.6.0/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld:
section .text.startup loaded at [00200e7c,00200ea3] overlaps section .data
loaded at [00200e7c,00200f3f]

collect2: ld returned 1 exit status

make[1]: *** [nandflash_at91sam9260ek] Error 1

make[1]: Leaving directory
`/home/johan/buildroot-2011.05/output/build/at91bootstrap-1.16/board/at91sam
9260ek/nandflash'

make: ***
[/home/johan/buildroot/output/build/at91bootstrap-1.16/board/at91sam9260ek/n
andflash/nandflash_at91sam9260ek.bin] Error 2

 

Regards Johan

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110602/e4265574/attachment-0001.html>
