From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jun 2017 09:06:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: rename MESA3D_EGL_PLATFORMS
	to MESA3D_PLATFORMS
Message-ID: <20170617070615.27686-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No code changes, this patch prepares for updates to platform handling
after upstream deprecated --with-egl-platforms in favour of
--with-platforms
https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=7748c3f5eb1d98ca97d2cf6e516ff54a5d75130a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: renamed variable to MESA3D_PLATFORMS (Thomas)
    original patch: http://patchwork.ozlabs.org/patch/774339/

 package/mesa3d/mesa3d.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 288406352..ac27b0f07 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -144,25 +144,25 @@ endif
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MESA3D_PROVIDES += libegl
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
-MESA3D_EGL_PLATFORMS = drm
+MESA3D_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4),y)
-MESA3D_EGL_PLATFORMS = drm
+MESA3D_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
-MESA3D_EGL_PLATFORMS = drm
+MESA3D_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
-MESA3D_EGL_PLATFORMS = drm
+MESA3D_PLATFORMS = drm
 endif
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland
-MESA3D_EGL_PLATFORMS += wayland
+MESA3D_PLATFORMS += wayland
 endif
 ifeq ($(BR2_PACKAGE_XORG7),y)
-MESA3D_EGL_PLATFORMS += x11
+MESA3D_PLATFORMS += x11
 endif
 MESA3D_CONF_OPTS += \
 	--enable-gbm \
 	--enable-egl \
-	--with-egl-platforms=$(subst $(space),$(comma),$(MESA3D_EGL_PLATFORMS))
+	--with-egl-platforms=$(subst $(space),$(comma),$(MESA3D_PLATFORMS))
 else
 MESA3D_CONF_OPTS += \
 	--disable-egl
-- 
2.11.0
