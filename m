From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 03:12:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fuse
Message-ID: <20080710101212.BF7B43C7BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 03:12:11 -0700 (Thu, 10 Jul 2008)
New Revision: 22750

Log:
fuse: remove commented out lines

Modified:
   trunk/buildroot/package/fuse/libfuse.mk


Changeset:
Modified: trunk/buildroot/package/fuse/libfuse.mk
===================================================================
--- trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:12:07 UTC (rev 22749)
+++ trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:12:11 UTC (rev 22750)
@@ -36,19 +36,11 @@
 		--enable-util \
 	);
 	touch $@
-#		--disable-example
-#		--disable-mtab
-#		--disable-rpath
 
- 
 $(LIBFUSE_DIR)/.compiled: $(LIBFUSE_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(LIBFUSE_DIR)
 	touch $@
-#		CROSS_COMPILE="$(TARGET_CROSS)"
-#		AM_CFLAGS="$(TARGET_CFLAGS) -DDISABLE_COMPAT=1" \
-#		EXTRA_DIST=""
 
-
 $(STAGING_DIR)/usr/lib/libfuse.so: $(LIBFUSE_DIR)/.compiled
 	$(MAKE) -C $(LIBFUSE_DIR) DESTDIR=$(STAGING_DIR)/ install
 	touch -c $@
