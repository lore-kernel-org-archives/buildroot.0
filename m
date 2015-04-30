From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 30 Apr 2015 17:12:16 +0200
Subject: [Buildroot] [PATCH v7 01/13] mesa3d: Give possibility to external
	backends to enable DRI/Gallium
In-Reply-To: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
Message-ID: <1430406748-8493-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thus, it is possible to force compilation of Gallium/DRI support in
mesa3d even if no Gallium/DRI drivers are selected. This is intended to
be used by external OpenGL provider (especialy further imx6 support).

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/mesa3d/mesa3d.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.9.1
