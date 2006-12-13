From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 12:09:07 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20061213200907.B4537485A7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 12:09:07 -0800 (Wed, 13 Dec 2006)
New Revision: 16905

Log:
- fix typo.


Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2006-12-13 19:59:07 UTC (rev 16904)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2006-12-13 20:09:07 UTC (rev 16905)
@@ -59,7 +59,7 @@
 		--with-gmp=$(STAGING_DIR) \
 		$(DISABLE_NLS) \
 	);
-	touch $(MPFR_DIR)/.configured
+	touch $@
 
 $(MPFR_DIR)/.libs/$(MPFR_BINARY): $(MPFR_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(MPFR_DIR)
@@ -125,7 +125,7 @@
 		--with-gmp-build=$(GMP_HOST_DIR) \
 		$(DISABLE_NLS) \
 	) && \
-	touch $(MPFR_DIR)/.configured
+	touch $@
 
 $(MPFR_HOST_DIR)/.libs/$(MPFR_BINARY): $(MPFR_HOST_DIR)/.configured
 	$(MAKE) -C $(MPFR_HOST_DIR)
