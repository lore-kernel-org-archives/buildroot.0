From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Dec 2016 08:38:45 +0000
Subject: [Buildroot] [Bug 9486] New: xorg-server 1.19 fails to compile for
 glibc with systems init (x86_64)
Message-ID: <bug-9486-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9486

            Bug ID: 9486
           Summary: xorg-server 1.19 fails to compile for glibc with
                    systems init (x86_64)
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mail at waldemar-brodkorb.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

when trying to compile xorg server package for x86_64 with glibc/systemd
enabled, I get
following build error:

./../../../miext/damage -I../../../../render -I../../../../randr
-I../../../../fb -I../../../../dbe -I../../../../present -fvisibility=hidden
-DHAVE_XORG_CONFIG_H -fvisibility=hidden
-I/home/wbx/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include
-I/home/wbx/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include
-DHAVE_ACPI -DHAVE_APM
-I/home/wbx/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/dbus-1.0
-I/home/wbx/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/dbus-1.0/include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-I/home/wbx/buildroot/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/pixman-1
-O2 -pthread -c systemd-logind.c  -fPIC -DPIC -o .libs/systemd-logind.o
systemd-logind.c: In function ?systemd_logind_vtenter?:
systemd-logind.c:248:21: error: ?xf86_num_platform_devices? undeclared (first
use in this function)
     for (i = 0; i < xf86_num_platform_devices; i++) {
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
systemd-logind.c:248:21: note: each undeclared identifier is reported only once
for each function it appears in
systemd-logind.c:249:13: error: ?xf86_platform_devices? undeclared (first use
in this function)
         if (xf86_platform_devices[i].flags & XF86_PDEV_PAUSED)
             ^~~~~~~~~~~~~~~~~~~~~
Makefile:670: recipe for target 'systemd-logind.lo' failed
make[6]: *** [systemd-logind.lo] Er

Reproducible with git master from today with qemu defconfig
qemu_x86_64_defconfig. Afterwards change to glibc and enable systemd as init.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
