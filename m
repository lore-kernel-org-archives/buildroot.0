From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Dec 2006 10:14:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20061202181438.8C45F485E0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-02 10:14:38 -0800 (Sat, 02 Dec 2006)
New Revision: 16757

Log:
- bump version. No patches (yet). Yay! :)


Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2006-12-02 18:13:31 UTC (rev 16756)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2006-12-02 18:14:38 UTC (rev 16757)
@@ -3,8 +3,8 @@
 # mpfr
 #
 #############################################################
-MPFR_VERSION:=2.2.0
-MPFR_PATCH:=patches
+MPFR_VERSION:=2.2.1
+#MPFR_PATCH:=patches
 MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_CAT:=$(BZCAT)
 MPFR_SITE:=http://www.mpfr.org/mpfr-current/
@@ -37,6 +37,7 @@
 $(MPFR_DIR)/.configured: $(MPFR_DIR)/.unpacked
 	(cd $(MPFR_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
 		ac_cv_c_bigendian=$(MPFR_BE) \
 		./configure \
 		--host=$(REAL_GNU_TARGET_NAME) \
