From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 16 Jan 2007 08:06:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20070116160646.DE2D8485AF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-16 08:06:45 -0800 (Tue, 16 Jan 2007)
New Revision: 17327

Log:
- pass the freetype-config location to make and disable building docs.
  This package is broken since it passes TARGET_CFLAGS down to the HOSTCC in e.g. fc-case


Modified:
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2007-01-16 13:26:32 UTC (rev 17326)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2007-01-16 16:06:45 UTC (rev 17327)
@@ -25,6 +25,7 @@
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) " \
 	CCexe="$(HOSTCC)" \
+	ac_cv_func_mmap_fixed_mapped=yes \
 	./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -42,6 +43,8 @@
 		--includedir=/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
+		--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
+		--disable-docs \
 	);
 	touch $(FONTCONFIG_DIR)/.configured
 
