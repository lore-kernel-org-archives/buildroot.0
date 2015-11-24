From: astrolite . <ciclonite@gmail.com>
Date: Tue, 24 Nov 2015 19:17:43 +0100
Subject: [Buildroot] WiringPi - problem adding package to my buildroot
Message-ID: <CACvocV5bQo_YG05=ujYEJHygDQCw6_XZDLJ9zdCLO4tGCSswtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
After  sucessfully added pigpio package to buildroot, i'm tried to add
wiringPi package.
But i've a problem that not understand..

These are my files :
Config.in

config BR2_PACKAGE_WIRINGPI
bool "wiringPi"
help
 wiringPi libraries

wiringPi.mk

WIRINGPI_VERSION = 488e3729e44721b79ba655429f453f7396157c22
WIRINGPI_INSTALL_TARGET = YES
WIRINGPI_INSTALL_STAGING = YES
WIRINGPI_AUTORECONF = YES
WIRINGPI_SITE = $(call github,ciclonite,pigpio,$(LIBPIGPIO_VERSION))


when i launch make :

make
/usr/bin/make -j1  HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++"
silentoldconfig
make[1]: Entering directory
`/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05'
BR2_DEFCONFIG=''
KCONFIG_AUTOCONFIG=/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05/output/build/buildroot-config/auto.conf
KCONFIG_AUTOHEADER=/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05/output/build/buildroot-config/autoconf.h
KCONFIG_TRISTATE=/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05/output/build/buildroot-config/tristate.config
BR2_CONFIG=/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05/.config
BR2_EXTERNAL=support/dummy-external SKIP_LEGACY=
/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05/output/build/buildroot-config/conf
--silentoldconfig Config.in
make[1]: Leaving directory
`/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05'
>>> host-gawk 4.1.2 Patching

Applying 0001-no-versioned.patch using patch:
patching file Makefile.in
Reversed (or previously applied) patch detected!  Skipping patch.
2 out of 2 hunks ignored -- saving rejects to file Makefile.in.rej
Patch failed!  Please fix 0001-no-versioned.patch!
make: ***
[/root/qt-pi2-pigpio-wiringpi/buildroot-qt-dev/buildroot-2015.05/output/build/host-gawk-4.1.2/.stamp_patched]
Error 1

Someone can help me to find out the problem?
Thanks,
Giovanni
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151124/b4b92be0/attachment.html>
