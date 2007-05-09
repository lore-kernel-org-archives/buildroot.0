From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  9 May 2007 04:46:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/expat
Message-ID: <20070509114649.3BD814800B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-09 04:46:47 -0700 (Wed, 09 May 2007)
New Revision: 18589

Log:
Strip lib even if soname changes

Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2007-05-08 23:23:35 UTC (rev 18588)
+++ trunk/buildroot/package/expat/expat.mk	2007-05-09 11:46:47 UTC (rev 18589)
@@ -56,7 +56,7 @@
 $(TARGET_DIR)/lib/libexpat.so.1: $(STAGING_DIR)/lib/libexpat.so.1
 	cp -dpf $(STAGING_DIR)/lib/libexpat.so* $(TARGET_DIR)/lib/
 	#cp -dpf $(STAGING_DIR)/usr/bin/xmlwf $(TARGET_DIR)/bin/xmlwf
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libexpat.so.0.5.0
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libexpat.so*
 	touch -c $(TARGET_DIR)/lib/libexpat.so.1
 
 expat: uclibc pkgconfig $(TARGET_DIR)/lib/libexpat.so.1
