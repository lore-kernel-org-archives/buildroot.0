From: Robert Szentmihalyi <robert.szentmihalyi@helvetica-it.com>
Date: Sat, 4 Dec 2010 18:56:06 +0100
Subject: [Buildroot] at91bootstrap-2.13 fails to compile (buildroot-2010.11)
Message-ID: <201012041856.06616.robert.szentmihalyi@helvetica-it.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am building for a at91sam9g20 based board.
at91bootstrap fails with

$ make
/usr/bin/make -j2  silentoldconfig
make[1]: Entering directory `/mnt/usb/solarpg/buildroot-2010.11'
KCONFIG_AUTOCONFIG=/mnt/usb/solarpg/buildroot-2010.11/output/build/buildroot-config/auto.conf KCONFIG_AUTOHEADER=/mnt/usb/solarpg/buildroot-2010.11/output/build/buildroot-config/autoconf.h 
KCONFIG_TRISTATE=/mnt/usb/solarpg/buildroot-2010.11/output/build/buildroot-config/tristate.config BUILDROOT_CONFIG=/mnt/usb/solarpg/buildroot-2010.11/.config 
/mnt/usb/solarpg/buildroot-2010.11/output/build/buildroot-config/conf --silentoldconfig Config.in
#
# make dependencies written to .auto.deps
# ATTENTION buildroot devels!
# See top of this file before playing with this auto-preprequisites!
#
make[1]: Leaving directory `/mnt/usb/solarpg/buildroot-2010.11'
/usr/bin/make -j2 \
                MEMORY=nandflash \
                CROSS_COMPILE=/mnt/usb/solarpg/buildroot-2010.11/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi- \
                AT91_CUSTOM_FLAGS=" -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000" \
                -C /mnt/usb/solarpg/buildroot-2010.11/output/build/at91bootstrap-2.13
make[1]: Entering directory `/mnt/usb/solarpg/buildroot-2010.11/output/build/at91bootstrap-2.13'
/mnt/usb/solarpg/buildroot-2010.11/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc   -g -Os -Wall -Iboard/at91sam9g20ek -Iinclude -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000 -
DJUMP_ADDR=0x23F00000 -DTOP_OF_MEMORY=0x301000 -DMACH_TYPE=0x658  -DAT91SAM9G20 -Dat91sam9g20ek -DMACH_TYPE=0x658 -DTOP_OF_MEMORY=0x301000 -DCRYSTAL_18_432MHZ -
DCONFIG_AT91SAM9G20EK  -c -o build/at91sam9g20ek/_umodsi3.o lib/_umodsi3.S
/mnt/usb/solarpg/buildroot-2010.11/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -g -Os -Wall      -Iboard/at91sam9g20ek -Iinclude -DAT91BOOTSTRAP_VERSION=\"2.13\"  -
DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000  -DIMG_ADDRESS=0x00008400 -DIMG_SIZE=0x00040000 -DJUMP_ADDR=0x23F00000 -DTOP_OF_MEMORY=0x301000 -DMACH_TYPE=0x658  -
DCONFIG_APP_CHECK -DCONFIG_DEBUG -DCONFIG_VERBOSE -DCONFIG_HW_INIT -DAT91SAM9G20 -Dat91sam9g20ek -DMACH_TYPE=0x658 -DTOP_OF_MEMORY=0x301000 -DCRYSTAL_18_432MHZ 
-DCONFIG_AT91SAM9G20EK -DCONFIG_CRYSTAL_18_432MHZ -DCONFIG_CPU_CLK_400MHZ -DCONFIG_BUS_SPEED_133MHZ -DCONFIG_SDRAM -DCONFIG_RAM_64MB -DCONFIG_DATAFLASH -
DCONFIG_DATAFLASH_RECOVERY -DCONFIG_SMALL_DATAFLASH -c -o build/at91sam9g20ek/main.o main.c
<command-line>: warning: "IMG_SIZE" redefined
<command-line>: warning: this is the location of the previous definition
/mnt/usb/solarpg/buildroot-2010.11/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -g -Os -Wall      -Iboard/at91sam9g20ek -Iinclude -DAT91BOOTSTRAP_VERSION=\"2.13\"  -
DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000  -DIMG_ADDRESS=0x00008400 -DIMG_SIZE=0x00040000 -DJUMP_ADDR=0x23F00000 -DTOP_OF_MEMORY=0x301000 -DMACH_TYPE=0x658  -
DCONFIG_APP_CHECK -DCONFIG_DEBUG -DCONFIG_VERBOSE -DCONFIG_HW_INIT -DAT91SAM9G20 -Dat91sam9g20ek -DMACH_TYPE=0x658 -DTOP_OF_MEMORY=0x301000 -DCRYSTAL_18_432MHZ 
-DCONFIG_AT91SAM9G20EK -DCONFIG_CRYSTAL_18_432MHZ -DCONFIG_CPU_CLK_400MHZ -DCONFIG_BUS_SPEED_133MHZ -DCONFIG_SDRAM -DCONFIG_RAM_64MB -DCONFIG_DATAFLASH -
DCONFIG_DATAFLASH_RECOVERY -DCONFIG_SMALL_DATAFLASH -c -o build/at91sam9g20ek/at91sam9g20ek.o board/at91sam9g20ek/at91sam9g20ek.c
<command-line>: warning: "IMG_SIZE" redefined
<command-line>: warning: this is the location of the previous definition
main.c: In function 'main':
main.c:204: error: 'AT91C_SPI_PCS_DATAFLASH' undeclared (first use in this function)
main.c:204: error: (Each undeclared identifier is reported only once
main.c:204: error: for each function it appears in.)
make[1]: *** [build/at91sam9g20ek/main.o] Fehler 1

Any ideas?

I am new to buildroot, so please point me into the right direction, in case I am missing something obvious :-)

TIA,
 Robert


-- 
Robert Szentmih?lyi
Technischer Leiter

Helvetica IT AG
Bahnhofstrasse 15
CH-8890 Flums SG

Tel +41 81 733 15 67
Fax +41 81 733 15 68
Mobil +41 79 252 97 80

Niederlassung Deutschland:
Leopoldstrasse 244
DE-80807 M?nchen

Tel +49 89 20 80 39 508

http://www.helvetica-it.com
