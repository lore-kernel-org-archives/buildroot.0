From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 13 Oct 2014 13:10:11 +0200
Subject: [Buildroot] [PATCH v2 01/13] mesa3d: Give possibility to external
	backends to enable DRI/Gallium
In-Reply-To: <1413198623-22373-1-git-send-email-jezz@sysmic.org>
References: <1413198623-22373-1-git-send-email-jezz@sysmic.org>
Message-ID: <1413198623-22373-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/mesa3d/mesa3d.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 844884b..1e3e921 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -64,7 +64,7 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
 
-ifeq ($(MESA3D_GALLIUM_DRIVERS-y),)
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
 MESA3D_CONF_OPTS += \
 	--without-gallium-drivers
 else
@@ -73,7 +73,7 @@ MESA3D_CONF_OPTS += \
 	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
 endif
 
-ifeq ($(MESA3D_DRI_DRIVERS-y),)
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
 	--without-dri-drivers --without-dri --disable-dri3
 else
-- 
1.9.1
