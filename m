From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 12 Dec 2006 22:59:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20061213065901.D0B114859A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-12 22:59:01 -0800 (Tue, 12 Dec 2006)
New Revision: 16871

Log:
fix a few little glitches I left in here the other day


Modified:
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2006-12-13 06:58:14 UTC (rev 16870)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2006-12-13 06:59:01 UTC (rev 16871)
@@ -7,7 +7,7 @@
 	prompt "uClibc C library Version"
 	default BR2_UCLIBC_VERSION_SNAPSHOT
 	help
-	  Select the version of gcc you wish to use.
+	  Select the version of uClibc you wish to use.
 
 	config BR2_UCLIBC_VERSION_0_9_28
 		bool "uClibc 0.9.28"

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-13 06:58:14 UTC (rev 16870)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-13 06:59:01 UTC (rev 16871)
@@ -9,7 +9,8 @@
 # Be aware that this changes daily....
 UCLIBC_VER:=0.9.29
 UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc
-UCLIBC_SOURCE:=uClibc-snapshot.tar.bz2
+UCLIBC_SOURCE:=uClibc-$(strip $(subst ",, $(BR2_USE_UCLIBC_SNAPSHOT))).tar.bz2
+#"))
 UCLIBC_SITE:=http://www.uclibc.org/downloads/snapshots
 ifndef UCLIBC_CONFIG_FILE
 UCLIBC_CONFIG_FILE=toolchain/uClibc/uClibc-0.9.29.config
