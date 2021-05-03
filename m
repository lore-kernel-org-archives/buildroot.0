From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 03 May 2021 11:55:34 +0000
Subject: [Buildroot] [Bug 13786] New: Fail to compile LTP on sh4
Message-ID: <bug-13786-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13786

            Bug ID: 13786
           Summary: Fail to compile LTP on sh4
           Product: buildroot
           Version: 2021.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: remi.duraffort at linaro.org
                CC: buildroot at uclibc.org
  Target Milestone: ---

LTP test suite cannot be compiled for sh4-r2d

defconfig important pieces
==========
# Architecture
BR2_sh=y
BR2_sh4=y

# Packages
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_LTP_TESTSUITE=y
==========


Error
==========
>>> ltp-testsuite 20210121 Building
[...]
In file included from ../../include/libsigwait.h:11,
                 from sigwait.c:9:
../../include/tst_timer.h:103:8: error: redefinition of ?struct
__kernel_old_timeval?
  103 | struct __kernel_old_timeval {
      |        ^~~~~~~~~~~~~~~~~~~~
In file included from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/sockios.h:5,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm-generic/socket.h:6,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/socket.h:1,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/bits/socket.h:362,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/sys/socket.h:39,
                 from ../../include/tst_safe_net.h:9,
                 from ../../include/tst_test.h:96,
                 from ../../include/libsigwait.h:10,
                 from sigwait.c:9:
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/linux/time_types.h:25:8:
note: originally defined here
   25 | struct __kernel_old_timeval {
      |        ^~~~~~~~~~~~~~~~~~~~
In file included from ../../include/libsigwait.h:11,
                 from sigwait.c:9:
../../include/tst_timer.h:109:8: error: redefinition of ?struct
__kernel_old_timespec?
  109 | struct __kernel_old_timespec {
      |        ^~~~~~~~~~~~~~~~~~~~~
In file included from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/sockios.h:5,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm-generic/socket.h:6,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/socket.h:1,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/bits/socket.h:362,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/sys/socket.h:39,
                 from ../../include/tst_safe_net.h:9,
                 from ../../include/tst_test.h:96,
                 from ../../include/libsigwait.h:10,
                 from sigwait.c:9:
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/linux/time_types.h:31:8:
note: originally defined here
   31 | struct __kernel_old_timespec {
      |        ^~~~~~~~~~~~~~~~~~~~~
In file included from ../../include/libsigwait.h:11,
                 from sigwait.c:9:
../../include/tst_timer.h:116:8: error: redefinition of ?struct
__kernel_timespec?
  116 | struct __kernel_timespec {
      |        ^~~~~~~~~~~~~~~~~
In file included from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/sockios.h:5,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm-generic/socket.h:6,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/socket.h:1,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/bits/socket.h:362,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/sys/socket.h:39,
                 from ../../include/tst_safe_net.h:9,
                 from ../../include/tst_test.h:96,
                 from ../../include/libsigwait.h:10,
                 from sigwait.c:9:
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/linux/time_types.h:7:8:
note: originally defined here
    7 | struct __kernel_timespec {
      |        ^~~~~~~~~~~~~~~~~
In file included from ../../include/libsigwait.h:11,
                 from sigwait.c:9:
../../include/tst_timer.h:126:8: error: redefinition of ?struct
__kernel_itimerspec?
  126 | struct __kernel_itimerspec {
      |        ^~~~~~~~~~~~~~~~~~~
In file included from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/sockios.h:5,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm-generic/socket.h:6,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/socket.h:1,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/bits/socket.h:362,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/sys/socket.h:39,
                 from ../../include/tst_safe_net.h:9,
                 from ../../include/tst_test.h:96,
                 from ../../include/libsigwait.h:10,
                 from sigwait.c:9:
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/linux/time_types.h:12:8:
note: originally defined here
   12 | struct __kernel_itimerspec {
      |        ^~~~~~~~~~~~~~~~~~~
In file included from tst_clocks.c:10:
../include/tst_timer.h:103:8: error: redefinition of ?struct
__kernel_old_timeval?
  103 | struct __kernel_old_timeval {
      |        ^~~~~~~~~~~~~~~~~~~~
In file included from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/sockios.h:5,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm-generic/socket.h:6,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/socket.h:1,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/bits/socket.h:362,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/sys/socket.h:39,
                 from ../include/tst_safe_net.h:9,
                 from ../include/tst_test.h:96,
                 from tst_clocks.c:9:
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/linux/time_types.h:25:8:
note: originally defined here
   25 | struct __kernel_old_timeval {
      |        ^~~~~~~~~~~~~~~~~~~~
In file included from tst_clocks.c:10:
../include/tst_timer.h:109:8: error: redefinition of ?struct
__kernel_old_timespec?
  109 | struct __kernel_old_timespec {
      |        ^~~~~~~~~~~~~~~~~~~~~
In file included from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/sockios.h:5,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm-generic/socket.h:6,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/socket.h:1,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/bits/socket.h:362,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/sys/socket.h:39,
                 from ../include/tst_safe_net.h:9,
                 from ../include/tst_test.h:96,
                 from tst_clocks.c:9:
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/linux/time_types.h:31:8:
note: originally defined here
   31 | struct __kernel_old_timespec {
      |        ^~~~~~~~~~~~~~~~~~~~~
In file included from tst_clocks.c:10:
../include/tst_timer.h:116:8: error: redefinition of ?struct __kernel_timespec?
  116 | struct __kernel_timespec {
      |        ^~~~~~~~~~~~~~~~~
In file included from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/sockios.h:5,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm-generic/socket.h:6,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/socket.h:1,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/bits/socket.h:362,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/sys/socket.h:39,
                 from ../include/tst_safe_net.h:9,
                 from ../include/tst_test.h:96,
                 from tst_clocks.c:9:
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/linux/time_types.h:7:8:
note: originally defined here
    7 | struct __kernel_timespec {
      |        ^~~~~~~~~~~~~~~~~
In file included from tst_clocks.c:10:
../include/tst_timer.h:126:8: error: redefinition of ?struct
__kernel_itimerspec?
  126 | struct __kernel_itimerspec {
      |        ^~~~~~~~~~~~~~~~~~~
In file included from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/sockios.h:5,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm-generic/socket.h:6,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/asm/socket.h:1,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/bits/socket.h:362,
                 from
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/sys/socket.h:39,
                 from ../include/tst_safe_net.h:9,
                 from ../include/tst_test.h:96,
                 from tst_clocks.c:9:
/builds/sh4/host/sh4-buildroot-linux-uclibc/sysroot/usr/include/linux/time_types.h:12:8:
note: originally defined here
   12 | struct __kernel_itimerspec {
      |        ^~~~~~~~~~~~~~~~~~~
make[4]: *** [../include/mk/rules.mk:7: tst_clocks.o] Error 1
make[4]: *** Waiting for unfinished jobs....
CC lib/tst_cpu.o
make[5]: *** [../../include/mk/rules.mk:7: sigwait.o] Error 1
make[4]: *** [../include/mk/generic_trunk_target.inc:105: all] Error 2
make[3]: *** [Makefile:108: libs-all] Error 2
make[3]: *** Waiting for unfinished jobs....
CC lib/tst_crypto.o
CC lib/tst_device.o
make[3]: *** [Makefile:108: lib-all] Error 2
make[2]: *** [package/pkg-generic.mk:250:
/builds/sh4/build/ltp-testsuite-20210121/.stamp_built] Error 2
make[1]: *** [Makefile:23: _all] Error 2
make[1]: Leaving directory '/builds/sh4'
==========

-- 
You are receiving this mail because:
You are on the CC list for the bug.
