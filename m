From: Neil Fincham <neil@mineforeman.com>
Date: Wed, 23 Jul 2014 09:05:46 +1200
Subject: [Buildroot] Issue with BeagleBone Black Rev C - 4GB Flash -
	Pre-installed Debian
Message-ID: <CAH+ZByEiUTxrcFNPoP1qOYcay69a1r9Tzzreza9KuQ7A0oSQRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I am new to buildroot and just feeling my way around.

Has anyone tried the new BeagleBone Black Rev C ?  I am having an issue
where it will not boot any of my (working on the Rev B) images.  It look
like to my untrained eye that the new debian uEnv.txt scans the SD for a
valid uEnv.txt (with uenvcmd declared in it) and when it does not find it,
it boots from mmc.

The boot from the serial looks like this;-

U-Boot 2014.04-00015-gb4422bd (Apr 22 2014 - 13:24:29)

I2C:   ready
DRAM:  512 MiB
NAND:  0 MiB
MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
*** Warning - readenv() failed, using default environment

Net:   <ethaddr> not set. Validating first E-fuse MAC
cpsw, usb_ether
Hit any key to stop autoboot:  0
gpio: pin 53 (gpio 53) value is 1
mmc0 is current device
gpio: pin 54 (gpio 54) value is 1
SD/MMC found on device 0
reading uEnv.txt
Checking if uenvcmd is set ...

uenvcmd was not defined in uEnv.txt ...
gpio: pin 56 (gpio 56) value is 0
gpio: pin 55 (gpio 55) value is 0
gpio: pin 54 (gpio 54) value is 0
mmc1(part 0) is current device
gpio: pin 54 (gpio 54) value is 1
SD/MMC found on device 1
reading uEnv.txt
1430 bytes read in 7 ms (199.2 KiB/s)
gpio: pin 55 (gpio 55) value is 1
Loaded environment from uEnv.txt
Importing environment from mmc ...
Checking if uenvcmd is set ...
gpio: pin 56 (gpio 56) value is 1
Running uenvcmd ...
reading zImage
3717760 bytes read in 209 ms (17 MiB/s)
reading initrd.img
2870030 bytes read in 178 ms (15.4 MiB/s)
reading /dtbs/am335x-boneblack.dtb
25080 bytes read in 12 ms (2 MiB/s)
Kernel image @ 0x82000000 [ 0x000000 - 0x38ba80 ]
## Flattened Device Tree blob at 88000000
   Booting using the fdt blob at 0x88000000
   Using Device Tree in place at 88000000, end 880091f7

Starting kernel ...

It seems obvious to me I should include a uEnv.txt on my images but I have
no experience of how to write one (current buildroot has spoiled me, I
know).

Am I correct in my assumptions?  Does anyone have a minimal uEnv.txt that
works from me to start from?

Neil
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140723/171f47fd/attachment.html>
