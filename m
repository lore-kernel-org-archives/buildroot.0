From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 11:55:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20061213195527.AD07D48578@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 11:55:27 -0800 (Wed, 13 Dec 2006)
New Revision: 16902

Log:
- Build binutils with sysroot support.


Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2006-12-13 18:24:48 UTC (rev 16901)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2006-12-13 19:55:27 UTC (rev 16902)
@@ -62,6 +62,8 @@
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
+		--with-build-sysroot="$(TOOL_BUILD_DIR)/uClibc_dev/" \
+		--with-sysroot="$(TOOL_BUILD_DIR)/uClibc_dev/" \
 		$(DISABLE_NLS) \
 		$(MULTILIB) \
 		--disable-werror \
@@ -77,7 +79,7 @@
 $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/ld: $(BINUTILS_DIR1)/binutils/objdump
 	$(MAKE) -C $(BINUTILS_DIR1) install
 
-binutils: dependencies $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/ld
+binutils: dependencies uclibc-configured $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/ld
 
 binutils-source: $(DL_DIR)/$(BINUTILS_SOURCE)
 
