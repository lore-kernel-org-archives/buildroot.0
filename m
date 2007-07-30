From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 30 Jul 2007 07:22:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/ext2
Message-ID: <20070730142227.7F94CA4680@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-30 07:22:25 -0700 (Mon, 30 Jul 2007)
New Revision: 19340

Log:
- remove stray ';'


Modified:
   trunk/buildroot/target/ext2/ext2root.mk


Changeset:
Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2007-07-30 12:37:16 UTC (rev 19339)
+++ trunk/buildroot/target/ext2/ext2root.mk	2007-07-30 14:22:25 UTC (rev 19340)
@@ -87,12 +87,13 @@
 endif
 
 $(EXT2_BASE): host-fakeroot makedevs genext2fs
-	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
+	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/share/man
 	@rm -rf $(TARGET_DIR)/usr/info
 	@test -d $(TARGET_DIR)/usr/share && \
-		rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+		rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share || \
+		true
 	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
