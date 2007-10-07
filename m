From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  7 Oct 2007 11:23:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20071007182344.44CFF30042@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-07 11:23:43 -0700 (Sun, 07 Oct 2007)
New Revision: 20198

Log:
Do not create new directories in external toolchain

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-10-07 18:23:11 UTC (rev 20197)
+++ trunk/buildroot/Makefile	2007-10-07 18:23:43 UTC (rev 20198)
@@ -291,11 +291,13 @@
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 	@mkdir -p $(STAGING_DIR)/usr/lib
 else
+ifneq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 	@ln -snf . $(STAGING_DIR)/usr
 	@mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)
 	@ln -snf ../lib $(STAGING_DIR)/usr/lib
 	@ln -snf ../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
 endif
+endif
 	@mkdir -p $(STAGING_DIR)/usr/include
 
 $(PROJECT_BUILD_DIR)/.root:
