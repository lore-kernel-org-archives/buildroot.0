From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 24 Jun 2007 07:38:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070624143807.2BF65A458E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-24 07:38:06 -0700 (Sun, 24 Jun 2007)
New Revision: 18906

Log:
- yet another hunk that should have been part of r18904


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-06-24 12:27:08 UTC (rev 18905)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-06-24 14:38:06 UTC (rev 18906)
@@ -278,7 +278,7 @@
 
 
 $(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
-ifeq ($(findstring y,$(BR2_GCC_VERSION_3_3_5)$(BR2_GCC_VERSION_3_3_6)$(BR2_GCC_VERSION_3_4_2)$(BR2_GCC_VERSION_3_4_3)$(BR2_GCC_VERSION_3_4_4)$(BR2_GCC_VERSION_3_4_5)$(BR2_GCC_VERSION_3_4_6)),y)
+ifneq ($(BR2_TOOLCHAIN_SYSROOT),y)
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX= \
 		DEVEL_PREFIX=$(STAGING_DIR)/ \
