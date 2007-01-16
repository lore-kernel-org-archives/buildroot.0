From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 16 Jan 2007 11:48:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: gmp mpfr
Message-ID: <20070116194847.088BD48566@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-16 11:48:46 -0800 (Tue, 16 Jan 2007)
New Revision: 17328

Log:
- use the correct path to configure


Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-01-16 16:06:45 UTC (rev 17327)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-01-16 19:48:46 UTC (rev 17328)
@@ -35,7 +35,7 @@
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		ac_cv_c_bigendian=$(GMP_BE) \
-		./configure \
+		$(GMP_DIR)/configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-01-16 16:06:45 UTC (rev 17327)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-01-16 19:48:46 UTC (rev 17328)
@@ -9,6 +9,7 @@
 MPFR_CAT:=$(BZCAT)
 MPFR_SITE:=http://www.mpfr.org/mpfr-current/
 MPFR_DIR:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
+MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_BINARY:=libmpfr.a
 MPFR_LIBVERSION:=1.0.1
 
@@ -34,13 +35,12 @@
 endif
 	touch $(MPFR_DIR)/.unpacked
 
-MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
 $(MPFR_TARGET_DIR)/.configured: $(MPFR_DIR)/.unpacked $(STAGING_DIR)/lib/$(GMP_BINARY)
 	(cd $(MPFR_TARGET_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		ac_cv_c_bigendian=$(MPFR_BE) \
-		./configure \
+		$(MPFR_DIR)/configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
