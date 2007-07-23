From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 23 Jul 2007 04:32:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070723113210.54337A6873@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-23 04:32:09 -0700 (Mon, 23 Jul 2007)
New Revision: 19217

Log:
- add missing dependency


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-23 11:29:38 UTC (rev 19216)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-23 11:32:09 UTC (rev 19217)
@@ -345,7 +345,7 @@
 		install_runtime
 	touch -c $@
 
-$(TARGET_DIR)/usr/bin/ldd:
+$(TARGET_DIR)/usr/bin/ldd: gcc
 	$(MAKE1) -C $(UCLIBC_DIR) CC=$(TARGET_CROSS)gcc \
 		CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
 		PREFIX=$(TARGET_DIR) utils install_utils
