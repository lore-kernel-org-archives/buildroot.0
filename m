From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:40:20 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/xlib_libXpm: fix
 build with NLS
Message-ID: <20190426130223.28B58838A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41bbdb72e59f40e50e239ee27b5b65b45b858a3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/cc47a39d134fbc80426bab6fa3662150374bae35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1067b7d9732b4389f0023f30572209691c26251b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
