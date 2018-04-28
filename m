From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 28 Apr 2018 19:28:00 +0200
Subject: [Buildroot] [PATCH 1/4] package/mesa3d: radeonSI: specify drm
 platform
Message-ID: <20180428172803.11179-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PACKAGE_MESA3D_OPENGL_EGL is selected with RadeonSI drvier,
mesa platform must be specified with drm.

Fixes:
hecking for RADEON... yes
checking for AMDGPU... yes
configure: error: radeonsi requires one of these:
                  1) --with-platforms=drm (X, Wayland, offscreen rendering based on DRM)
                  2) --with-platforms=surfaceless (offscreen only)
                  3) --with-platforms=android (Android only)
                  Recommended options: drm,x11

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/mesa3d/mesa3d.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9857b597cf..7534bc0833 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -167,6 +167,8 @@ else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
 MESA3D_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
 MESA3D_PLATFORMS = drm
+else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI),y)
+MESA3D_PLATFORMS = drm
 endif
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland wayland-protocols
-- 
2.14.3
