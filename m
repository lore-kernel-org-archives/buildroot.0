From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 13 Dec 2006 03:01:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/modutils
Message-ID: <20061213110155.81A6B48569@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-13 03:01:54 -0800 (Wed, 13 Dec 2006)
New Revision: 16882

Log:
update paths


Modified:
   trunk/buildroot/package/modutils/modutils.mk


Changeset:
Modified: trunk/buildroot/package/modutils/modutils.mk
===================================================================
--- trunk/buildroot/package/modutils/modutils.mk	2006-12-13 09:17:12 UTC (rev 16881)
+++ trunk/buildroot/package/modutils/modutils.mk	2006-12-13 11:01:54 UTC (rev 16882)
@@ -95,11 +95,12 @@
 	$(MAKE1) -C $(MODUTILS_DIR2)
 	touch -c $(MODUTILS_DIR2)/$(MODUTILS_BINARY)
 
-$(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-depmod: $(MODUTILS_DIR2)/$(MODUTILS_BINARY)
-	cp $(MODUTILS_DIR2)/$(MODUTILS_BINARY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-depmod
-	touch -c $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-depmod
+$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod: $(MODUTILS_DIR2)/$(MODUTILS_BINARY)
+	mkdir -p $(STAGING_DIR)/bin
+	cp $(MODUTILS_DIR2)/$(MODUTILS_BINARY) $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod
+	touch -c $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod
 
-cross-depmod: uclibc $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-depmod
+cross-depmod: uclibc $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod
 
 cross-depmod-source: $(DL_DIR)/$(MODUTILS_SOURCE)
 
