From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 17 Jul 2008 06:25:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fuse
Message-ID: <20080717132536.F29863C885@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-17 06:25:35 -0700 (Thu, 17 Jul 2008)
New Revision: 22864

Log:
fuse: fix target install

Also copy libfuse.so symlink so fuse target isn't considered out of date

Modified:
   trunk/buildroot/package/fuse/libfuse.mk


Changeset:
Modified: trunk/buildroot/package/fuse/libfuse.mk
===================================================================
--- trunk/buildroot/package/fuse/libfuse.mk	2008-07-17 13:20:37 UTC (rev 22863)
+++ trunk/buildroot/package/fuse/libfuse.mk	2008-07-17 13:25:35 UTC (rev 22864)
@@ -51,8 +51,8 @@
 	mkdir -p $(TARGET_DIR)/usr/bin
 	cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/fusermount
-	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so.* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfuse.so.*
+	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfuse.so
 	touch -c $@
 
 libfuse: uclibc $(TARGET_DIR)/usr/lib/libfuse.so
