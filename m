From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 02:01:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/zlib
Message-ID: <20070625090154.0BC97A45BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 02:01:53 -0700 (Mon, 25 Jun 2007)
New Revision: 18912

Log:
- make sure that TARGET_DIR/usr/lib exists


Modified:
   trunk/buildroot/package/zlib/zlib.mk


Changeset:
Modified: trunk/buildroot/package/zlib/zlib.mk
===================================================================
--- trunk/buildroot/package/zlib/zlib.mk	2007-06-25 08:58:38 UTC (rev 18911)
+++ trunk/buildroot/package/zlib/zlib.mk	2007-06-25 09:01:53 UTC (rev 18912)
@@ -55,11 +55,11 @@
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.so.$(ZLIB_VER)
-	mkdir -p $(TARGET_DIR)/usr/include
+	mkdir -p $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/include/zlib.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(STAGING_DIR)/usr/include/zconf.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/
-	rm -f $(TARGET_DIR)/lib/libz.so
+	rm -f $(TARGET_DIR)/lib/libz.so $(TARGET_DIR)/usr/lib/libz.so
 	ln -sf libz.so.$(ZLIB_VER) $(TARGET_DIR)/usr/lib/libz.so
 	touch -c $@
 
