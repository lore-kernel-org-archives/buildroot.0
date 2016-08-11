From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 15:07:06 +0200
Subject: [Buildroot] [git commit] toolchain: Bump ARC tools to
	arc-2016.09-eng008
Message-ID: <20160811131907.1161482132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0e1381ef91ac85ad4fc9ab3db30057279ffe7c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As described at:
4520524ba055706236db9f00dd79f1b2e2e87fde
this commit continues a series of updates of ARC tools.
This time we're updating tools to arc-2016.09-eng008.

Main updates were made for gcc. It was switched to GCC 6 and to
OSABI v4.

Besides this patch fixes buildroot ARC failures connected to
"crtbeginT.o" object file missing. This issue lead to two main errors:

1) "crtbeginT.o: No such file or directory", e. g. bootutils-1.0.0.
No comments are required here I hope.

2) Errors like "compiler cannot create executables", e.g.:
  a) host-gcc-final-arc-2016.09-eng007 static build,
  b) aespipe-2.4c.
That was caused because the test to determine if compiler is able to
create executables was failing due to missing "crtbeginT.o" file.

We still keep GDB as it is of arc-2016.03 release because there're some
issues we'd like to resolve before releasing it to wider audience.

So again note this is next engineering builds of arc-2016.09 series
and it might have all kinds of breakages, please don't use it for
production builds.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                    |   2 +-
 .../0300-ld-makefile.patch                         |   0
 .../0301-check-ldrunpath-length.patch              |   0
 .../0500-add-sysroot-fix-from-bug-3049.patch       |   0
 .../0600-poison-system-directories.patch           |   0
 .../0700-PIE-fixes-in-for-ARC-bfd.patch            |   0
 .../0701-Fixed-init-fini-linker-options.patch      |   0
 ...x-undefined-symbols-aborting-on-PIE-cases.patch |   0
 .../0800-Fixed-issue-in-tvheadend-package.patch    |   0
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   2 +-
 package/gcc/Config.in.host                         |   2 +-
 .../130-fix_build_with_gcc-6.patch                 | 153 ------------
 package/gcc/arc-2016.09-eng007/130-pr43538.patch   |  25 --
 .../305-libmudflap-susv3-legacy.patch              |  49 ----
 package/gcc/arc-2016.09-eng007/842-PR60155.patch   | 111 ---------
 .../850-libstdcxx-uclibc-c99.patch                 | 273 ---------------------
 .../arc-2016.09-eng007/851-PR-other-56780.patch    | 244 ------------------
 .../930-libgcc-disable-split-stack-nothreads.patch |  14 --
 .../301-missing-execinfo_h.patch                   |   6 +-
 .../gcc/arc-2016.09-eng008/860-cilk-wchar.patch    |  56 +++++
 .../940-uclinux-enable-threads.patch               |  19 ++
 package/gcc/gcc.hash                               |   2 +-
 23 files changed, 83 insertions(+), 877 deletions(-)

Patch is too large, so refusing to show it
