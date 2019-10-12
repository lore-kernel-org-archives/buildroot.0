From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Oct 2019 17:39:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/libva: switch to virtual opengl
 provider
Message-ID: <20191012153931.24484-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to use libva without mesa3d.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 6c8243da90..176f971128 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -20,8 +20,8 @@ LIBVA_CONF_OPTS = \
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
 LIBVA_CONF_OPTS += --enable-x11
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
-LIBVA_DEPENDENCIES += mesa3d
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+LIBVA_DEPENDENCIES += libgl
 LIBVA_CONF_OPTS += --enable-glx
 endif
 else
-- 
2.20.1
