From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 Oct 2019 08:05:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/libva: fix mesa3d glx support
Message-ID: <20191001060520.1191-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.buildroot.net/buildroot/commit/package/mesa3d?id=5cb821d5635626b7327d5d704555c412e5ed5a1f

added a new option to enable GLX support.

This patch adjusts libva to use the new logic.

Fixes:
http://autobuild.buildroot.net/results/797/79776104e681402c24160be15789fe67bb69f833/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 7bf1839f4c..6c8243da90 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -20,7 +20,7 @@ LIBVA_CONF_OPTS = \
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
 LIBVA_CONF_OPTS += --enable-x11
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 LIBVA_DEPENDENCIES += mesa3d
 LIBVA_CONF_OPTS += --enable-glx
 endif
-- 
2.20.1
