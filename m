From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 03:11:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fuse
Message-ID: <20080710101153.A1087F801D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 03:11:51 -0700 (Thu, 10 Jul 2008)
New Revision: 22747

Log:
fuse: also remove fusermount from target

Modified:
   trunk/buildroot/package/fuse/libfuse.mk


Changeset:
Modified: trunk/buildroot/package/fuse/libfuse.mk
===================================================================
--- trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:11:47 UTC (rev 22746)
+++ trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:11:51 UTC (rev 22747)
@@ -68,7 +68,7 @@
 libfuse-clean:
 	-$(MAKE) -C $(LIBFUSE_DIR) DESTDIR=$(STAGING_DIR) uninstall
 	-$(MAKE) -C $(LIBFUSE_DIR) clean
-	rm -f $(TARGET_DIR)/usr/lib/libfuse.so*
+	rm -f $(TARGET_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/lib/libfuse.so*
 
 libfuse-dirclean:
 	rm -rf $(LIBFUSE_DIR)
