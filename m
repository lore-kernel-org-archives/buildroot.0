From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 30 Jul 2007 11:23:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070730182348.D3478A4669@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-30 11:23:47 -0700 (Mon, 30 Jul 2007)
New Revision: 19349

Log:
Revert bad commit, sorry about that\!

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-30 18:17:13 UTC (rev 19348)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-30 18:23:47 UTC (rev 19349)
@@ -252,7 +252,6 @@
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/include
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/lib
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/lib
-	
 	touch $@
 
 $(UCLIBC_DIR)/.oldconfig:	$(UCLIBC_DIR)/.config
@@ -374,7 +373,7 @@
 UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
 endif
 
-uclibc-configured: dependencies kernel-headers $(UCLIBC_DIR)/.configured
+uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
 
 uclibc-config:	$(UCLIBC_DIR)/.config
 
