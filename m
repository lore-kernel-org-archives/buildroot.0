From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 11:21:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070901182109.B7B74A5E30@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 11:21:09 -0700 (Sat, 01 Sep 2007)
New Revision: 19757

Log:
- whitespace cleanup (Cristian Ionescu-Idbohrn)


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-01 18:01:08 UTC (rev 19756)
+++ trunk/buildroot/Makefile	2007-09-01 18:21:09 UTC (rev 19757)
@@ -22,12 +22,12 @@
 # You shouldn't need to mess with anything beyond this point...
 #--------------------------------------------------------------
 TOPDIR=./
-CONFIG_CONFIG_IN = Config.in
-CONFIG_DEFCONFIG = .defconfig
-CONFIG = package/config
+CONFIG_CONFIG_IN=Config.in
+CONFIG_DEFCONFIG=.defconfig
+CONFIG=package/config
 DATE:=$(shell date -u +%Y%m%d)
 
-noconfig_targets := menuconfig config oldconfig randconfig \
+noconfig_targets:=menuconfig config oldconfig randconfig \
 	defconfig allyesconfig allnoconfig release tags \
 	source-check help
 
@@ -45,24 +45,24 @@
 # Use 'make V=1' to see the full commands
 ifdef V
   ifeq ("$(origin V)", "command line")
-    KBUILD_VERBOSE = $(V)
+    KBUILD_VERBOSE=$(V)
   endif
 endif
 ifndef KBUILD_VERBOSE
-  KBUILD_VERBOSE = 0
+  KBUILD_VERBOSE=0
 endif
 
 ifeq ($(KBUILD_VERBOSE),1)
   quiet=
-  Q =
+  Q=
 else
   quiet=quiet_
-  Q = @
+  Q=@
 endif
 
-CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
+CONFIG_SHELL:=$(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 	else if [ -x /bin/bash ]; then echo /bin/bash; \
-	else echo sh; fi ; fi)
+	else echo sh; fi; fi)
 
 export CONFIG_SHELL quiet Q KBUILD_VERBOSE
 
@@ -85,12 +85,12 @@
 ifndef HOSTLN
 HOSTLN:=ln
 endif
-HOSTAR :=$(shell $(CONFIG_SHELL) -c "which $(HOSTAR)" || type -p $(HOSTAR) || echo ar)
-HOSTAS :=$(shell $(CONFIG_SHELL) -c "which $(HOSTAS)" || type -p $(HOSTAS) || echo as)
-HOSTCC :=$(shell $(CONFIG_SHELL) -c "which $(HOSTCC)" || type -p $(HOSTCC) || echo gcc)
+HOSTAR:=$(shell $(CONFIG_SHELL) -c "which $(HOSTAR)" || type -p $(HOSTAR) || echo ar)
+HOSTAS:=$(shell $(CONFIG_SHELL) -c "which $(HOSTAS)" || type -p $(HOSTAS) || echo as)
+HOSTCC:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCC)" || type -p $(HOSTCC) || echo gcc)
 HOSTCXX:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCXX)" || type -p $(HOSTCXX) || echo g++)
-HOSTLD :=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)" || type -p $(HOSTLD) || echo ld)
-HOSTLN :=$(shell $(CONFIG_SHELL) -c "which $(HOSTLN)" || type -p $(HOSTLN) || echo ln)
+HOSTLD:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)" || type -p $(HOSTLD) || echo ld)
+HOSTLN:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLN)" || type -p $(HOSTLN) || echo ln)
 ifndef CFLAGS_FOR_BUILD
 CFLAGS_FOR_BUILD:=-g -O2
 endif
@@ -100,10 +100,10 @@
 ifeq ($(strip $(BR2_HAVE_DOT_CONFIG)),y)
 
 # cc-option
-# Usage: cflags-y += $(call cc-option, -march=winchip-c6, -march=i586)
+# Usage: cflags-y+=$(call cc-option, -march=winchip-c6, -march=i586)
 # sets -march=winchip-c6 if supported else falls back to -march=i586
 # without checking the latter.
-cc-option = $(shell if $(TARGET_CC) $(TARGET_CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
+cc-option=$(shell if $(TARGET_CC) $(TARGET_CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
 	> /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
 
 #############################################################
@@ -163,7 +163,7 @@
 endif
 TARGETS:=
 
-# setup uor pathes
+# setup our pathes
 include project/Makefile.in
 
 BR2_DEPENDS_DIR=$(PROJECT_BUILD_DIR)/buildroot-config
@@ -261,9 +261,9 @@
 	mkdir -p $(TARGET_DIR)
 	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
 		if [ -d "$(TARGET_SKELETON)" ]; then \
-			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/ ; \
+			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
 		fi; \
-		touch $(STAGING_DIR)/.fakeroot.00000 ; \
+		touch $(STAGING_DIR)/.fakeroot.00000; \
 	fi
 	-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
 	-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf
@@ -321,13 +321,13 @@
 $(CONFIG)/conf:
 	@mkdir -p $(CONFIG)/buildroot-config
 	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) conf
-	- at if [ ! -f .config ] ; then \
+	- at if [ ! -f .config ]; then \
 		cp $(CONFIG_DEFCONFIG) .config; \
 	fi
 $(CONFIG)/mconf:
 	@mkdir -p $(CONFIG)/buildroot-config
 	$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) conf mconf
-	- at if [ ! -f .config ] ; then \
+	- at if [ ! -f .config ]; then \
 		cp $(CONFIG_DEFCONFIG) .config; \
 	fi
 
@@ -388,7 +388,7 @@
 #############################################################
 clean:
 	rm -f .config .config.old .config.cmd .tmpconfig.h
-	- $(MAKE) -C $(CONFIG) clean
+	-$(MAKE) -C $(CONFIG) clean
 
 distclean: clean
 	rm -rf sources/*
@@ -420,5 +420,3 @@
 
 .PHONY: dummy subdirs release distclean clean config oldconfig \
 	menuconfig tags check test depend defconfig help
-
-
