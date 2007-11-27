From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 27 Nov 2007 00:26:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/wipe
Message-ID: <20071127082646.078AEA685A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-27 00:26:46 -0800 (Tue, 27 Nov 2007)
New Revision: 20549

Log:
Allow cross compile of wipe (courtesy Ivan Kuten)

Modified:
   trunk/buildroot/package/wipe/wipe.mk


Changeset:
Modified: trunk/buildroot/package/wipe/wipe.mk
===================================================================
--- trunk/buildroot/package/wipe/wipe.mk	2007-11-27 08:21:58 UTC (rev 20548)
+++ trunk/buildroot/package/wipe/wipe.mk	2007-11-27 08:26:46 UTC (rev 20549)
@@ -33,7 +33,7 @@
 
 $(WIPE_DIR)/$(WIPE_BINARY): $(WIPE_DIR)/.configured
 	rm -f $(WIPE_DIR)/$(WIPE_BINARY)
-	$(MAKE) CC=$(TARGET_CC) -C $(WIPE_DIR) generic
+	$(MAKE) CC=$(TARGET_CC) CC_GENERIC=$(TARGET_CC) -C $(WIPE_DIR) generic
 
 $(TARGET_DIR)/$(WIPE_TARGET_BINARY): $(WIPE_DIR)/$(WIPE_BINARY)
 	cp -a $(WIPE_DIR)/$(WIPE_BINARY) $(TARGET_DIR)/$(WIPE_TARGET_BINARY)
