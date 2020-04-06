From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Mon, 6 Apr 2020 11:38:01 +0000
Subject: [Buildroot] Strange non-deterministic error while building
 buildroot 2020.02 package iio-tools
Message-ID: <04a6cac9-7763-db6d-b3c5-d6156b374196@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Has anyone encountered such error?
Attempting to build it again works... however it stopped at this error 
several times when building (10 % of cases)

At first I suspected my file system, but, why does this crash happen all 
the time in the same place ?

Thanks in advance !

 >>> linux-tools  Building
PATH="/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/bin:/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" 
/usr/bin/make -j41 -C 
/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/build/linux-linux-5.4-at91/tools/iio 
HOSTCC="/usr/bin/gcc -O2 
-I/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/include 
-L/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/lib 
-Wl,-rpath,/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/lib" 
ARCH=arm 
INSTALL_MOD_PATH=/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/target 
CROSS_COMPILE="/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/bin/arm-buildroot-linux-gnueabihf-" 
DEPMOD=/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/sbin/depmod 
INSTALL_MOD_STRIP=1
mkdir -p include/linux/iio 2>&1 || true
ln -sf 
/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/build/linux-linux-5.4-at91/tools/iio/../../include/uapi/linux/iio/events.h 
include/linux/iio
ln -sf 
/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/build/linux-linux-5.4-at91/tools/iio/../../include/uapi/linux/iio/types.h 
include/linux/iio
   CC       iio_event_monitor.o
   CC       lsiio.o
   CC       iio_utils.o
   CC       iio_generic_buffer.o
   CC       iio_utils.o
   CC       iio_utils.o
   LD       iio_event_monitor-in.o
   LD       iio_generic_buffer-in.o
/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/host/bin/arm-buildroot-linux-gnueabihf-ld: 
iio_utils.o: file not recognized: file truncated
/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/build/linux-linux-5.4-at91/tools/build/Makefile.build:144: 
recipe for target 'iio_generic_buffer-in.o' failed
make[3]: *** [iio_generic_buffer-in.o] Error 1
Makefile:49: recipe for target 'iio_generic_buffer-in.o' failed
make[2]: *** [iio_generic_buffer-in.o] Error 2
make[2]: *** Waiting for unfinished jobs....
   LD       lsiio-in.o
package/pkg-generic.mk:266: recipe for target 
'/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/build/linux-tools/.stamp_built' 
failed
make[1]: *** 
[/home/eugen/release-scripts-2004/build/buildroot/buildroot-at91/output/build/linux-tools/.stamp_built] 
Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2
Buildroot: failed to make
