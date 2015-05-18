From: g4 at novadsp.com <g4@novadsp.com>
Date: Mon, 18 May 2015 14:28:45 +0100
Subject: [Buildroot] Beaglebone Black ?
Message-ID: <07fe01d0916e$917ea2d0$b47be870$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using the latest BR (2015.02) etc. I do not seem to be able to get a working
installation for a Beaglebone Black. Anyone else tried using
beaglebone_defconfig recently?

u-boot spew follows.

Both mmc 0:1 and mmc 0:2 show the expected SD card content. It just looks
like uEnv is wrong (?). Changing uEnv so bootfile=zImage ensures zImage is
read but still halts in u-boot console.

Any help/suggestions here would be much appreciated. TVMIA

-----------------------snip----------------------------------------
micro SD card found
mmc0 is current device
gpio: pin 54 (gpio 54) value is 1
SD/MMC found on device 0
reading uEnv.txt
96 bytes read in 3 ms (31.3 KiB/s)
Loaded environment from uEnv.txt
Importing environment from mmc ...
Running uenvcmd ...
## Error: "loadimage" not defined
reading ramdisk.gz
** Unable to read file ramdisk.gz **
reading /am335x-boneblack.dtb
34004 bytes read in 9 ms (3.6 MiB/s)
Booting from ramdisk ...
Wrong Image Format for bootm command
ERROR: can't get kernel image!
gpio: pin 55 (gpio 55) value is 1
reading /uImage
** Unable to read file /uImage **
U-Boot#
-----------------------snip----------------------------------------
