From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 08:37:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ed
Message-ID: <20070717153711.9A766A686E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 08:37:08 -0700 (Tue, 17 Jul 2007)
New Revision: 19137

Log:
Avoid repeated build of 'ed'

Modified:
   trunk/buildroot/package/ed/ed.mk


Changeset:
Modified: trunk/buildroot/package/ed/ed.mk
===================================================================
--- trunk/buildroot/package/ed/ed.mk	2007-07-17 15:19:18 UTC (rev 19136)
+++ trunk/buildroot/package/ed/ed.mk	2007-07-17 15:37:08 UTC (rev 19137)
@@ -14,7 +14,7 @@
 $(DL_DIR)/$(ED_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(ED_SITE)/$(ED_SOURCE)
 
-$(ED_DIR)/.unpacked: $(DL_DIR)/$(ED_SOURCE) $(DL_DIR)/$(ED_PATCH)
+$(ED_DIR)/.unpacked: $(DL_DIR)/$(ED_SOURCE)
 	$(ED_CAT) $(DL_DIR)/$(ED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(ED_DIR) package/ed/ ed-\*.patch
 	touch $@
