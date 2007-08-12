From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 16:27:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libsysfs
Message-ID: <20070812232738.9E9F5A681F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 16:27:38 -0700 (Sun, 12 Aug 2007)
New Revision: 19472

Log:
fix libsysfs.la paths

Modified:
   trunk/buildroot/package/libsysfs/libsysfs.mk


Changeset:
Modified: trunk/buildroot/package/libsysfs/libsysfs.mk
===================================================================
--- trunk/buildroot/package/libsysfs/libsysfs.mk	2007-08-12 23:26:28 UTC (rev 19471)
+++ trunk/buildroot/package/libsysfs/libsysfs.mk	2007-08-12 23:27:38 UTC (rev 19472)
@@ -56,6 +56,8 @@
 
 $(STAGING_DIR)/usr/lib/libsysfs.so: $(LIBSYSFS_DIR)/.compiled
 	$(MAKE) -C $(LIBSYSFS_DIR) DESTDIR=$(STAGING_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
+		$(STAGING_DIR)/usr/lib/libsysfs.la
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libsysfs.so: $(STAGING_DIR)/usr/lib/libsysfs.so
