From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed,  8 Apr 2015 09:53:36 +0900
Subject: [Buildroot] [PATCH] Fix typos in comment blocks
Message-ID: <1428454416-30252-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                            | 2 +-
 board/avnet/zedboard/readme.txt     | 4 ++--
 boot/uboot/uboot.mk                 | 2 +-
 linux/Config.in                     | 2 +-
 package/Makefile.in                 | 2 +-
 package/pkg-generic.mk              | 2 +-
 support/download/check-hash         | 2 +-
 support/scripts/gen-manual-lists.py | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 2ad8832..9db52a8 100644
--- a/Makefile
+++ b/Makefile
@@ -144,7 +144,7 @@ else
   $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
 endif
 
-# To make sure the the environment variable overrides the .config option,
+# To make sure that the environment variable overrides the .config option,
 # set this before including .config.
 ifneq ($(BR2_DL_DIR),)
 DL_DIR := $(BR2_DL_DIR)
diff --git a/board/avnet/zedboard/readme.txt b/board/avnet/zedboard/readme.txt
index fe8c75e..a3f1f3e 100644
--- a/board/avnet/zedboard/readme.txt
+++ b/board/avnet/zedboard/readme.txt
@@ -6,7 +6,7 @@ Zedboard information including schematics, reference designs, and manuals are
 available from http://www.zedboard.org .
 
 The U-Boot firmware for the Xilinx Zynq All Programmable SoC depends
-on some propietary code. This dependency consists of a pair of
+on some proprietary code. This dependency consists of a pair of
 files are available from the Xilinx SDK installation.
 
 You will need these files from Xilinx SDK installation to generate
@@ -53,7 +53,7 @@ the clean, or uboot-dirclean targets are made.
 
 Resulting system
 ----------------
-A FAT32 partition should be created at the beggining of the SD Card
+A FAT32 partition should be created at the beginning of the SD Card
 and the following files should be installed:
 	/boot.bin
 	/devicetree.dtb
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index df991e7..0272d9e 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -177,7 +177,7 @@ ifeq ($(BR2_TARGET_UBOOT),y)
 # we NEED a board name unless we're at make source
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(UBOOT_BOARD_NAME),)
-$(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
+$(error No U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_CUSTOM_VERSION),y)
diff --git a/linux/Config.in b/linux/Config.in
index c83a3f5..1da2bd5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -289,7 +289,7 @@ if BR2_LINUX_KERNEL_DTS_SUPPORT
 #   1) We don't want any support at all. Then the ..DTS_SUPPORT
 #      variable won't be set
 #   2) We want device tree support, so we need the user to enter
-#      the device tree name or the the path to the custom device
+#      the device tree name or the path to the custom device
 #      he uses, but the kernel abstracts this from us and only
 #      build an image that looks like a regular kernel image. In
 #      this case, we only need to derive the kernel image name from
diff --git a/package/Makefile.in b/package/Makefile.in
index fc57427..8e471ee 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -6,7 +6,7 @@ HOSTMAKE = $(MAKE)
 endif
 HOSTMAKE := $(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 
-# If BR2_LEVEL is 0, scale the maximum concurrency with the number of
+# If BR2_JLEVEL is 0, scale the maximum concurrency with the number of
 # CPUs. An additional job is used in order to keep processors busy
 # while waiting on I/O.
 # If the number of processors is not available, assume one.
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f77aab2..e1be085 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -411,7 +411,7 @@ endif
 
 $(2)_REDISTRIBUTE		?= YES
 
-# When a target package is a toolchain dependency set this variable to
+# When a target package has a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
 # dependency
 $(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
diff --git a/support/download/check-hash b/support/download/check-hash
index d37f1cd..678a7ef 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -3,7 +3,7 @@ set -e
 
 # Helper to check a file matches its known hash
 # Call it with:
-#   $1: the path of the file containing all the the expected hashes
+#   $1: the path of the file containing all the expected hashes
 #   $2: the full path to the temporary file that was downloaded, and
 #       that is to be checked
 #   $3: the final basename of the file, to which it will be ultimately
diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index 95c10dc..ec59030 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -87,7 +87,7 @@ def get_symbol_parents(item, root=None, enable_choice=False):
     """ Return the list of the item's parents. The last item of the list is
     the closest parent, the first the furthest.
 
-    :param item:          Item from which the the parent list is generated
+    :param item:          Item from which the parent list is generated
     :param root:          Root item stopping the search (not included in the
                           parent list)
     :param enable_choice: Flag enabling choices to appear in the parent list
-- 
1.9.1
