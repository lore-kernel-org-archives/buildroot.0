From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 10 Jan 2007 23:36:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pango
Message-ID: <20070111073646.B1E7E4858B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-10 23:36:46 -0800 (Wed, 10 Jan 2007)
New Revision: 17245

Log:
use a slightly more sensible dep, strip the correct library names


Modified:
   trunk/buildroot/package/pango/pango.mk


Changeset:
Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2007-01-11 07:35:59 UTC (rev 17244)
+++ trunk/buildroot/package/pango/pango.mk	2007-01-11 07:36:46 UTC (rev 17245)
@@ -141,7 +141,7 @@
 	    mandir=$(STAGING_DIR)/man \
 	    -C $(PANGO_DIR) install;
 
-$(TARGET_DIR)/lib/libpango-1.0.so.0.1300.5: $(STAGING_DIR)/lib/$(PANGO_BINARY)
+$(TARGET_DIR)/lib/libpango-1.0.so.0: $(STAGING_DIR)/lib/$(PANGO_BINARY)
 	cp -a $(STAGING_DIR)/lib/libpango-1.0.so $(TARGET_DIR)/lib/
 	cp -a $(STAGING_DIR)/lib/libpango-1.0.so.0* $(TARGET_DIR)/lib/
 	cp -a $(STAGING_DIR)/lib/libpangox-1.0.so $(TARGET_DIR)/lib/
@@ -152,15 +152,15 @@
 	cp -a $(STAGING_DIR)/lib/libpangoxft-1.0.so.0* $(TARGET_DIR)/lib/
 	cp -a $(STAGING_DIR)/lib/libpangocairo-1.0.so $(TARGET_DIR)/lib/
 	cp -a $(STAGING_DIR)/lib/libpangocairo-1.0.so.0* $(TARGET_DIR)/lib/
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libpango-2.0.so.0.*
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgpangox-2.0.so.0.*
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgoft2-2.0.so.0.*
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgoxft-2.0.so.0.*
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgocairo-2.0.so.0.*
-	touch -c $(TARGET_DIR)/lib/libpango-1.0.so.0.1300.5
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libpango-1.0.so.0.*
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgpangox-1.0.so.0.*
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgoft2-1.0.so.0.*
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgoxft-1.0.so.0.*
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgocairo-1.0.so.0.*
+	touch -c $(TARGET_DIR)/lib/libpango-1.0.so.0
 
 pango: uclibc gettext libintl pkgconfig libglib2 xorg cairo \
-	$(TARGET_DIR)/lib/libpango-1.0.so.0.1300.5
+	$(TARGET_DIR)/lib/libpango-1.0.so.0
 
 pango-clean:
 	rm -f $(TARGET_DIR)/lib/$(PANGO_BINARY)
