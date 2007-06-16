From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 16 Jun 2007 10:55:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target: cloop ext2
Message-ID: <20070616175532.AC94A485EB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-06-16 10:55:32 -0700 (Sat, 16 Jun 2007)
New Revision: 18834

Log:
Get rid of extra directory entries.


Modified:
   trunk/buildroot/target/cloop/cloop.mk
   trunk/buildroot/target/ext2/ext2root.mk


Changeset:
Modified: trunk/buildroot/target/cloop/cloop.mk
===================================================================
--- trunk/buildroot/target/cloop/cloop.mk	2007-06-16 17:55:05 UTC (rev 18833)
+++ trunk/buildroot/target/cloop/cloop.mk	2007-06-16 17:55:32 UTC (rev 18834)
@@ -77,6 +77,7 @@
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/share/man
 	@rm -rf $(TARGET_DIR)/usr/info
+	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	### $(CLOOP_DIR)/create_compressed_fs -q -D target/default/device_table.txt $(TARGET_DIR) $(IMAGE).cloop
 	## mkisofs -r $(TARGET_DIR) | $(CLOOP_DIR)/create_compressed_fs - 65536 > $(IMAGE).cloop
 	sudo /sbin/losetup -d /dev/loop1

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2007-06-16 17:55:05 UTC (rev 18833)
+++ trunk/buildroot/target/ext2/ext2root.mk	2007-06-16 17:55:32 UTC (rev 18834)
@@ -91,6 +91,7 @@
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/share/man
 	@rm -rf $(TARGET_DIR)/usr/info
+	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
