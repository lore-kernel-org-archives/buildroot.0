From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 30 Nov 2007 04:33:37 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/speex
Message-ID: <20071130123337.0AF1730058@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-30 04:33:37 -0800 (Fri, 30 Nov 2007)
New Revision: 20597

Log:
Ensure speex will use any future patch

Modified:
   trunk/buildroot/package/speex/speex.mk


Changeset:
Modified: trunk/buildroot/package/speex/speex.mk
===================================================================
--- trunk/buildroot/package/speex/speex.mk	2007-11-30 12:32:33 UTC (rev 20596)
+++ trunk/buildroot/package/speex/speex.mk	2007-11-30 12:33:37 UTC (rev 20597)
@@ -23,6 +23,7 @@
 
 $(SPEEX_DIR)/.unpacked: $(DL_DIR)/$(SPEEX_SOURCE)
 	$(SPEEX_CAT) $(DL_DIR)/$(SPEEX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(SPEEX_DIR) package/speex/ speex-$(SPEEX_VERSION)\*.patch
 	$(CONFIG_UPDATE) $(SPEEX_DIR)
 	touch $(SPEEX_DIR)/.unpacked
 
