From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 14:44:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/patch
Message-ID: <20070819214459.9F295A467E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 14:44:58 -0700 (Sun, 19 Aug 2007)
New Revision: 19575

Log:
Replace non-working 'make uninstall' for 'package/patch' with simple 'rm'

Modified:
   trunk/buildroot/package/patch/patch.mk


Changeset:
Modified: trunk/buildroot/package/patch/patch.mk
===================================================================
--- trunk/buildroot/package/patch/patch.mk	2007-08-19 21:24:37 UTC (rev 19574)
+++ trunk/buildroot/package/patch/patch.mk	2007-08-19 21:44:58 UTC (rev 19575)
@@ -18,6 +18,7 @@
 
 $(GNUPATCH_DIR)/.unpacked: $(DL_DIR)/$(GNUPATCH_SOURCE)
 	$(GNUPATCH_CAT) $(DL_DIR)/$(GNUPATCH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(GNUPATCH_DIR)
 	touch $(GNUPATCH_DIR)/.unpacked
 
 $(GNUPATCH_DIR)/.configured: $(GNUPATCH_DIR)/.unpacked
@@ -54,8 +55,7 @@
 patch: uclibc $(TARGET_DIR)/$(GNUPATCH_TARGET_BINARY)
 
 patch-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GNUPATCH_DIR) uninstall
-	-$(MAKE) -C $(GNUPATCH_DIR) clean
+	rm -f $(TARGET_DIR)/$(GNUPATCH_TARGET_BINARY)
 
 patch-dirclean:
 	rm -rf $(GNUPATCH_DIR)
