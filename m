From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 31 Jan 2007 07:09:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070131150927.EF41148567@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-31 07:09:26 -0800 (Wed, 31 Jan 2007)
New Revision: 17686

Log:
- add gcc-4.1.2 (release candidate1). Send bugs etc to MarkM, if you feel like


Added:
   trunk/buildroot/toolchain/gcc/4.1.2/

Modified:
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Copied: trunk/buildroot/toolchain/gcc/4.1.2 (from rev 17683, trunk/buildroot/toolchain/gcc/4.1.1)

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-01-31 14:21:08 UTC (rev 17685)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-01-31 15:09:26 UTC (rev 17686)
@@ -55,6 +55,10 @@
 		depends !BR2_nios2
 		bool "gcc 4.1.1"
 
+	config BR2_GCC_VERSION_4_1_2
+		depends !BR2_nios2
+		bool "gcc 4.1.2"
+
 	config BR2_GCC_VERSION_4_2
 		depends !BR2_nios2
 		select BR2_GCC_IS_SNAP
@@ -89,6 +93,7 @@
 	default "4.0.3"     if BR2_GCC_VERSION_4_0_3
 	default "4.1.0"     if BR2_GCC_VERSION_4_1_0
 	default "4.1.1"     if BR2_GCC_VERSION_4_1_1
+	default "4.1.2"     if BR2_GCC_VERSION_4_1_2
 	default "4.2"       if BR2_GCC_VERSION_4_2
 
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-01-31 14:21:08 UTC (rev 17685)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-01-31 15:09:26 UTC (rev 17686)
@@ -26,6 +26,13 @@
 GCC_SITE:=ftp://sources.redhat.com/pub/gcc/snapshots/$(GCC_OFFICIAL_VER)
 endif
 
+# Temporary for 4.1.2-RC1
+ifeq ($(BR2_GCC_VERSION_4_1_2),y)
+GCC_SNAP_DATE:=20070128
+GCC_OFFICIAL_VER:=$(GCC_VERSION)-$(GCC_SNAP_DATE)
+GCC_SITE:=ftp://gcc.gnu.org/pub/gcc/prerelease-$(GCC_OFFICIAL_VER)/
+endif
+
 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
 GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VER)
 GCC_CAT:=$(BZCAT)
