From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 May 2016 21:12:38 +0200
Subject: [Buildroot] [git commit branch/next] toolchain: bump ARC tools to
	arc-2016.03 release
Message-ID: <20160519191335.5974381F9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09439560b9f959e4477155eb1b2963e33c43db73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This change switches ARC tools to the most recent arc-2016.03
version.

ARC GNU tools of version arc-2016.03 bring some quite significant
changes like:
 * Binutils v2.26+ (upstream commit id 202ac19 with additional ARC
 * patches)
 * GCC v4.8.5
 * GDB 7.10

More about changes, improvements and fixes could be found here:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2016.03

Note in this change we're adding sha512 checksums for
both binutils and gcc tarballs fetched from GitHub.

Build and run-tested in nSIM for both ARC700 and ARC HS38.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                                      | 2 +-
 .../binutils/{arc-2016.03-rc2 => arc-2016.03}/0300-ld-makefile.patch | 0
 .../0301-check-ldrunpath-length.patch                                | 0
 .../0500-add-sysroot-fix-from-bug-3049.patch                         | 0
 .../0600-poison-system-directories.patch                             | 0
 package/binutils/binutils.hash                                       | 5 +++--
 package/binutils/binutils.mk                                         | 2 +-
 package/gcc/Config.in.host                                           | 2 +-
 package/gcc/{arc-2016.03-rc2 => arc-2016.03}/130-pr43538.patch       | 0
 .../{arc-2016.03-rc2 => arc-2016.03}/301-missing-execinfo_h.patch    | 0
 .../305-libmudflap-susv3-legacy.patch                                | 0
 package/gcc/{arc-2016.03-rc2 => arc-2016.03}/842-PR60155.patch       | 0
 .../{arc-2016.03-rc2 => arc-2016.03}/850-libstdcxx-uclibc-c99.patch  | 0
 .../gcc/{arc-2016.03-rc2 => arc-2016.03}/851-PR-other-56780.patch    | 0
 .../930-libgcc-disable-split-stack-nothreads.patch                   | 0
 package/gcc/gcc.hash                                                 | 5 +++--
 package/gdb/Config.in.host                                           | 2 +-
 package/gdb/gdb.hash                                                 | 2 +-
 18 files changed, 11 insertions(+), 9 deletions(-)

Patch is too large, so refusing to show it
