From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 02 May 2020 17:58:47 +0000
Subject: [Buildroot] [Bug 12836] New: libunwind: package does not show up in
 menuconfig for aarch64 target
Message-ID: <bug-12836-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12836

            Bug ID: 12836
           Summary: libunwind: package does not show up in menuconfig for
                    aarch64 target
           Product: buildroot
           Version: 2020.02.1
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: seems.deviant at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The libunwind won't show up in menuconfig for aarch64 target because of an
unmet BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS dependency.

This is strange, because:

  - the official https://github.com/libunwind/libunwind claims that aarch64
linux is fully supported
  - the minimal handcrafted config featuring libunwind works fine. 

The minimal config that I've tested was:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_LIBUNWIND=y


This occurs on "e30eaeb10e package/qemu: disable curl for the host variant"

-- 
You are receiving this mail because:
You are on the CC list for the bug.
