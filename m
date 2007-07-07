From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  7 Jul 2007 04:06:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/file
Message-ID: <20070707110608.02492A6837@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-07 04:06:08 -0700 (Sat, 07 Jul 2007)
New Revision: 19019

Log:
- using $(STAGING_DIR)/include is inherently wrong. $(STAGING_DIR)/usr/include
  is the proper path for includes (check your host)


Modified:
   trunk/buildroot/package/file/file.mk


Changeset:
Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2007-07-07 10:39:13 UTC (rev 19018)
+++ trunk/buildroot/package/file/file.mk	2007-07-07 11:06:08 UTC (rev 19019)
@@ -94,8 +94,7 @@
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	mv $(TARGET_DIR)/lib/libmagic.a $(STAGING_DIR)/lib
 	rm -f $(TARGET_DIR)/lib/libmagic.la
-	mkdir -p $(STAGING_DIR)/include
-	mv $(TARGET_DIR)/usr/include/magic.h $(STAGING_DIR)/include
+	mv $(TARGET_DIR)/usr/include/magic.h $(STAGING_DIR)/usr/include
 
 file: zlib uclibc $(TARGET_DIR)/$(FILE_TARGET_BINARY)
 
