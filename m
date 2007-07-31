From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 31 Jul 2007 16:25:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: gdb uClibc
Message-ID: <20070731232513.7BEA2A4640@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-31 16:25:12 -0700 (Tue, 31 Jul 2007)
New Revision: 19372

Log:
Add PATCH_DIR's for snapshots of uclibc and gdb

Modified:
   trunk/buildroot/toolchain/gdb/gdb.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2007-07-31 22:57:19 UTC (rev 19371)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2007-07-31 23:25:12 UTC (rev 19372)
@@ -17,6 +17,7 @@
 GDB_SOURCE:=gdb.tar.bz2
 GDB_CAT:=$(BZCAT)
 GDB_DIR:=$(TOOL_BUILD_DIR)/gdb-$(GDB_VERSION)
+GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
 else
 
 ifeq	($(BR2_TOOLCHAIN_NORMAL),y)

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-31 22:57:19 UTC (rev 19371)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-31 23:25:12 UTC (rev 19372)
@@ -20,6 +20,7 @@
 UCLIBC_SOURCE:=uClibc-$(strip $(subst ",, $(BR2_USE_UCLIBC_SNAPSHOT))).tar.bz2
 #"))
 UCLIBC_SITE:=http://www.uclibc.org/downloads/snapshots
+UCLIBC_PATCH_DIR:=toolchain/uClibc/
 else
 # releases
 ifeq ($(BR2_UCLIBC_VERSION_0_9_29),y)
