From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  6 Sep 2016 17:31:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/freerdp: fix typo in x11 libs check
Message-ID: <20160906153117.2736-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freerdp/freerdp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index e8e5be4..c3a3e55 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -111,7 +111,7 @@ endif
 # Xorg is enabled but neither the server nor the X client are, then
 # there's nothing that guarantees those two libs are enabled. So we
 # really must check for them.
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBX11),yy)
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXEXT),yy)
 FREERDP_DEPENDENCIES += xlib_libX11 xlib_libXext
 FREERDP_CONF_OPTS += -DWITH_X11=ON
 else
-- 
2.9.3
