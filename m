From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Apr 2011 00:10:45 +0200
Subject: [Buildroot] [git commit] Makefile: make help: show
	busybox/ctng/linux/uclibc-menuconfig if enabled
Message-ID: <20110424221238.A9C4A82972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4bb33dce49245ed36137c7028a9d170d8f4fe8ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For this we need to read .config.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 98cc09f..d4f5e15 100644
--- a/Makefile
+++ b/Makefile
@@ -42,7 +42,7 @@ export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/scripts/setlocalversion
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig savedefconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	source-check help
+	source-check
 
 # Strip quotes and then whitespaces
 qstrip=$(strip $(subst ",,$(1)))
@@ -661,6 +661,18 @@ help:
 	@echo '  randpackageconfig      - New config with random answer to package options'
 	@echo '  allyespackageconfig    - New config where pkg options are accepted with yes'
 	@echo '  allnopackageconfig     - New config where package options are answered with no'
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
+endif
+ifeq ($(BR2_LINUX_KERNEL),y)
+	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
+endif
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
+endif
+ifeq ($(BR2_TOOLCHAIN_CTNG),y)
+	@echo '  ctng-menuconfig        - Run crosstool-NG menuconfig'
+endif
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
-- 
1.7.3.4
