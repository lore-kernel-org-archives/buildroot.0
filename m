From: David De Grave <buildroot@ledav.net>
Date: Mon, 13 Aug 2018 22:31:59 +0200
Subject: [Buildroot] 2018-08-RC1 & Master
Message-ID: <871d7b472ccbb5d9d4232f74de77c01e@ledav.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tried to upgrade buildroot from 2018.05.1 to 2018.08-RC1 but I have 
the following error when compiling Linux:

>>> linux 4.14.56-ti-r64 Configuring
>>> linux 4.14.56-ti-r64 Building
PATH="/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/bin:/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/sbin:/usr/lib64/qt-3.3/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/indians/.local/bin:/home/indians/bin" 
BR_BINARIES_DIR=/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/images 
/usr/bin/make -j9 
HOSTCC="/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/bin/ccache 
/usr/lib64/ccache/gcc -O2 
-I/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include 
-L/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/lib 
-Wl,-rpath,/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/lib" 
ARCH=arm 
INSTALL_MOD_PATH=/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/target 
CROSS_COMPILE="/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/bin/arm-buildroot-linux-uclibcgnueabihf-" 
DEPMOD=/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/sbin/depmod 
INSTALL_MOD_STRIP=1 -C 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/build/linux-4.14.56-ti-r64 
zImage

[...]

   HOSTCC  scripts/dtc/libfdt/fdt_sw.o
   HOSTLD  scripts/mod/modpost
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:82:24: 
error: redefinition of ?fdt16_to_cpu?
  static inline uint16_t fdt16_to_cpu(fdt16_t x)
                         ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:81:24: note: previous definition of 
?fdt16_to_cpu? was here
  static inline uint16_t fdt16_to_cpu(fdt16_t x)
                         ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:86:23: 
error: redefinition of ?cpu_to_fdt16?
  static inline fdt16_t cpu_to_fdt16(uint16_t x)
                        ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:85:23: note: previous definition of 
?cpu_to_fdt16? was here
  static inline fdt16_t cpu_to_fdt16(uint16_t x)
                        ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:91:24: 
error: redefinition of ?fdt32_to_cpu?
  static inline uint32_t fdt32_to_cpu(fdt32_t x)
                         ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:90:24: note: previous definition of 
?fdt32_to_cpu? was here
  static inline uint32_t fdt32_to_cpu(fdt32_t x)
                         ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:95:23: 
error: redefinition of ?cpu_to_fdt32?
  static inline fdt32_t cpu_to_fdt32(uint32_t x)
                        ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:94:23: note: previous definition of 
?cpu_to_fdt32? was here
  static inline fdt32_t cpu_to_fdt32(uint32_t x)
                        ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:100:24: 
error: redefinition of ?fdt64_to_cpu?
  static inline uint64_t fdt64_to_cpu(fdt64_t x)
                         ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:99:24: note: previous definition of 
?fdt64_to_cpu? was here
  static inline uint64_t fdt64_to_cpu(fdt64_t x)
                         ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:104:23: 
error: redefinition of ?cpu_to_fdt64?
  static inline fdt64_t cpu_to_fdt64(uint64_t x)
                        ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:103:23: note: previous definition of 
?cpu_to_fdt64? was here
  static inline fdt64_t cpu_to_fdt64(uint64_t x)
                        ^~~~~~~~~~~~
make[4]: *** [scripts/Makefile.host:119: scripts/dtc/libfdt/fdt.o] Error 
1
make[4]: *** Waiting for unfinished jobs....
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt_sw.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:82:24: 
error: redefinition of ?fdt16_to_cpu?
  static inline uint16_t fdt16_to_cpu(fdt16_t x)
                         ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt_sw.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:81:24: note: previous definition of 
?fdt16_to_cpu? was here
  static inline uint16_t fdt16_to_cpu(fdt16_t x)
                         ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt_sw.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:86:23: 
error: redefinition of ?cpu_to_fdt16?
  static inline fdt16_t cpu_to_fdt16(uint16_t x)
                        ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt_sw.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:85:23: note: previous definition of 
?cpu_to_fdt16? was here
  static inline fdt16_t cpu_to_fdt16(uint16_t x)
                        ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt_sw.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:91:24: 
error: redefinition of ?fdt32_to_cpu?
  static inline uint32_t fdt32_to_cpu(fdt32_t x)
                         ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt_sw.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:90:24: note: previous definition of 
?fdt32_to_cpu? was here
  static inline uint32_t fdt32_to_cpu(fdt32_t x)
                         ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt_sw.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:95:23: 
