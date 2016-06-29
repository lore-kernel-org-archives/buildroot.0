From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jun 2016 22:12:47 +0200
Subject: [Buildroot] [git commit] toolchain: Bump ARC tools to
	arc-2016.09-eng005
Message-ID: <20160629201352.F089582162@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4520524ba055706236db9f00dd79f1b2e2e87fde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this commit we're starting a series of updates of ARC tools.
Significantly rewritten arc-2016.03 tools introduced way too many
problems highlighted by Buildroot autobuilder. Now in attempt to
resolve as many issues as possible by the time final release of
arc-2016.09 tools is cut we'll be executing arc-2016.09 series
with engineering snapshots like this one.

We decided to go this way instead of applying separate patches here
and there because ongoing development introduces quite a lot of
changes and separate patches are not practical in Buildroot.

Moreover this will give us very clean visibility of number of
issues we see (hopefully it will decrease over time).

One of the important changes introduced in this engineering build
is initial set of changes for proper support of PIE on ARC in terms
of both building on host and running on ARC target. I expect some
PIE-related build breakages to go away and new ones will be treated
as the high-priority issues to be fixed ASAP.

For now we only update Binutils and GCC while keeping GDB
as it is of arc-2016.03 release because there're some issues
we'd like to resolve before releasing it to wider audience.

So again note this is one of the first engineering builds of
arc-2016.09 series and it might have all kinds of breakages,
please don't use it for production builds.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                    |  2 +-
 ...ith-dynamic-relocs-not-being-generated-wi.patch | 34 ----------------------
 .../0300-ld-makefile.patch                         |  0
 .../0301-check-ldrunpath-length.patch              |  0
 .../0500-add-sysroot-fix-from-bug-3049.patch       |  0
 .../0600-poison-system-directories.patch           |  0
 ...t-build-failures-when-makeinfo-is-missing.patch |  0
 package/binutils/binutils.hash                     |  2 +-
 package/binutils/binutils.mk                       |  2 +-
 package/gcc/Config.in.host                         |  2 +-
 .../130-fix_build_with_gcc-6.patch                 |  0
 .../130-pr43538.patch                              |  0
 .../301-missing-execinfo_h.patch                   |  0
 .../305-libmudflap-susv3-legacy.patch              |  0
 .../842-PR60155.patch                              |  0
 .../850-libstdcxx-uclibc-c99.patch                 |  0
 .../851-PR-other-56780.patch                       |  0
 .../930-libgcc-disable-split-stack-nothreads.patch |  0
 package/gcc/gcc.hash                               |  2 +-
 19 files changed, 5 insertions(+), 39 deletions(-)

Patch is too large, so refusing to show it
