From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 22:57:18 +0200
Subject: [Buildroot] [git commit] mesa3d: Give possibility to external
	backends to enable DRI/Gallium
Message-ID: <20150501205734.1FD9D81DC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0964c8dc4d8273c81df4f1d3386322374bc095f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thus, it is possible to force compilation of Gallium/DRI support in
mesa3d even if no Gallium/DRI drivers are selected. This is intended to
be used by external OpenGL provider (especialy further imx6 support).

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index dffbe46..f1c38bf 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -61,7 +61,7 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
 
-ifeq ($(MESA3D_GALLIUM_DRIVERS-y),)
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
 MESA3D_CONF_OPTS += \
 	--without-gallium-drivers
 else
@@ -70,7 +70,7 @@ MESA3D_CONF_OPTS += \
 	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
 endif
 
-ifeq ($(MESA3D_DRI_DRIVERS-y),)
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
 	--without-dri-drivers --without-dri --disable-dri3
 else
