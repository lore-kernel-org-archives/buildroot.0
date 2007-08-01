From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 01:36:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
Message-ID: <20070801083612.9A6C4A60E8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 01:36:11 -0700 (Wed, 01 Aug 2007)
New Revision: 19378

Log:
Cleanup libpng, use usr/lib

Modified:
   trunk/buildroot/package/libpng/libpng.mk


Changeset:
Modified: trunk/buildroot/package/libpng/libpng.mk
===================================================================
--- trunk/buildroot/package/libpng/libpng.mk	2007-08-01 08:35:13 UTC (rev 19377)
+++ trunk/buildroot/package/libpng/libpng.mk	2007-08-01 08:36:11 UTC (rev 19378)
@@ -62,7 +62,7 @@
 	$(MAKE) -C $(LIBPNG_DIR)
 	touch $@
 
-$(STAGING_DIR)/lib/libpng.so: $(LIBPNG_DIR)/.compiled
+$(STAGING_DIR)/usr/lib/libpng.so: $(LIBPNG_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBPNG_DIR) install;
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libpng12.la
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
@@ -72,9 +72,9 @@
 		$(STAGING_DIR)/usr/bin/libpng12-config
 	touch -c $@
 
-$(TARGET_DIR)/usr/lib/libpng.so: $(STAGING_DIR)/lib/libpng.so
+$(TARGET_DIR)/usr/lib/libpng.so: $(STAGING_DIR)/usr/lib/libpng.so
 	cp -dpf $(STAGING_DIR)/lib/libpng*.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libpng.so
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libpng*
 
 png libpng: uclibc zlib pkgconfig $(TARGET_DIR)/usr/lib/libpng.so
 
