From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 03:12:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fuse
Message-ID: <20080710101208.821003C6F0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 03:12:07 -0700 (Thu, 10 Jul 2008)
New Revision: 22749

Log:
fuse: cleanup configure args

Modified:
   trunk/buildroot/package/fuse/libfuse.mk


Changeset:
Modified: trunk/buildroot/package/fuse/libfuse.mk
===================================================================
--- trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:12:00 UTC (rev 22748)
+++ trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:12:07 UTC (rev 22749)
@@ -25,9 +25,10 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
 		--enable-shared \
 		--enable-static \
-		--program-prefix="" \
 		--disable-nls \
 		--disable-example \
 		--disable-kernel-module \
@@ -49,7 +50,7 @@
 
 
 $(STAGING_DIR)/usr/lib/libfuse.so: $(LIBFUSE_DIR)/.compiled
-	$(MAKE) prefix=/usr -C $(LIBFUSE_DIR) DESTDIR=$(STAGING_DIR)/ install
+	$(MAKE) -C $(LIBFUSE_DIR) DESTDIR=$(STAGING_DIR)/ install
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libfuse.so: $(STAGING_DIR)/usr/lib/libfuse.so
