From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 17 Sep 2007 05:49:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  toolchain/uClibc
Message-ID: <20070917124946.D992830062@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-17 05:49:46 -0700 (Mon, 17 Sep 2007)
New Revision: 19871

Log:
Remove some debug info + add uclibc-target-utils-source target

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-17 12:43:40 UTC (rev 19870)
+++ trunk/buildroot/Makefile	2007-09-17 12:49:46 UTC (rev 19871)
@@ -430,12 +430,4 @@
 
 .PHONY: dummy subdirs release distclean clean config oldconfig \
 	menuconfig tags check test depend defconfig help
-
-
-dbg:
-	echo BASE_TARGETS_SOURCE=$(BASE_TARGETS_SOURCE)
-	echo BASE_TARGETS=$(BASE_TARGETS)
-	echo TARGETS_SOURCE=$(TARGETS_SOURCE)
-	echo TARGETS=$(TARGETS)
-
-bsource:	
+	

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-17 12:43:40 UTC (rev 19870)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-17 12:49:46 UTC (rev 19871)
@@ -459,6 +459,8 @@
 
 uclibc-target-utils: $(TARGET_DIR)/usr/bin/ldd
 
+uclibc-target-utils-source: $(DL_DIR)/$(UCLIBC_SOURCE)
+
 #############################################################
 #
 # uClibc for the target just needs its header files
