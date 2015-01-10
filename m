From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 10 Jan 2015 14:47:19 +0100
Subject: [Buildroot] [PATCH v2 0/8] Add support for U-Boots Kbuild & Kconfig
	build system
Message-ID: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 2014.10 U-Boot uses a Kbuild & Kconfig infrastructure for
building targets. This series of patches add support for this new build
system while remaining backward compatible to any older version of U-Boot.

J?rg Krause (8):
  boot/uboot: Remove obsolete CONFIG_NOSOFTFLOAT flag
  boot/uboot: Replace TARGET_CONFIGURE_OPTS with TARGET_MAKE_ENV
  boot/uboot: Add support for Kbuild & Kconfig build system
  boot/uboot: Add uboot-menuconfig and friends
  docs/manual/make-tips.mk: Add uboot documentation
  docs/manual/customize-configuration.txt: Add uboot documentation
  docs/manual/customize-quick-guide.txt: Add uboot documentation
  docs/manual/configure-other-components.txt: Add uboot documentation

 boot/uboot/Config.in                       | 38 +++++++++++++++++++++--
 boot/uboot/uboot.mk                        | 48 +++++++++++++++++++++++++-----
 docs/manual/configure-other-components.txt | 19 ++++++++++++
 docs/manual/customize-configuration.txt    |  8 ++---
 docs/manual/customize-quick-guide.txt      |  2 ++
 docs/manual/make-tips.txt                  |  2 ++
 6 files changed, 103 insertions(+), 14 deletions(-)

-- 
2.2.1
