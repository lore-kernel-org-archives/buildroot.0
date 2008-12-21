From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 21 Dec 2008 17:17:59 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/export-toolchain
Message-ID: <20081221171759.55BAA76ABE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-21 17:17:58 +0000 (Sun, 21 Dec 2008)
New Revision: 24481

Log:
And make script for exported toolchain executable

Modified:
   trunk/buildroot/toolchain/export-toolchain/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/export-toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/export-toolchain/Makefile.in	2008-12-21 17:11:33 UTC (rev 24480)
+++ trunk/buildroot/toolchain/export-toolchain/Makefile.in	2008-12-21 17:17:58 UTC (rev 24481)
@@ -13,6 +13,7 @@
 	@echo	"export	GCCROOT=$(STAGING_DIR)/usr"			>>	$(GCC_SCRIPT_TEMP)
 	@echo	"export	PATH=\$$PATH:\$$GCCROOT/bin"			>>	$(GCC_SCRIPT_TEMP)
 	@echo	"export	CROSS_COMPILE=$(REAL_GNU_TARGET_NAME)-"		>>	$(GCC_SCRIPT_TEMP)
+	@chmod	a+x $(GCC_SCRIPT_TEMP)
 	@cp	$(GCC_SCRIPT_TEMP) ~/$(GCC_SCRIPT)
 	@cat	~/$(GCC_SCRIPT)
 
