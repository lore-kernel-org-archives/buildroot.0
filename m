From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  2 Nov 2008 22:16:37 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mkdosfs
Message-ID: <20081103061637.877213C89B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-02 22:16:36 -0800 (Sun, 02 Nov 2008)
New Revision: 23907

Log:
mkdosfs: cleanup target install handling

closes #5834.

Modified:
   trunk/buildroot/package/mkdosfs/mkdosfs.mk


Changeset:
Modified: trunk/buildroot/package/mkdosfs/mkdosfs.mk
===================================================================
--- trunk/buildroot/package/mkdosfs/mkdosfs.mk	2008-11-02 20:21:59 UTC (rev 23906)
+++ trunk/buildroot/package/mkdosfs/mkdosfs.mk	2008-11-03 06:16:36 UTC (rev 23907)
@@ -26,8 +26,8 @@
 	touch -c $(MKDOSFS_DIR)/mkdosfs/mkdosfs
 
 $(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY): $(MKDOSFS_DIR)/$(MKDOSFS_BINARY)
-	cp -a $(MKDOSFS_DIR)/$(MKDOSFS_BINARY) $(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
-	touch -c $(TARGET_DIR)/sbin/mkdosfs
+	cp -a $(MKDOSFS_DIR)/$(MKDOSFS_BINARY) $@
+	touch -c $@
 
 mkdosfs: uclibc $(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
 
