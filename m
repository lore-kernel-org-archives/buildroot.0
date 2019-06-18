From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 18 Jun 2019 14:34:25 +0000
Subject: [Buildroot] [Bug 11966] New: Valgrind segfaults on startup on armhf
Message-ID: <bug-11966-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11966

            Bug ID: 11966
           Summary: Valgrind segfaults on startup on armhf
           Product: buildroot
           Version: 2019.02
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: andreas.kremser.ext at b-plus.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When upgrading buildroot 2018.02.9 to buildroot 2019.02 valgrind begins to
segfault at startup on our armhf Target, while it runs successfully on aarch64.

The problem occurs on VALGRIND_VERSION=3.14

changing the recipe to build 
VALGRIND_VERSION=3.12
with  0004-Fixes-for-musl-libc.patch
and without 0003-configure.ac-disable-gcc-march-mips64r2-detection.patch

enables valgrind to start successfully again.

We use the following toolchain:
https://releases.linaro.org/components/toolchain/binaries/7.2-2017.11/arm-linux-gnueabihf/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf.tar.xz

Changing the compiler to 7.4-2019.02 or 6.5-2018.12 does not make a difference.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
