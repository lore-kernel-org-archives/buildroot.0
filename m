From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Mar 2014 05:34:02 +0100
Subject: [Buildroot] [PATCH 0/4] Update the AArch64 defconfig for Foundation
	v8
Message-ID: <1395376446-29367-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of commits updates the Foundation v8 defconfig to use a
mainline kernel, bumps the version of the boot-wrapper-aarch64, and
fixes a problem with the Linaro AArch64 toolchain (which was initially
reported by Kevin Hilman on IRC).

Thomas

Thomas Petazzoni (4):
  pkg-autotools: add a AUTOCONF_AC_CHECK_FILE_VAL macro
  boot-wrapper-aarch64: bump version and switch to autotools-package
  toolchain-external: Linaro AArch64 toolchains need a symlink, like ARM
    ones
  board/arm/foundation-v8: update defconfig and instructions

 board/arm/foundation-v8/readme.txt                 |  2 +-
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk  | 38 ++++++++++++++++------
 configs/arm_foundationv8_defconfig                 | 18 +++++-----
 package/pkg-autotools.mk                           | 10 ++++++
 toolchain/toolchain-external/toolchain-external.mk |  8 +++++
 5 files changed, 57 insertions(+), 19 deletions(-)

-- 
1.8.3.2
