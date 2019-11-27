From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Nov 2019 15:42:49 +0000
Subject: [Buildroot] [Bug 12366] New: Gstreamer1 gst1-plugins-bad do not
 compile with RPI-Userland
Message-ID: <bug-12366-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12366

            Bug ID: 12366
           Summary: Gstreamer1 gst1-plugins-bad do not compile with
                    RPI-Userland
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: t.ruschival at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When selecting gst1-plugins-bad (e.g. i3tag, speed) the meson build fails if
RPI-USERLAND has not been built before.

This is probably caused by commit #5d6c408e953 (Adam Duskett 2019-07-13
17:43:19) where special handling for RPI-USERLAND paths was added to
GST1_PLUGINS_BAD_CFLAGS.

After manually building of rpi-userland with make rpi-userland-rebuild, the
build for gst1-plugins-bad works.

Below the error log of /gst1-plugins-bad-1.16.1/build/meson-logs/meson-log.txt

-----
Sanity check compile stderr:

-----
Running test binary command:
/home/ruschi/tmp/rpi0w_defconfig/build/gst1-plugins-bad-1.16.1/build/meson-private/sanitycheckcpp.exe
C++ compiler for the build machine: c++ (gcc 9.2.1 "c++ (Debian 9.2.1-19) 9.2.1
20191109")
C++ linker for the build machine: GNU ld.bfd 2.33.1
Sanity testing C compiler:
/home/ruschi/tmp/rpi0w_defconfig/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
Is cross compiler: True.
Sanity check compiler command line:
/home/ruschi/tmp/rpi0w_defconfig/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
/home/ruschi/tmp/rpi0w_defconfig/build/gst1-plugins-bad-1.16.1/build/mrpi0w_defconfig/build/gst1-plugins-bad-1.16.1/build/meson-private/sanitycheckc_cross.exe
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
/home/ruschi/tmp/rpi0w_defconfig/husr/include/IL
/home/ruschi/tmp/rpi0w_defconfig/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/interface/vcos/pthreads
/home/ruschi/tmp/rpi0w_defconfig/host/arm-buildroot-lin/vmcs_host/linux -pipe
-D_FILE_OFFSET_BITS=64 -c
Sanity check compile stdout:

-----
Sanity check compile stderr:
arm-buildroot-linux-uclibcgnueabihf-gcc.br_real: error:
/home/ruschi/tmp/rpi0w_defconfig/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/IL:
No such file or directory
arm-buildroot-linux-uclibcgnueabihf-gcc.br_real: error:
/home/ruschi/tmp/rpi0w_defconfig/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/interface/vcos/pthreads:
No such file 
arm-buildroot-linux-uclibcgnueabihf-gcc.br_real: error:
/home/ruschi/tmp/rpi0w_defconfig/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/interface/vmcs_host/linux:
No such fil

-----

-- 
You are receiving this mail because:
You are on the CC list for the bug.
