From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 10 Jan 2007 15:54:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20070110235436.5747D48585@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-10 15:54:35 -0800 (Wed, 10 Jan 2007)
New Revision: 17235

Log:
fixup freetype build and install locations


Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2007-01-10 22:35:54 UTC (rev 17234)
+++ trunk/buildroot/package/freetype/freetype.mk	2007-01-10 23:54:35 UTC (rev 17235)
@@ -26,22 +26,22 @@
 	--target=$(GNU_TARGET_NAME) \
 	--host=$(GNU_TARGET_NAME) \
 	--build=$(GNU_HOST_NAME) \
-	--prefix=$(STAGING_DIR)/usr );
+	--prefix=$(STAGING_DIR) );
 	touch $(FREETYPE_DIR)/.configured
 
 $(FREETYPE_DIR)/.compiled: $(FREETYPE_DIR)/.configured
 	$(MAKE) -C $(FREETYPE_DIR) 
 	touch $(FREETYPE_DIR)/.compiled
 
-$(STAGING_DIR)/usr/lib/libfreetype.so: $(FREETYPE_DIR)/.compiled
+$(STAGING_DIR)/lib/libfreetype.so: $(FREETYPE_DIR)/.compiled
 	$(MAKE) -C $(FREETYPE_DIR) install
 	touch -c $(STAGING_DIR)/lib/libfreetype.so
 
-$(TARGET_DIR)/usr/lib/libfreetype.so: $(STAGING_DIR)/usr/lib/libfreetype.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libfreetype.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libfreetype.so
+$(TARGET_DIR)/lib/libfreetype.so: $(STAGING_DIR)/lib/libfreetype.so
+	cp -dpf $(STAGING_DIR)/lib/libfreetype.so* $(TARGET_DIR)/lib/
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libfreetype.so
 
-freetype: uclibc $(TARGET_DIR)/usr/lib/libfreetype.so
+freetype: uclibc $(TARGET_DIR)/lib/libfreetype.so
 
 freetype-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FREETYPE_DIR) uninstall