error: redefinition of ?cpu_to_fdt32?
  static inline fdt32_t cpu_to_fdt32(uint32_t x)
                        ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt_sw.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:94:23: note: previous definition of 
?cpu_to_fdt32? was here
  static inline fdt32_t cpu_to_fdt32(uint32_t x)
                        ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt_sw.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:100:24: 
error: redefinition of ?fdt64_to_cpu?
  static inline uint64_t fdt64_to_cpu(fdt64_t x)
                         ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt_sw.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:99:24: note: previous definition of 
?fdt64_to_cpu? was here
  static inline uint64_t fdt64_to_cpu(fdt64_t x)
                         ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt_sw.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:104:23: 
error: redefinition of ?cpu_to_fdt64?
  static inline fdt64_t cpu_to_fdt64(uint64_t x)
                        ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt_sw.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:103:23: note: previous definition of 
?cpu_to_fdt64? was here
  static inline fdt64_t cpu_to_fdt64(uint64_t x)
                        ^~~~~~~~~~~~
make[4]: *** [scripts/Makefile.host:119: scripts/dtc/libfdt/fdt_sw.o] 
Error 1
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt_ro.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:82:24: 
error: redefinition of ?fdt16_to_cpu?
  static inline uint16_t fdt16_to_cpu(fdt16_t x)
                         ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt_ro.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:81:24: note: previous definition of 
?fdt16_to_cpu? was here
  static inline uint16_t fdt16_to_cpu(fdt16_t x)
                         ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt_ro.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:86:23: 
error: redefinition of ?cpu_to_fdt16?
  static inline fdt16_t cpu_to_fdt16(uint16_t x)
                        ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt_ro.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:85:23: note: previous definition of 
?cpu_to_fdt16? was here
  static inline fdt16_t cpu_to_fdt16(uint16_t x)
                        ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt_ro.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:91:24: 
error: redefinition of ?fdt32_to_cpu?
  static inline uint32_t fdt32_to_cpu(fdt32_t x)
                         ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt_ro.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:90:24: note: previous definition of 
?fdt32_to_cpu? was here
  static inline uint32_t fdt32_to_cpu(fdt32_t x)
                         ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt_ro.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:95:23: 
error: redefinition of ?cpu_to_fdt32?
  static inline fdt32_t cpu_to_fdt32(uint32_t x)
                        ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt_ro.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:94:23: note: previous definition of 
?cpu_to_fdt32? was here
  static inline fdt32_t cpu_to_fdt32(uint32_t x)
                        ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt_ro.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:100:24: 
error: redefinition of ?fdt64_to_cpu?
  static inline uint64_t fdt64_to_cpu(fdt64_t x)
                         ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt_ro.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:99:24: note: previous definition of 
?fdt64_to_cpu? was here
  static inline uint64_t fdt64_to_cpu(fdt64_t x)
                         ^~~~~~~~~~~~
In file included from 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt.h:54:0,
                  from scripts/dtc/libfdt/fdt_ro.c:54:
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/host/include/libfdt_env.h:104:23: 
error: redefinition of ?cpu_to_fdt64?
  static inline fdt64_t cpu_to_fdt64(uint64_t x)
                        ^~~~~~~~~~~~
In file included from scripts/dtc/libfdt/fdt_ro.c:51:0:
scripts/dtc/libfdt/libfdt_env.h:103:23: note: previous definition of 
?cpu_to_fdt64? was here
  static inline fdt64_t cpu_to_fdt64(uint64_t x)
                        ^~~~~~~~~~~~
make[4]: *** [scripts/Makefile.host:119: scripts/dtc/libfdt/fdt_ro.o] 
Error 1
make[3]: *** [scripts/Makefile.build:587: scripts/dtc] Error 2
make[3]: *** Waiting for unfinished jobs....
   CHK     include/generated/asm-offsets.h
   UPD     include/generated/asm-offsets.h
   CALL    scripts/checksyscalls.sh
make[2]: *** [Makefile:564: scripts] Error 2
make[1]: *** [package/pkg-generic.mk:232: 
/home/indians/vmshare/Devel/bbb-station/o-bbb-station_beaglebone/build/linux-4.14.56-ti-r64/.stamp_built] 
Error 2
make: *** [Makefile:79: _all] Error 2
make: Leaving directory 
'/home/indians/vmshare/Devel/bbb-station/buildroot'

I tested the "master" also, same problem.
I'm building a project for the beaglebone black wireless board with the 
Linux from TI.

Did someone had the same issue ?

Regards,
David.
