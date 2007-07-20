From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 20 Jul 2007 01:08:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd/20050122
Message-ID: <20070720080805.4BE7630073@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-20 01:08:04 -0700 (Fri, 20 Jul 2007)
New Revision: 19171

Log:
Patch mtd from correct directory

Modified:
   trunk/buildroot/package/mtd/20050122/mtd.mk


Changeset:
Modified: trunk/buildroot/package/mtd/20050122/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/20050122/mtd.mk	2007-07-20 08:00:19 UTC (rev 19170)
+++ trunk/buildroot/package/mtd/20050122/mtd.mk	2007-07-20 08:08:04 UTC (rev 19171)
@@ -51,7 +51,7 @@
 	$(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	mv $(TOOL_BUILD_DIR)/$(shell tar tzf $(DL_DIR)/$(MTD_SOURCE) | head -n 1 \
 		| xargs basename) $(MTD_HOST_DIR)
-	toolchain/patch-kernel.sh $(MTD_HOST_DIR) package/mtd \*.patch
+	toolchain/patch-kernel.sh $(MTD_HOST_DIR) package/mtd/20050122 \*.patch
 	touch $@
 endif
 
