From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 17 Jun 2015 15:27:51 +0200
Subject: [Buildroot] Busybox build fails on raspberrypi defconfig
Message-ID: <CAJtjsKZ9zeYzwSkMKiAvUz50e_7L9HKbNLY8WWwz5e59=AHGSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I've just updated my master branch to origin/master (ebe2968 with no
extra commit) and did the following commands:
$ make clean
$ make raspberrypi_defconfig
$ make

And busybox build fails with the following error:
----------8<----------8<----------8<----------8<----------8<----------8<----------
>>> linux-headers 3.12.28 Installing to target
>>> busybox 1.23.2 Building
PATH="/home/johan/Documents/buildroot/output/host/bin:/home/johan/Documents/buildroot/output/host/sbin:/home/johan/Documents/buildroot/output/host/usr/bin:/home/johan/Documents/buildroot/output/host/usr/sbin:/home/johan/cov-analysis-linux64-6.6.1/bin:/home/johan/bin:/home/johan/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64   -Os " CFLAGS_busybox="" /usr/bin/make -j9
CC="/home/johan/Documents/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc"
ARCH=arm PREFIX="/home/johan/Documents/buildroot/output/target"
EXTRA_LDFLAGS=""
CROSS_COMPILE="/home/johan/Documents/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-"
CONFIG_PREFIX="/home/johan/Documents/buildroot/output/target"
SKIP_STRIP=y -C
/home/johan/Documents/buildroot/output/build/busybox-1.23.2
make[1]: Entering directory
'/home/johan/Documents/buildroot/output/build/busybox-1.23.2'
  CC      applets/applets.o
In file included from include/busybox.h:8:0,
                 from applets/applets.c:9:
include/libbb.h:87:19: fatal error: utmp.h: No such file or directory
 # include <utmp.h>
                   ^
compilation terminated.
scripts/Makefile.build:197: recipe for target 'applets/applets.o' failed
make[2]: *** [applets/applets.o] Error 1
Makefile:372: recipe for target 'applets_dir' failed
make[1]: *** [applets_dir] Error 2
make[1]: Leaving directory
'/home/johan/Documents/buildroot/output/build/busybox-1.23.2'
package/pkg-generic.mk:156: recipe for target
'/home/johan/Documents/buildroot/output/build/busybox-1.23.2/.stamp_built'
failed
make: *** [/home/johan/Documents/buildroot/output/build/busybox-1.23.2/.stamp_built]
Error 2
----------8<----------8<----------8<----------8<----------8<----------8<----------

Any idea how to solve this error?

Best regards,
-- 
Johan
