From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 02:07:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/zlib
Message-ID: <20070625090708.B8929A45B5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 02:07:08 -0700 (Mon, 25 Jun 2007)
New Revision: 18913

Log:
- improve the zlib-clean target


Modified:
   trunk/buildroot/package/zlib/zlib.mk


Changeset:
Modified: trunk/buildroot/package/zlib/zlib.mk
===================================================================
--- trunk/buildroot/package/zlib/zlib.mk	2007-06-25 09:01:53 UTC (rev 18912)
+++ trunk/buildroot/package/zlib/zlib.mk	2007-06-25 09:07:08 UTC (rev 18913)
@@ -50,6 +50,7 @@
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libz.so.$(ZLIB_VER): $(STAGING_DIR)/usr/lib/libz.so.$(ZLIB_VER)
+	mkdir -p $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/libz.so* $(TARGET_DIR)/usr/lib
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libz.so*
 	touch -c $@
@@ -71,7 +72,11 @@
 
 zlib-clean:
 	rm -f $(TARGET_DIR)/usr/lib/libz.so* \
-		$(TARGET_DIR)/usr/include/z{lib,conf}.h
+		$(TARGET_DIR)/usr/include/zlib.h \
+		$(TARGET_DIR)/usr/include/zconf.h \
+		$(STAGING_DIR)/usr/include/zlib.h \
+		$(STAGING_DIR)/usr/include/zconf.h \
+		$(STAGING_DIR)/usr/lib/libz.*
 	-$(MAKE) -C $(ZLIB_DIR) clean
 
 zlib-dirclean:
