From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Apr 2020 01:17:44 +0000
Subject: [Buildroot] [Bug 12786] New: Systemd spawns two getty processes
 when the getty port is set to console
Message-ID: <bug-12786-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12786

            Bug ID: 12786
           Summary: Systemd spawns two getty processes when the getty port
                    is set to console
           Product: buildroot
           Version: 2020.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: aduskett at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Very straight forward.

When systemd is selected as the init system, and BR2_TARGET_GENERIC_GETTY_PORT
is set to console, two gettys are spawned which prevents a user from logging
in.

How to reproduce:

make qemu_x86_64_defconfig
menuconfig -> System configuration -> Init system -> systemd
make

Then run the resulting image.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
