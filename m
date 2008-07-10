From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 03:11:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fuse
Message-ID: <20080710101148.24202F8019@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 03:11:47 -0700 (Thu, 10 Jul 2008)
New Revision: 22746

Log:
fuse: strip binaries/libs in target

Modified:
   trunk/buildroot/package/fuse/libfuse.mk


Changeset:
Modified: trunk/buildroot/package/fuse/libfuse.mk
===================================================================
--- trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:11:43 UTC (rev 22745)
+++ trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:11:47 UTC (rev 22746)
@@ -56,8 +56,9 @@
 	mkdir -p $(TARGET_DIR)/usr/lib
 	mkdir -p $(TARGET_DIR)/usr/bin
 	cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/fusermount
 	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so.* $(TARGET_DIR)/usr/lib/
-#	cp -dpf $(STAGING_DIR)/lib/modules/(uname-r)/kernel/fs/fuse/fuse.pc $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfuse.so.*
 	touch -c $@
 
 libfuse: uclibc $(TARGET_DIR)/usr/lib/libfuse.so
