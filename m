From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 Mar 2017 18:28:53 +0200
Subject: [Buildroot] [PATCH 5/5] package/mesa3d: enable gallium extra hud
In-Reply-To: <20170326162853.3022-1-romain.naour@gmail.com>
References: <20170326162853.3022-1-romain.naour@gmail.com>
Message-ID: <20170326162853.3022-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1c83ad2..e780dfb 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -88,11 +88,13 @@ MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 
 ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
 MESA3D_CONF_OPTS += \
-	--without-gallium-drivers
+	--without-gallium-drivers \
+	--disable-gallium-extra-hud
 else
 MESA3D_CONF_OPTS += \
 	--enable-shared-glapi \
-	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
+	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y)) \
+	--enable-gallium-extra-hud
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-- 
2.9.3
