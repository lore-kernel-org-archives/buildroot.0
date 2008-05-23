From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Fri, 23 May 2008 06:37:10 -0700 (PDT)
Subject: [Buildroot]  [PATCH]: Do not redefine PKG_CONFIG_* in pango.mk
Message-ID: <17425804.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


see patch:

--- buildroot/package/pango/pango.mk 
+++ buildroot.new/package/pango/pango.mk 
@@ -39,7 +39,7 @@
 		am_getline_needs_run_time_check=no am_cv_func_working_getline=yes \
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no
\
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no gl_cv_c_restrict=no
PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
+		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal
ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config 
 		
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)
@@ -59,8 +59,7 @@
 		--mandir=/usr/man --infodir=/usr/info \
 		--enable-shared --enable-static \
 		$(PANGO_CONF_OPT_X) \
-		--enable-explicit-deps=no --disable-debug
PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
-
+		--enable-explicit-deps=no --disable-debug
 
 PANGO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 $(XSERVER)
cairo 
 

-- 
View this message in context: http://www.nabble.com/-PATCH-%3A-Do-not-redefine-PKG_CONFIG_*-in-pango.mk-tp17425804p17425804.html
Sent from the BuildRoot mailing list archive at Nabble.com.
