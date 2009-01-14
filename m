From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 14 Jan 2009 22:05:20 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mrouted
Message-ID: <20090114220521.1DD0176C8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-14 22:05:19 +0000 (Wed, 14 Jan 2009)
New Revision: 24842

Log:
Add mrouted-unpacked target

Modified:
   trunk/buildroot/package/mrouted/mrouted.mk


Changeset:
Modified: trunk/buildroot/package/mrouted/mrouted.mk
===================================================================
--- trunk/buildroot/package/mrouted/mrouted.mk	2009-01-14 16:52:10 UTC (rev 24841)
+++ trunk/buildroot/package/mrouted/mrouted.mk	2009-01-14 22:05:19 UTC (rev 24842)
@@ -19,8 +19,6 @@
 $(DL_DIR)/$(MROUTED_PATCH):
 	 $(WGET) -P $(DL_DIR) $(MROUTED_SITE)/$(MROUTED_PATCH)
 
-mrouted-source: $(DL_DIR)/$(MROUTED_SOURCE) $(DL_DIR)/$(MROUTED_PATCH)
-
 $(MROUTED_DIR)/.unpacked: $(DL_DIR)/$(MROUTED_SOURCE) $(DL_DIR)/$(MROUTED_PATCH)
 	$(MROUTED_CAT) $(DL_DIR)/$(MROUTED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(MROUTED_CAT) $(DL_DIR)/$(MROUTED_PATCH) | patch -p1 -d $(MROUTED_DIR)
@@ -36,6 +34,10 @@
 
 mrouted: uclibc $(TARGET_DIR)/$(MROUTED_TARGET_BINARY)
 
+mrouted-source: $(DL_DIR)/$(MROUTED_SOURCE) $(DL_DIR)/$(MROUTED_PATCH)
+
+mrouted-unpacked: $(MROUTED_DIR)/.unpacked
+
 mrouted-clean:
 	rm -f $(TARGET_DIR)/$(MROUTED_TARGET_BINARY)
 	-$(MAKE) -C $(MROUTED_DIR) clean
