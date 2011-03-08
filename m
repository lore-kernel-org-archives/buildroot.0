From: bruce bushby <bruce.bushby@gmail.com>
Date: Tue, 8 Mar 2011 22:40:11 +0000
Subject: [Buildroot] gpsd not included in build
Message-ID: <AANLkTikBwUmiUPZroqj8jL9NAh+6sHEr69gDmkV8ufR0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I hope I'm not being really thick here....but I can't seem to get "gpsd" to
be included in my build.

I'm trying with "buildroot-2011.02" and "daily snapshot" on both ubuntu and
Fedora but for some reason, the "make" doesn't download or compile gpsd.

I checked package/Config.in ... looks ok
I added GPSD_SOURCE to: package/gpsd/gpsd.mk

I manually downloaded the package into /opt/buildroot/dl

I tried unticking it, re-running make (without a make clean) and then
selecting it and running "make"....but it appears to ignore it.

it's definitely in my config file:
[root at core buildroot]# grep -i gps .config | grep -v "^#"
BR2_PACKAGE_GPSD=y
BR2_PACKAGE_GPSD_DEVICES="/dev/ttyS4"
BR2_PACKAGE_GPSD_RECONFIGURE=y
BR2_PACKAGE_GPSD_CONTROLSEND=y
BR2_PACKAGE_GPSD_NMEA=y
BR2_PACKAGE_GPSD_SIRF=y
[root at core buildroot]#


Any tricks I'm missing? .... I've added my own packages and they're pulled
in and compiled hence my confusion :)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110308/a3828b2a/attachment.html>
