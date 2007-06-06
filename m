From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  6 Jun 2007 12:50:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: gmp mpfr
Message-ID: <20070606195005.B14EC48577@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-06 12:50:05 -0700 (Wed, 06 Jun 2007)
New Revision: 18761

Log:
- better also copy the link targets..


Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-06-06 19:45:46 UTC (rev 18760)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-06-06 19:50:05 UTC (rev 18761)
@@ -89,7 +89,7 @@
 	$(STRIP) --strip-unneeded $(STAGING_DIR)/lib/libgmp$(LIBTGTEXT)*
 
 $(TARGET_DIR)/lib/libgmp.so $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION) $(TARGET_DIR)/lib/libgmp.a: $(STAGING_DIR)/lib/$(GMP_BINARY)
-	cp -dpf $(STAGING_DIR)/lib/libgmp$(LIBTGTEXT) $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/libgmp$(LIBTGTEXT)* $(TARGET_DIR)/lib/
 ifeq ($(BR2_PACKAGE_LIBGMP_HEADERS),y)
 	test -d $(TARGET_DIR)/usr/include || mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(STAGING_DIR)/include/gmp.h $(TARGET_DIR)/usr/include/

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-06-06 19:45:46 UTC (rev 18760)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-06-06 19:50:05 UTC (rev 18761)
@@ -103,7 +103,7 @@
 	$(STRIP) --strip-unneeded $(STAGING_DIR)/lib/libmpfr$(LIBTGTEXT)*
 
 $(TARGET_DIR)/lib/libmpfr.so $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION) $(TARGET_DIR)/lib/libmpfr.a: $(STAGING_DIR)/lib/$(MPFR_BINARY)
-	cp -dpf $(STAGING_DIR)/lib/libmpfr$(LIBTGTEXT) $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/libmpfr$(LIBTGTEXT)* $(TARGET_DIR)/lib/
 ifeq ($(BR2_PACKAGE_LIBMPFR_HEADERS),y)
 	cp -dpf $(STAGING_DIR)/include/mpfr.h $(STAGING_DIR)/include/mpf2mpfr.h \
 		$(TARGET_DIR)/usr/include/
