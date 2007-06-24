From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 24 Jun 2007 05:27:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070624122709.C006930041@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-24 05:27:08 -0700 (Sun, 24 Jun 2007)
New Revision: 18905

Log:
- forgot to apply this hunk that should have belonged to r18904


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-06-24 11:30:05 UTC (rev 18904)
+++ trunk/buildroot/Makefile	2007-06-24 12:27:08 UTC (rev 18905)
@@ -149,7 +149,7 @@
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)/bin
 	@mkdir -p $(STAGING_DIR)/lib
-ifneq ($(findstring y,$(BR2_GCC_VERSION_3_3_5)$(BR2_GCC_VERSION_3_3_6)$(BR2_GCC_VERSION_3_4_2)$(BR2_GCC_VERSION_3_4_3)$(BR2_GCC_VERSION_3_4_4)$(BR2_GCC_VERSION_3_4_5)$(BR2_GCC_VERSION_3_4_6)),y)
+ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 	@mkdir -p $(STAGING_DIR)/usr/lib
 else
 	@ln -snf . $(STAGING_DIR)/usr
