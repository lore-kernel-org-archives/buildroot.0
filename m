From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Nov 2017 21:30:39 +0000
Subject: [Buildroot] [Bug 10501] New: host-localedef fails to compile on
 Ubuntu 17.10
Message-ID: <bug-10501-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10501

            Bug ID: 10501
           Summary: host-localedef fails to compile on Ubuntu 17.10
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: m.hoffmann at cartelsol.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When trying to build the following defconfig I get a compile failure in
host-localedef.

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_GENERATE_LOCALE="en_US"

In file included from ./include/locale.h:1:0,
                 from /usr/include/libintl.h:103,
                 from ./include/libintl.h:2,
                 from glibc/locale/programs/charmap.c:25:
glibc/locale/locale.h:146:11: fatal error: xlocale.h: No such file or directory
 # include <xlocale.h>

(and some more of the same error)

This is on Ubuntu 17.10 with host gcc 7.2.0.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
