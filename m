From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 13 Dec 2014 00:15:57 +0100
Subject: [Buildroot] [PATCH 00/14] Add support for U-Boots Kbuild & Kconfig
	build system
Message-ID: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds to the bootloader Das U-Boot:
  * Update to the latest stable version 2014.10
  * Support for its Kbuild & Kconfig build system
  * Documentation in the manual
  * Fixes and adjustments to the packages infrastructure

J?rg Krause (14):
  boot/uboot: bump to version 2014.10
  boot/uboot: Add support for Kconfig build system
  boot/uboot.mk: Add uboot-menuconfig and friends
  boot/uboot.mk: Remove obsolete CONFIG_NOSOFTFLOAT flag
  boot/uboot.mk: Replace TARGET_CONFIGURE_OPTS with TARGET_MAKE_ENV
  boot/uboot.mk: Replace UBOOT_MAKE_OPTS with UBOOT_MAKE_FLAGS
  boot/uboot.mk: Make make action single-line
  boot/uboot/Config.in: Fix BR2_TARGET_UBOOT_SPL
  boot/uboot/Config.in: Fix BR2_TARGET_UBOOT_SPL_NAME
  boot/uboot/uboot.mk: Strip quotes from BR2_TARGET_UBOOT_SPL_NAME
  docs/manual/make-tips.mk: Add uboot documentation
  docs/manual/customize-configuration.txt: Add uboot documentation
  docs/manual/customize-quick-guide.txt: Add uboot documentation
  docs/manual/configure-other-components.txt: Add uboot documentation

 boot/uboot/Config.in                       | 50 +++++++++++++++++++---------
 boot/uboot/uboot.mk                        | 52 +++++++++++++++++++++++-------
 docs/manual/configure-other-components.txt | 11 +++++++
 docs/manual/customize-configuration.txt    |  8 ++---
 docs/manual/customize-quick-guide.txt      |  2 ++
 docs/manual/make-tips.txt                  |  2 ++
 6 files changed, 94 insertions(+), 31 deletions(-)

-- 
2.1.3
