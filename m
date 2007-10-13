From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 13 Oct 2007 16:08:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/jpeg
Message-ID: <20071013230802.20AADA6151@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-13 16:08:01 -0700 (Sat, 13 Oct 2007)
New Revision: 20245

Log:
Create dir before use in jpeg pkg

Modified:
   trunk/buildroot/package/jpeg/jpeg.mk


Changeset:
Modified: trunk/buildroot/package/jpeg/jpeg.mk
===================================================================
--- trunk/buildroot/package/jpeg/jpeg.mk	2007-10-13 23:07:04 UTC (rev 20244)
+++ trunk/buildroot/package/jpeg/jpeg.mk	2007-10-13 23:08:01 UTC (rev 20245)
@@ -73,6 +73,7 @@
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libjpeg.so: $(STAGING_DIR)/lib/libjpeg.a
+	mkdir -p $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/lib/libjpeg.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libjpeg.so*
 	touch -c $@
