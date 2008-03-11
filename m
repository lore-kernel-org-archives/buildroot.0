From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 11 Mar 2008 11:54:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/editors/uemacs
	package/module-in etc...
Message-ID: <20080311185419.65024120135@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-11 11:54:17 -0700 (Tue, 11 Mar 2008)
New Revision: 21305

Log:
buildroot: use BR2_KERNEL_MIRROR everywhere

Based on patch by Nigel Kukard.


Modified:
   trunk/buildroot/package/editors/uemacs/uemacs.mk
   trunk/buildroot/package/module-init-tools/module-init-tools.mk
   trunk/buildroot/package/modutils/modutils.mk
   trunk/buildroot/package/udev/udev.mk
   trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/package/editors/uemacs/uemacs.mk
===================================================================
--- trunk/buildroot/package/editors/uemacs/uemacs.mk	2008-03-11 18:32:17 UTC (rev 21304)
+++ trunk/buildroot/package/editors/uemacs/uemacs.mk	2008-03-11 18:54:17 UTC (rev 21305)
@@ -6,7 +6,7 @@
 UEMACS_VERSION:=4.0.15-lt
 UEMACS_SOURCE:=em-$(UEMACS_VERSION).tar.bz2
 UEMACS_CAT:=$(BZCAT)
-UEMACS_SITE:=ftp://ftp.kernel.org/pub/software/editors/uemacs/
+UEMACS_SITE:=$(BR2_KERNEL_MIRROR)/software/editors/uemacs/
 UEMACS_DIR:=$(BUILD_DIR)/em-$(UEMACS_VERSION)
 UEMACS_BINARY:=em
 UEMACS_TARGET_BINARY:=usr/bin/emacs

Modified: trunk/buildroot/package/module-init-tools/module-init-tools.mk
===================================================================
--- trunk/buildroot/package/module-init-tools/module-init-tools.mk	2008-03-11 18:32:17 UTC (rev 21304)
+++ trunk/buildroot/package/module-init-tools/module-init-tools.mk	2008-03-11 18:54:17 UTC (rev 21305)
@@ -6,7 +6,7 @@
 MODULE_INIT_TOOLS_VERSION=3.2.2
 MODULE_INIT_TOOLS_SOURCE=module-init-tools-$(MODULE_INIT_TOOLS_VERSION).tar.bz2
 MODULE_INIT_TOOLS_CAT:=$(BZCAT)
-MODULE_INIT_TOOLS_SITE=http://ftp.kernel.org/pub/linux/utils/kernel/module-init-tools/
+MODULE_INIT_TOOLS_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/module-init-tools/
 MODULE_INIT_TOOLS_DIR=$(BUILD_DIR)/module-init-tools-$(MODULE_INIT_TOOLS_VERSION)
 MODULE_INIT_TOOLS_DIR2=$(TOOL_BUILD_DIR)/module-init-tools-$(MODULE_INIT_TOOLS_VERSION)
 MODULE_INIT_TOOLS_BINARY=depmod

Modified: trunk/buildroot/package/modutils/modutils.mk
===================================================================
--- trunk/buildroot/package/modutils/modutils.mk	2008-03-11 18:32:17 UTC (rev 21304)
+++ trunk/buildroot/package/modutils/modutils.mk	2008-03-11 18:54:17 UTC (rev 21305)
@@ -6,7 +6,7 @@
 MODUTILS_VERSION:=2.4.27
 MODUTILS_SOURCE=modutils-$(MODUTILS_VERSION).tar.bz2
 MODUTILS_CAT:=$(BZCAT)
-MODUTILS_SITE=http://ftp.kernel.org/pub/linux/utils/kernel/modutils/v2.4/
+MODUTILS_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/modutils/v2.4/
 MODUTILS_DIR1=$(BUILD_DIR)/modutils-$(MODUTILS_VERSION)
 MODUTILS_DIR2=$(TOOL_BUILD_DIR)/modutils-$(MODUTILS_VERSION)
 MODUTILS_BINARY=depmod

Modified: trunk/buildroot/package/udev/udev.mk
===================================================================
--- trunk/buildroot/package/udev/udev.mk	2008-03-11 18:32:17 UTC (rev 21304)
+++ trunk/buildroot/package/udev/udev.mk	2008-03-11 18:54:17 UTC (rev 21305)
@@ -9,7 +9,7 @@
 UDEV_VOLUME_ID_REVISION:=0
 UDEV_VOLUME_ID_VERSION:=$(UDEV_VOLUME_ID_CURRENT).$(UDEV_VOLUME_ID_AGE).$(UDEV_VOLUME_ID_REVISION)
 UDEV_SOURCE:=udev-$(UDEV_VERSION).tar.bz2
-UDEV_SITE:=ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
+UDEV_SITE:=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
 UDEV_CAT:=$(BZCAT)
 UDEV_DIR:=$(BUILD_DIR)/udev-$(UDEV_VERSION)
 UDEV_TARGET_BINARY:=sbin/udevd

Modified: trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk	2008-03-11 18:32:17 UTC (rev 21304)
+++ trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk	2008-03-11 18:54:17 UTC (rev 21305)
@@ -14,7 +14,7 @@
 
 
 LINUX26_SOURCE=linux-$(DOWNLOAD_LINUX26_VERSION).tar.bz2
-LINUX26_SITE=http://ftp.kernel.org/pub/linux/kernel/v2.6
+LINUX26_SITE=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
 
 LINUX26_FORMAT=vmlinux
 LINUX26_BINLOC=$(LINUX26_FORMAT)

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2008-03-11 18:32:17 UTC (rev 21304)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2008-03-11 18:54:17 UTC (rev 21305)
@@ -8,7 +8,7 @@
 
 EXTRA_BINUTILS_CONFIG_OPTIONS=$(strip $(subst ",, $(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS)))
 #"))
-BINUTILS_SITE:=ftp://ftp.kernel.org/pub/linux/devel/binutils
+BINUTILS_SITE:=$(BR2_KERNEL_MIRROR)/linux/devel/binutils
 ifeq ($(BINUTILS_VERSION),2.18)
 BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 endif

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2008-03-11 18:32:17 UTC (rev 21304)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2008-03-11 18:54:17 UTC (rev 21305)
@@ -18,7 +18,7 @@
 EXTRAVERSION:=$(if $(EXTRAVERSION),.$(EXTRAVERSION),)
 
 LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
+LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
@@ -42,7 +42,7 @@
 
 ifeq ($(BR2_KERNEL_HEADERS_RT),y)
 LINUX_RT_SOURCE:=patch-$(LINUX_HEADERS_VERSION)-$(LINUX_RT_VERSION)
-LINUX_RT_SITE:=http://www.kernel.org/pub/linux/kernel/projects/rt/older/
+LINUX_RT_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/projects/rt/older/
 LINUX_HEADERS_DEPENDS+=$(DL_DIR)/$(LINUX_RT_SOURCE)
 $(DL_DIR)/$(LINUX_RT_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LINUX_RT_SITE)/$(LINUX_RT_SOURCE)
