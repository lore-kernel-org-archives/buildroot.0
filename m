From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 22 Dec 2006 02:20:57 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20061222102057.6F1C54856E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-22 02:20:56 -0800 (Fri, 22 Dec 2006)
New Revision: 17040

Log:
- Add target for .so without the LIBVERSION.


Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2006-12-22 00:45:27 UTC (rev 17039)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2006-12-22 10:20:56 UTC (rev 17040)
@@ -80,7 +80,7 @@
 	    mandir=$(STAGING_DIR)/man \
 	    -C $(MPFR_DIR) install;
 
-$(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION): $(STAGING_DIR)/lib/$(MPFR_BINARY)
+$(TARGET_DIR)/lib/libmpfr.so $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION): $(STAGING_DIR)/lib/$(MPFR_BINARY)
 	cp -a $(STAGING_DIR)/lib/libmpfr.so* $(STAGING_DIR)/lib/libmpfr.a \
 		$(TARGET_DIR)/lib/
 ifeq ($(BR2_PACKAGE_LIBMPFR_HEADERS),y)
