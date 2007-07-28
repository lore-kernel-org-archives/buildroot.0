From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 09:39:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/coreutils
Message-ID: <20070728163909.73E2AA493A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 09:39:06 -0700 (Sat, 28 Jul 2007)
New Revision: 19296

Log:
Be more specific for coreutils patches

Modified:
   trunk/buildroot/package/coreutils/coreutils.mk


Changeset:
Modified: trunk/buildroot/package/coreutils/coreutils.mk
===================================================================
--- trunk/buildroot/package/coreutils/coreutils.mk	2007-07-28 16:02:07 UTC (rev 19295)
+++ trunk/buildroot/package/coreutils/coreutils.mk	2007-07-28 16:39:06 UTC (rev 19296)
@@ -21,7 +21,7 @@
 
 $(COREUTILS_DIR)/.unpacked: $(DL_DIR)/$(COREUTILS_SOURCE)
 	$(COREUTILS_CAT) $(DL_DIR)/$(COREUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(COREUTILS_DIR) package/coreutils/ \*.patch
+	toolchain/patch-kernel.sh $(COREUTILS_DIR) package/coreutils/ coreutils\*.patch
 	touch $@
 
 $(COREUTILS_DIR)/.configured: $(COREUTILS_DIR)/.unpacked
