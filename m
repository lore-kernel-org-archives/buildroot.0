From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Fri,  7 Jun 2013 11:05:59 +0200
Subject: [Buildroot] [PATCH] Normalize separator size to 80 in remaining
	makefiles
Message-ID: <1370595959-3907-1-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 fs/iso9660/iso9660.mk                |  4 ++--
 linux/linux-ext-rtai.mk              |  4 ++--
 linux/linux-ext-xenomai.mk           |  4 ++--
 linux/linux.mk                       |  4 ++--
 support/dependencies/dependencies.mk |  8 ++++----
 toolchain/gcc/gcc-uclibc-4.x.mk      | 20 ++++++++++----------
 toolchain/uClibc/uclibc.mk           |  4 ++--
 7 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 0a10512..36e6388 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -36,11 +36,11 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
 
 rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
 
-#############################################################
+################################################################################
 #
 # Toplevel Makefile options
 #
-#############################################################
+################################################################################
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660),y)
 TARGETS+=rootfs-iso9660
 endif
diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index 78488af..dcfab49 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -1,8 +1,8 @@
-##################################################
+################################################################################
 # Linux RTAI extensions
 #
 # Patch the linux kernel with RTAI extension
-##################################################
+################################################################################
 
 ifeq ($(BR2_LINUX_KERNEL_EXT_RTAI),y)
 # Add dependency to RTAI (user-space) which provide kernel patches
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index 9b6772e..115d4a8 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -1,8 +1,8 @@
-##################################################
+################################################################################
 # Linux Adeos/Xenomai extensions
 #
 # Patch the linux kernel with xenomai extension
-##################################################
+################################################################################
 
 ifeq ($(BR2_LINUX_KERNEL_EXT_XENOMAI),y)
 # Add dependency to xenomai (user-space) which provide ksrc part
diff --git a/linux/linux.mk b/linux/linux.mk
index 57956dd..befef16 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # Linux kernel target
 #
-###############################################################################
+################################################################################
 
 LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPLv2
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index ebe743a..c93dcb4 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -1,9 +1,9 @@
-######################################################################
+################################################################################
 #
 # Check buildroot dependencies and bail out if the user's
 # system is judged to be lacking....
 #
-######################################################################
+################################################################################
 
 DEPENDENCIES_HOST_PREREQ:=
 
@@ -35,10 +35,10 @@ dependencies-clean:
 dependencies-dirclean:
 	true
 
-#############################################################
+################################################################################
 #
 # Toplevel Makefile options
 #
-#############################################################
+################################################################################
 .PHONY: dependencies core-dependencies
 
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 7ebcbac..92361e5 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -133,11 +133,11 @@ EXTRA_GCC_CONFIG_OPTIONS += \
 EXTRA_TARGET_GCC_CONFIG_OPTIONS += \
 	$(call qstrip,$(BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS))
 
-#############################################################
+################################################################################
 #
 # Setup some initial stuff
 #
-#############################################################
+################################################################################
 
 GCC_STAGING_PREREQ+=$(STAGING_DIR)/usr/lib/libc.a
 
@@ -260,11 +260,11 @@ endif
 endif
 	touch $@
 
-#############################################################
+################################################################################
 #
 # build the first pass gcc compiler
 #
-#############################################################
+################################################################################
 GCC_BUILD_DIR1:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-initial
 
 $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
@@ -327,11 +327,11 @@ gcc_initial-clean:
 gcc_initial-dirclean:
 	rm -rf $(GCC_BUILD_DIR1) $(GCC_DIR)
 
-#############################################################
+################################################################################
 #
 # build the second pass gcc compiler
 #
-#############################################################
+################################################################################
 GCC_BUILD_DIR2:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-intermediate
 
 # The --without-headers option stopped working with gcc 3.0 and has never been
@@ -403,12 +403,12 @@ gcc_intermediate-clean:
 gcc_intermediate-dirclean:
 	rm -rf $(GCC_BUILD_DIR2) $(GCC_DIR)
 
-#############################################################
+################################################################################
 #
 # third pass compiler build. Build the compiler targeting
 # the newly built shared uClibc library.
 #
-#############################################################
+################################################################################
 #
 # Sigh... I had to rework things because using --with-gxx-include-dir
 # causes issues with include dir search order for g++. This seems to
@@ -538,11 +538,11 @@ gcc-clean:
 gcc-dirclean: gcc_initial-dirclean
 	rm -rf $(GCC_BUILD_DIR3)
 
-#############################################################
+################################################################################
 #
 # Next build target gcc compiler
 #
-#############################################################
+################################################################################
 GCC_BUILD_DIR4:=$(BUILD_DIR)/gcc-$(GCC_VERSION)-target
 
 $(GCC_BUILD_DIR4)/.prepared: $(STAMP_DIR)/gcc_libs_target_installed
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 44079e7..da1830f 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -576,12 +576,12 @@ uclibc-test-clean:
 uclibc-test-dirclean:
 	rm -rf $(TARGET_DIR)/root/uClibc
 
-#############################################################
+################################################################################
 #
 # uClibc for the target just needs its header files
 # and whatnot installed.
 #
-#############################################################
+################################################################################
 
 $(TARGET_DIR)/usr/lib/libc.a: $(STAGING_DIR)/usr/lib/libc.a
 	$(Q)$(call MESSAGE,"Installing uClibc development files to target dir")
-- 
1.8.1.2
