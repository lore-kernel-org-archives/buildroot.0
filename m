From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 10:05:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/wipe
Message-ID: <20070717170559.56A92A6049@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 10:05:58 -0700 (Tue, 17 Jul 2007)
New Revision: 19138

Log:
Avoid repeated rebuilds of 'wipe'

Modified:
   trunk/buildroot/package/wipe/wipe.mk


Changeset:
Modified: trunk/buildroot/package/wipe/wipe.mk
===================================================================
--- trunk/buildroot/package/wipe/wipe.mk	2007-07-17 15:37:08 UTC (rev 19137)
+++ trunk/buildroot/package/wipe/wipe.mk	2007-07-17 17:05:58 UTC (rev 19138)
@@ -29,9 +29,10 @@
 	touch $(WIPE_DIR)/.unpacked
 
 $(WIPE_DIR)/.configured: $(WIPE_DIR)/.unpacked
-	touch  $(WIPE_DIR)/.configured
+	touch  $@
 
 $(WIPE_DIR)/$(WIPE_BINARY): $(WIPE_DIR)/.configured
+	rm -f $(WIPE_DIR)/$(WIPE_BINARY)
 	$(MAKE) CC=$(TARGET_CC) -C $(WIPE_DIR)  generic
 
 $(TARGET_DIR)/$(WIPE_TARGET_BINARY): $(WIPE_DIR)/$(WIPE_BINARY)
