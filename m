From: Hebbar <gururajakr@sanyo.co.in>
Date: Tue, 18 Mar 2008 17:55:17 -0700 (PDT)
Subject: [Buildroot]  [PATCH] Allow Cairo to see directfb include files
Message-ID: <16134981.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

If directfb is enabled, cairo is made to build upon directfb. But cairo is
unable to find directfb include files. At present it happens on my system.
Below patch corrects the same.

Regards
Gururaja


Signed-off-by: Gururaja Hebbar <gururajakr@sanyo.co.in>

diff -purN buildroot/package/cairo/cairo.mk
buildroot_kboard/package/cairo/cairo.mk
--- buildroot/package/cairo/cairo.mk	2008-03-18 03:15:26.000000000 -0400
+++ buildroot_kboard/package/cairo/cairo.mk	2008-03-17 12:43:21.000000000
-0400
@@ -39,11 +39,13 @@ CAIRO_CONF_ENV = ac_cv_func_posix_getpwu
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no
\
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal 
+		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb
 endif
+	
+CAIRO_MAKE_OPT = CFLAGS+=-I$(STAGING_DIR)/usr/include/directfb
 
 CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 zlib png
fontconfig $(XSERVER) 
 
-- 
View this message in context: http://www.nabble.com/-PATCH--Allow-Cairo-to-see-directfb-include-files-tp16134981p16134981.html
Sent from the BuildRoot mailing list archive at Nabble.com.
