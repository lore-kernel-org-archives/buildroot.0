From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:20:23 +0000 (UTC)
Subject: [Buildroot] svn commit: [25725] trunk/buildroot/package/atk
Message-ID: <20090318212023.7016C7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:20:22 +0000 (Wed, 18 Mar 2009)
New Revision: 25725

Log:
atk: small cleanup

Modified:
   trunk/buildroot/package/atk/atk.mk


Changeset:
Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2009-03-18 20:00:46 UTC (rev 25724)
+++ trunk/buildroot/package/atk/atk.mk	2009-03-18 21:20:22 UTC (rev 25725)
@@ -40,19 +40,19 @@
 		jm_cv_func_working_re_compile_pattern=yes ac_use_included_regex=no \
 		gl_cv_c_restrict=no ac_cv_prog_F77=no
 
+ATK_CONF_OPT =  --enable-shared \
+		--enable-static
+		--disable-glibtest --enable-explicit-deps=no \
+		--disable-debug
+
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)
-ATK_CONF_OPT_X = --with-x \
+ATK_CONF_OPT += --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib --disable-glibtest
 else
-ATK_CONF_OPT_X = --without-x
+ATK_CONF_OPT += --without-x
 endif
 
-ATK_CONF_OPT =  --enable-shared \
-		--enable-static $(ATK_CONF_OPT_X) \
-		--disable-glibtest --enable-explicit-deps=no \
-		--disable-debug
-
 ATK_DEPENDENCIES = libglib2 host-pkgconfig
 
 $(eval $(call AUTOTARGETS,package,atk))
