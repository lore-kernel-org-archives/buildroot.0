From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 14 Feb 2007 00:49:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070214084900.D7BE94856E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-14 00:49:00 -0800 (Wed, 14 Feb 2007)
New Revision: 17884

Log:
- gcc-4.1.2 released


Modified:
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-02-14 08:36:13 UTC (rev 17883)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-02-14 08:49:00 UTC (rev 17884)
@@ -60,7 +60,7 @@
 		bool "gcc 4.1.0"
 
 	config BR2_GCC_VERSION_4_1_1
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.1.1"
 
 	config BR2_GCC_VERSION_4_1_2

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-02-14 08:36:13 UTC (rev 17883)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-02-14 08:49:00 UTC (rev 17884)
@@ -26,13 +26,6 @@
 GCC_SITE:=ftp://sources.redhat.com/pub/gcc/snapshots/$(GCC_OFFICIAL_VER)
 endif
 
-# Temporary for 4.1.2-RC1
-ifeq ($(BR2_GCC_VERSION_4_1_2),y)
-GCC_SNAP_DATE:=20070208
-GCC_OFFICIAL_VER:=$(GCC_VERSION)-$(GCC_SNAP_DATE)
-GCC_SITE:=ftp://gcc.gnu.org/pub/gcc/prerelease-$(GCC_OFFICIAL_VER)/
-endif
-
 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
 GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VER)
 GCC_CAT:=$(BZCAT)
