From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  5 Aug 2007 07:00:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
Message-ID: <20070805140009.56D14A48D9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-05 07:00:05 -0700 (Sun, 05 Aug 2007)
New Revision: 19406

Log:
- fix bug introduced by ulf in r19378.


Modified:
   trunk/buildroot/package/libpng/libpng.mk


Changeset:
Modified: trunk/buildroot/package/libpng/libpng.mk
===================================================================
--- trunk/buildroot/package/libpng/libpng.mk	2007-08-05 12:21:11 UTC (rev 19405)
+++ trunk/buildroot/package/libpng/libpng.mk	2007-08-05 14:00:05 UTC (rev 19406)
@@ -73,7 +73,7 @@
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libpng.so: $(STAGING_DIR)/usr/lib/libpng.so
-	cp -dpf $(STAGING_DIR)/lib/libpng*.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/lib/libpng*.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libpng*
 
 png libpng: uclibc zlib pkgconfig $(TARGET_DIR)/usr/lib/libpng.so
