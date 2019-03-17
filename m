From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Mar 2019 16:29:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/fltk: add optional xlib_libXrender
 dependency
Message-ID: <20190317152929.27559-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xlib_libXrender is enabled by default and has been added since version
1.3.4-1 and
https://github.com/fltk/fltk/commit/a6c4b29a184ce7708819f4706877eedcd99a30f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fltk/fltk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 611d79da50..c37a13176c 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -54,4 +54,11 @@ else
 FLTK_CONF_OPTS += --disable-xinerama
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
+FLTK_DEPENDENCIES += xlib_libXrender
+FLTK_CONF_OPTS += --enable-xrender
+else
+FLTK_CONF_OPTS += --disable-xrender
+endif
+
 $(eval $(autotools-package))
-- 
2.14.1
