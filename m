From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Apr 2019 22:44:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/xlib_libXpm: fix build with NLS
Message-ID: <20190420204434.27015-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/cc47a39d134fbc80426bab6fa3662150374bae35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 7e11c4b5aa..391493a4ba 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -15,9 +15,10 @@ XLIB_LIBXPM_AUTORECONF = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xorgproto \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(TARGET_NLS_DEPENDENCIES)
+XLIB_LIBXPM_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
-XLIB_LIBXPM_CONF_ENV = ac_cv_search_gettext=no
+XLIB_LIBXPM_CONF_ENV += ac_cv_search_gettext=no
 endif
 
 $(eval $(autotools-package))
-- 
2.20.1
