From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 19 Sep 2006 07:56:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/jpeg
Message-ID: <20060919145622.973AB485BA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-19 07:56:21 -0700 (Tue, 19 Sep 2006)
New Revision: 16157

Log:
Don't copy static lib to TARGET_DIR

Modified:
   trunk/buildroot/package/jpeg/jpeg.mk


Changeset:
Modified: trunk/buildroot/package/jpeg/jpeg.mk
===================================================================
--- trunk/buildroot/package/jpeg/jpeg.mk	2006-09-19 14:47:54 UTC (rev 16156)
+++ trunk/buildroot/package/jpeg/jpeg.mk	2006-09-19 14:56:21 UTC (rev 16157)
@@ -58,12 +58,12 @@
 	rm $(STAGING_DIR)/lib/libjpeg.la
 	touch -c $(STAGING_DIR)/lib/libjpeg.a
 
-$(TARGET_DIR)/usr/lib/libjpeg.a: $(STAGING_DIR)/lib/libjpeg.a
-	cp -dpf $(STAGING_DIR)/lib/libjpeg* $(TARGET_DIR)/usr/lib/
+$(TARGET_DIR)/usr/lib/libjpeg.so: $(STAGING_DIR)/lib/libjpeg.a
+	cp -dpf $(STAGING_DIR)/lib/libjpeg.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libjpeg.so*
-	touch -c $(TARGET_DIR)/usr/lib/libjpeg.a
+	touch -c $(TARGET_DIR)/usr/lib/libjpeg.so
 
-jpeg: uclibc $(TARGET_DIR)/usr/lib/libjpeg.a
+jpeg: uclibc $(TARGET_DIR)/usr/lib/libjpeg.so
 
 jpeg-clean:
 	-$(MAKE) -C $(JPEG_DIR) clean
