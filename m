From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:09:02 +0200
Subject: [Buildroot] [PATCH 0/4] Update binutils package
Message-ID: <20170729130906.2140-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series:

 * Update binutils 2.28.x to 2.28.1 (instead of 2.28)

 * Adds support for binutils 2.29.

 * Moves to using binutils 2.28.x as the default binutils version
   instead f 2.27.

 * Removes support for the older binutils 2.26.x.

It has been tested by building qemu_arm_vexpress_defconfig with both
binutils 2.28.1 and binutils 2.29, and checking that the system boots
fine under Qemu.

Best regards,

Thomas

Thomas Petazzoni (4):
  binutils: bump 2.28.x series to 2.28.1
  binutils: add support for binutils 2.29
  binutils: switch to use 2.28.x as the default version
  binutils: remove support for 2.26

 Config.in.legacy                                   |   8 ++
 package/binutils/2.26.1/0800-microblaze-musl.patch |  23 ----
 ...900-Correct-nios2-_gp-address-computation.patch | 108 ---------------
 ...on-reduce-number-of-messages-about-FDE-en.patch |  67 ---------
 ...-xtensa-fix-signedness-of-gas-relocations.patch | 101 --------------
 ...03-xtensa-fix-.init-.fini-literals-moving.patch | 149 ---------------------
 .../binutils/2.26.1/0904-bfin-fdpic-upstream.patch |  30 -----
 .../binutils/2.26.1/0905-bfin-rofixup-bug.patch    |  21 ---
 .../binutils/2.26.1/0906-microblaze-pr21180.patch  |  33 -----
 .../binutils/{2.28 => 2.28.1}/0120-sh-conf.patch   |   0
 .../{2.28 => 2.28.1}/0300-ld-makefile.patch        |   0
 .../0301-check-ldrunpath-length.patch              |   0
 .../0500-add-sysroot-fix-from-bug-3049.patch       |   0
 .../0600-poison-system-directories.patch           |   0
 .../{2.28 => 2.28.1}/0905-bfin-rofixup-bug.patch   |   0
 .../{2.28 => 2.28.1}/0906-microblaze-pr21180.patch |   0
 .../0120-sh-conf.patch => 2.29/0001-sh-conf.patch} |  22 +--
 .../0002-ld-makefile.patch}                        |  10 +-
 .../0003-check-ldrunpath-length.patch}             |  22 +--
 .../0004-add-sysroot-fix-from-bug-3049.patch}      |  23 ++--
 .../0005-poison-system-directories.patch}          |  56 ++++----
 ...LINKER-BUG-.rofixup-section-size-mismatch.patch |  31 +++++
 package/binutils/Config.in.host                    |  15 +--
 package/binutils/binutils.hash                     |   4 +-
 package/binutils/binutils.mk                       |   8 +-
 25 files changed, 122 insertions(+), 609 deletions(-)
 delete mode 100644 package/binutils/2.26.1/0800-microblaze-musl.patch
 delete mode 100644 package/binutils/2.26.1/0900-Correct-nios2-_gp-address-computation.patch
 delete mode 100644 package/binutils/2.26.1/0901-Fix-assertion-reduce-number-of-messages-about-FDE-en.patch
 delete mode 100644 package/binutils/2.26.1/0902-xtensa-fix-signedness-of-gas-relocations.patch
 delete mode 100644 package/binutils/2.26.1/0903-xtensa-fix-.init-.fini-literals-moving.patch
 delete mode 100644 package/binutils/2.26.1/0904-bfin-fdpic-upstream.patch
 delete mode 100644 package/binutils/2.26.1/0905-bfin-rofixup-bug.patch
 delete mode 100644 package/binutils/2.26.1/0906-microblaze-pr21180.patch
 rename package/binutils/{2.28 => 2.28.1}/0120-sh-conf.patch (100%)
 rename package/binutils/{2.28 => 2.28.1}/0300-ld-makefile.patch (100%)
 rename package/binutils/{2.28 => 2.28.1}/0301-check-ldrunpath-length.patch (100%)
 rename package/binutils/{2.28 => 2.28.1}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
 rename package/binutils/{2.28 => 2.28.1}/0600-poison-system-directories.patch (100%)
 rename package/binutils/{2.28 => 2.28.1}/0905-bfin-rofixup-bug.patch (100%)
 rename package/binutils/{2.28 => 2.28.1}/0906-microblaze-pr21180.patch (100%)
 rename package/binutils/{2.26.1/0120-sh-conf.patch => 2.29/0001-sh-conf.patch} (70%)
 rename package/binutils/{2.26.1/0300-ld-makefile.patch => 2.29/0002-ld-makefile.patch} (85%)
 rename package/binutils/{2.26.1/0301-check-ldrunpath-length.patch => 2.29/0003-check-ldrunpath-length.patch} (62%)
 rename package/binutils/{2.26.1/0500-add-sysroot-fix-from-bug-3049.patch => 2.29/0004-add-sysroot-fix-from-bug-3049.patch} (69%)
 rename package/binutils/{2.26.1/0600-poison-system-directories.patch => 2.29/0005-poison-system-directories.patch} (88%)
 create mode 100644 package/binutils/2.29/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch

-- 
2.9.4
