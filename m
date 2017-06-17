From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Jun 2017 15:08:00 +0200
Subject: [Buildroot] [git commit] package/mesa3d: rename
	MESA3D_EGL_PLATFORMS to MESA3D_PLATFORMS
Message-ID: <20170617130740.C11EB80746@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2cbef3281b874f2cd9a215a5078e7fc4985da53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No code changes, this patch prepares for updates to platform handling
after upstream deprecated --with-egl-platforms in favour of
--with-platforms
https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=7748c3f5eb1d98ca97d2cf6e516ff54a5d75130a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2884063..ac27b0f 100644
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
