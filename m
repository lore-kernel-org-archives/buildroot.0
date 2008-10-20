From: laird at uclibc.org <laird@uclibc.org>
Date: Mon, 20 Oct 2008 06:57:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pango
Message-ID: <20081020135731.1619B3C725@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-10-20 06:57:30 -0700 (Mon, 20 Oct 2008)
New Revision: 23745

Log:
package/pango/pango.mk: Remove redundant PKG_CONFIG_* 

Remove the unnecessary PKG_CONFIG_* settings and tidy up some
config options.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/pango/pango.mk


Changeset:
Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2008-10-20 11:53:16 UTC (rev 23744)
+++ trunk/buildroot/package/pango/pango.mk	2008-10-20 13:57:30 UTC (rev 23745)
@@ -39,7 +39,7 @@
 		am_getline_needs_run_time_check=no am_cv_func_working_getline=yes \
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no gl_cv_c_restrict=no PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
+		ac_use_included_regex=no gl_cv_c_restrict=no)" \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 		
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)
@@ -50,19 +50,10 @@
         PANGO_CONF_OPT_X = --without-x
 endif
 
-PANGO_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr --exec-prefix=/usr \
-		--bindir=/usr/bin --sbindir=/usr/sbin \
-		--libdir=/usr/lib --libexecdir=/usr/lib \
-		--sysconfdir=/etc --datadir=/usr/share \
-		--localstatedir=/var --includedir=/usr/include \
-		--mandir=/usr/man --infodir=/usr/info \
-		--enable-shared --enable-static \
+PANGO_CONF_OPT = --enable-shared --enable-static \
 		$(PANGO_CONF_OPT_X) \
-		--enable-explicit-deps=no --disable-debug PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
+		--enable-explicit-deps=no --disable-debug
 
-
 PANGO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 $(XSERVER) cairo
 
-
 $(eval $(call AUTOTARGETS,package,pango))
