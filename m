From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 05:11:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070801121146.C2C15A614D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 05:11:44 -0700 (Wed, 01 Aug 2007)
New Revision: 19390

Log:
Sort uclibc artificial targets in execution order

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-01 11:54:47 UTC (rev 19389)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-01 12:11:44 UTC (rev 19390)
@@ -382,17 +382,16 @@
 UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
 endif
 
-uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
+uclibc: $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
 
+uclibc-source: $(DL_DIR)/$(UCLIBC_SOURCE)
+
 uclibc-config:	$(UCLIBC_DIR)/.config
 
 uclibc-oldconfig:	$(UCLIBC_DIR)/.oldconfig
 
+uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
 
-uclibc: $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
-
-uclibc-source: $(DL_DIR)/$(UCLIBC_SOURCE)
-
 uclibc-configured-source: uclibc-source
 
 uclibc-clean:
