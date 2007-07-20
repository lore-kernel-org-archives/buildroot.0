From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 20 Jul 2007 04:16:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/coreutils
Message-ID: <20070720111657.366B0A65B8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-20 04:16:56 -0700 (Fri, 20 Jul 2007)
New Revision: 19178

Log:
Ensure 'coreutils' use patch from the correct directory

Modified:
   trunk/buildroot/package/coreutils/coreutils.mk


Changeset:
Modified: trunk/buildroot/package/coreutils/coreutils.mk
===================================================================
--- trunk/buildroot/package/coreutils/coreutils.mk	2007-07-20 11:13:22 UTC (rev 19177)
+++ trunk/buildroot/package/coreutils/coreutils.mk	2007-07-20 11:16:56 UTC (rev 19178)
@@ -21,7 +21,7 @@
 
 $(COREUTILS_DIR)/.unpacked: $(DL_DIR)/$(COREUTILS_SOURCE)
 	$(COREUTILS_CAT) $(DL_DIR)/$(COREUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(COREUTILS_DIR) package/coreutils/ coreutils\*.patch
+	toolchain/patch-kernel.sh $(COREUTILS_DIR) package/coreutils/ \*.patch
 	touch $@
 
 $(COREUTILS_DIR)/.configured: $(COREUTILS_DIR)/.unpacked
