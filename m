From: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Date: Wed,  1 Jun 2016 15:56:55 +0900
Subject: [Buildroot] [PATCH 1/1] mesa3d: Add drm to EGL platforms for VC4
Message-ID: <20160601065655.9576-1-akihiko.odaki.4i@stu.hosei.ac.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

VC4 is a DRM driver.

Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
---
 package/mesa3d/mesa3d.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4e0d255..cc9e2f8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -137,6 +137,8 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MESA3D_PROVIDES += libegl
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
 MESA3D_EGL_PLATFORMS = drm
+else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4),y)
+MESA3D_EGL_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
 MESA3D_EGL_PLATFORMS = drm
 endif
-- 
2.8.3
