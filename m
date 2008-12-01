From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  1 Dec 2008 05:02:23 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20081201130223.2F0133C7DF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-01 05:02:22 -0800 (Mon, 01 Dec 2008)
New Revision: 24211

Log:
uClibc: add uClibc 0.9.30 to kconfig and Makefile

This patch adds uClibc versino 0.9.30 to the list of selectable versions. The
version identification for snapshot is also updated to reflect 0.9.30.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2008-12-01 12:53:09 UTC (rev 24210)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2008-12-01 13:02:22 UTC (rev 24211)
@@ -18,6 +18,10 @@
 		bool "uClibc 0.9.29"
 		depends on BR2_EXT_UCLIBC_VERSION_0_9_29
 
+	config BR2_UCLIBC_VERSION_0_9_30
+		bool "uClibc 0.9.30"
+		depends on BR2_EXT_UCLIBC_VERSION_0_9_30
+
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
 

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-12-01 12:53:09 UTC (rev 24210)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-12-01 13:02:22 UTC (rev 24211)
@@ -15,7 +15,7 @@
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 # Be aware that this changes daily....
-UCLIBC_VER:=0.9.29
+UCLIBC_VER:=0.9.30
 UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc
 UCLIBC_SOURCE:=uClibc-$(strip $(subst ",, $(BR2_USE_UCLIBC_SNAPSHOT))).tar.bz2
 #"))
@@ -23,6 +23,9 @@
 UCLIBC_PATCH_DIR:=toolchain/uClibc/
 else
 # releases
+ifeq ($(BR2_UCLIBC_VERSION_0_9_30),y)
+UCLIBC_VER:=0.9.30
+endif
 ifeq ($(BR2_UCLIBC_VERSION_0_9_29),y)
 UCLIBC_VER:=0.9.29
 endif
