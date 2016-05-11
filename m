From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 May 2016 23:06:45 +0200
Subject: [Buildroot] [git commit branch/next] toolchain: bump ARC tools to
	arc-2016.03-rc2
Message-ID: <20160511211155.97FBD7FE2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adbdc6e58f2b387dc4200f2acbf9cc307cbc8838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This change switches ARC tools to RC2 of the most recent arc-2016.03
version.

Essentially once final release is ready version will be bumped again.

ARC GNU tools of version arc-2016.03 bring some quite significant
changes like:
 * Binutils v2.26+ (upstream commit id 202ac19 with additional ARC patches)
 * GCC v4.8.5
 * GDB 7.10

More about changes, improvements and fixes could be found here:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2016.03-rc2

Also in this change we realign custom Buildroot patches for binutils and
gcc for ARC tools. Looks like earlier most of arch-independent patches
for binutils and gcc were either unintentionally removed or not even
added in patch folders for ARC's binutils and gcc. Now arch-independent
patches for binutils-2.26 and gcc-4.8.5 were added in
package/{binutils|gcc}/arc-2016.03-rc2 folders.

Build and run-tested in nSIM for both ARC700 and ARC HS38.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                    |   2 +-
 .../binutils/arc-2015.12/0001-PR-other-56780.patch | 236 ---------------------
 .../arc-2016.03-rc2/0300-ld-makefile.patch         |  41 ++++
 .../0301-check-ldrunpath-length.patch              |  36 ++++
 .../0500-add-sysroot-fix-from-bug-3049.patch       |  52 +++++
 .../0600-poison-system-directories.patch}          | 217 ++++++++++---------
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   2 +-
 package/gcc/Config.in.host                         |   2 +-
 ...900-UPDATE-Fix-handling-complex-PIC-moves.patch | 103 ---------
 ...01-UPDATE1-Fix-handling-complex-PIC-moves.patch |  83 --------
 ...950-Don-t-allow-mcompact-casesi-for-ARCv2.patch | 100 ---------
 package/gcc/arc-2016.03-rc2/130-pr43538.patch      |  25 +++
 .../arc-2016.03-rc2/301-missing-execinfo_h.patch   |  13 ++
 .../305-libmudflap-susv3-legacy.patch              |  49 +++++
 package/gcc/arc-2016.03-rc2/842-PR60155.patch      | 111 ++++++++++
 .../850-libstdcxx-uclibc-c99.patch}                |   4 +-
 .../851-PR-other-56780.patch                       |   0
 .../930-libgcc-disable-split-stack-nothreads.patch |  14 ++
 package/gcc/gcc.hash                               |   2 +-
 package/gdb/Config.in.host                         |   2 +-
 package/gdb/gdb.hash                               |   2 +-
 22 files changed, 472 insertions(+), 626 deletions(-)

Patch is too large, so refusing to show it
