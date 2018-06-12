From: Nathan Miller <nathan.miller@theactigraph.com>
Date: Tue, 12 Jun 2018 09:10:21 -0500
Subject: [Buildroot] Beaglebone Black USB not working with buildroot 2018.05
 default settings
Message-ID: <CAGGQ1+YSmYubD_NmM3EyYFcFjzzF7dbQwRZOzB+1qityoCAHpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm trying to compile the buildroot default config for a Beaglebone black
and I'm having problems with no working USB. I build the system by running

make distclean
make beaglebone_defconfig
make

and create an SD card by running

sudo dd if=output/images/sdcard.img of=/dev/sdc

where /dev/sdc is my SD card reader with a card inserted. I then boot the
BBB by inserting the SD card, holding the button down, and connecting
power. It boots up just fine, I can log in as root, and I can verify that
it's the system I just compiled by running `uname -a` and verifying the
build date.

However, when I run lsusb to see connected USB devices, I receive the
following error:

# lsusb
lsusb: /sys/bus/usb/devices: No such file or directory

is there something I'm missing in this build process, or is this a known
issue? I searched the bug tracker and didn't find anything. I also loaded
the official Debian image on the board and verified that the USB works, so
as to rule out a hardware issue.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180612/d7f49774/attachment.html>
