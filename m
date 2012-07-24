From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 08:40:15 +0200
Subject: [Buildroot] [PATCH v3] Bump gpsd from version 2.95 to version
 3.7
In-Reply-To: <1343071776-1689-1-git-send-email-spdawson@gmail.com>
References: <1343071776-1689-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120724084015.37aeedfa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon,

Le Mon, 23 Jul 2012 20:29:36 +0100,
spdawson at gmail.com a ?crit :

>  package/gpsd/gpsd-fix-acs_map-compile-errors.patch |   29 +++

This is apparently not fixing everything:

/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gnueabi-gcc -o gpsmon.o -c -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -Wextra -Wall -Wno-uninitialized -Wno-missing-field-initializers -Wcast-align -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wpointer-arith -Wreturn-type -O2 -I/home/thomas/projets/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/libusb-1.0 -I/home/thomas/projets/buildroot/output/host/usr/include -I/home/thomas/projets/buildroot/output/host/usr/include/ncurses gpsmon.c
In file included from gpsmon.h:11:0,
                 from gpsmon.c:36:
/home/thomas/projets/buildroot/output/host/usr/include/ncurses/curses.h:231:35: error: conflicting types for 'acs_map'
gpsmon.c:28:15: note: previous declaration of 'acs_map' was here
scons: *** [gpsmon.o] Error 1
scons: building terminated because of errors.
make: *** [/home/thomas/projets/buildroot/output/build/gpsd-3.7/.stamp_built] Erreur 2


My defconfig is:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_02=y
BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/home/thomas/x-tools/linaro-2012.02/"
BR2_PACKAGE_DBUS=y
BR2_PACKAGE_DBUS_GLIB=y
BR2_PACKAGE_GPSD=y
BR2_PACKAGE_GPSD_AIVDM=y
BR2_PACKAGE_GPSD_GARMIN=y
BR2_PACKAGE_GPSD_GEOSTAR=y
BR2_PACKAGE_GPSD_ITRAX=y
BR2_PACKAGE_GPSD_NAVCOM=y
BR2_PACKAGE_GPSD_OCEANSERVER=y
BR2_PACKAGE_GPSD_ONCORE=y
BR2_PACKAGE_GPSD_RTCM104V3=y
BR2_PACKAGE_GPSD_SIRF=y
BR2_PACKAGE_GPSD_TRIMBLE_TSIP=y
BR2_PACKAGE_GPSD_TRIPMATE=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_LIBUSB=y
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_RADVD=y

Can you have a look into this?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
