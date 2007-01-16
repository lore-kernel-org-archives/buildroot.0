From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 15 Jan 2007 16:33:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/file
Message-ID: <20070116003325.425574857F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-15 16:33:24 -0800 (Mon, 15 Jan 2007)
New Revision: 17321

Log:
Fix failed build due to addition of '--libdir=/lib' which changed the location of where libmagic.a and libmagic.la were located.


Modified:
   trunk/buildroot/package/file/file.mk


Changeset:
Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2007-01-15 22:37:08 UTC (rev 17320)
+++ trunk/buildroot/package/file/file.mk	2007-01-16 00:33:24 UTC (rev 17321)
@@ -91,8 +91,8 @@
 	-($(STRIP) $(TARGET_DIR)/usr/lib/libmagic.so.*.* > /dev/null 2>&1)
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-	mv $(TARGET_DIR)/usr/lib/libmagic.a $(STAGING_DIR)/lib
-	rm -f $(TARGET_DIR)/usr/lib/libmagic.la
+	mv $(TARGET_DIR)/lib/libmagic.a $(STAGING_DIR)/lib
+	rm -f $(TARGET_DIR)/lib/libmagic.la
 	mv $(TARGET_DIR)/usr/include/magic.h $(STAGING_DIR)/include
 
 file: zlib uclibc $(TARGET_DIR)/$(FILE_TARGET_BINARY)
