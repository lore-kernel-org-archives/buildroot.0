From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue,  9 Jan 2007 23:22:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20070110072205.C5440485A6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-09 23:22:05 -0800 (Tue, 09 Jan 2007)
New Revision: 17220

Log:
bump version to the latest stable release


Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2007-01-10 06:55:27 UTC (rev 17219)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2007-01-10 07:22:05 UTC (rev 17220)
@@ -3,7 +3,7 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION:=2.12.3
+LIBGLIB2_VERSION:=2.12.6
 LIBGLIB2_SOURCE:=glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE:=http://ftp.gtk.org/pub/glib/2.12
 LIBGLIB2_CAT:=$(BZCAT)
@@ -131,7 +131,7 @@
 	    mandir=$(STAGING_DIR)/man \
 	    -C $(LIBGLIB2_DIR) install;
 
-$(TARGET_DIR)/lib/libglib-2.0.so.0.1200.3: $(STAGING_DIR)/lib/$(LIBGLIB2_BINARY)
+$(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6: $(STAGING_DIR)/lib/$(LIBGLIB2_BINARY)
 	cp -a $(STAGING_DIR)/lib/libglib-2.0.so $(TARGET_DIR)/lib/
 	cp -a $(STAGING_DIR)/lib/libglib-2.0.so.0* $(TARGET_DIR)/lib/
 	cp -a $(STAGING_DIR)/lib/libgmodule-2.0.so $(TARGET_DIR)/lib/
@@ -141,9 +141,9 @@
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libglib-2.0.so.0.*
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgmodule-2.0.so.0.*
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgobject-2.0.so.0.*
-	touch -c $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.3
+	touch -c $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6
 
-libglib2: uclibc gettext libintl $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.3
+libglib2: uclibc gettext libintl $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.6
 
 libglib2-clean:
 	rm -f $(TARGET_DIR)/lib/$(LIBGLIB2_BINARY)
