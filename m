From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 22 Aug 2017 19:03:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXpm: needs
	host-gettext
Message-ID: <20170822170304.7160-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.buildroot.net/buildroot/commit/package/x11r7?id=e398ec92e9ad04e5bbae32f03cd18a53b5761517
removed the host-gettext dependency. Since then building the
package fails on hosts without the xgettext binary:

/bin/sh: xgettext: command not found

Fixes
http://autobuild.buildroot.net/results/75c/75c50e617349d327713cba9bc97163bb2c9a6943/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index e781a8b518..ec50a42228 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -14,6 +14,6 @@ XLIB_LIBXPM_INSTALL_STAGING = YES
 XLIB_LIBXPM_AUTORECONF = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
-	$(TARGET_NLS_DEPENDENCIES)
+	host-gettext $(TARGET_NLS_DEPENDENCIES)
 
 $(eval $(autotools-package))
-- 
2.11.0
