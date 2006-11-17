From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 17 Nov 2006 03:51:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: gmp mpfr
Message-ID: <20061117115117.8EF8C485F7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-17 03:51:17 -0800 (Fri, 17 Nov 2006)
New Revision: 16556

Log:
- Typo fix: copy headers to the correct location on the target.


Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2006-11-17 11:48:42 UTC (rev 16555)
+++ trunk/buildroot/package/gmp/gmp.mk	2006-11-17 11:51:17 UTC (rev 16556)
@@ -76,7 +76,8 @@
 	cp -a $(STAGING_DIR)/lib/libgmp.so* $(STAGING_DIR)/lib/libgmp.a \
 		 $(TARGET_DIR)/lib/
 ifeq ($(BR2_PACKAGE_GMP_HEADERS),y)
-	cp -a $(STAGING_DIR)/include/gmp.h $(TARGET_DIR)/include/
+	test -d $(TARGET_DIR)/usr/include || mkdir -p $(TARGET_DIR)/usr/include
+	cp -a $(STAGING_DIR)/include/gmp.h $(TARGET_DIR)/usr/include/
 endif
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgmp.so* \
 		$(TARGET_DIR)/lib/libgmp.a

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2006-11-17 11:48:42 UTC (rev 16555)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2006-11-17 11:51:17 UTC (rev 16556)
@@ -83,7 +83,7 @@
 		$(TARGET_DIR)/lib/
 ifeq ($(BR2_PACKAGE_MPFR_HEADERS),y)
 	cp -a $(STAGING_DIR)/include/mpfr.h $(STAGING_DIR)/include/mpf2mpfr.h \
-		$(TARGET_DIR)/include/
+		$(TARGET_DIR)/usr/include/
 endif
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libmpfr.so* \
 		$(TARGET_DIR)/lib/libmpfr.a
