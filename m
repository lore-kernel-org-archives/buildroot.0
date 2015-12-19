From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Dec 2015 12:01:24 +0100
Subject: [Buildroot] [PATCH 04/12] package/mesa3d: add support for Nouveau
	DRI driver
In-Reply-To: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1450522892-14611-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by new package xdriver_xf86-video-nouveau.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 7 +++++++
 package/mesa3d/mesa3d.mk | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8560794..90523d9 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -114,6 +114,13 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
 	help
 	  Support for i965-based Intel GPUs.
 
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
+	bool "DRI nouveau driver"
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER
+	select BR2_PACKAGE_LIBDRM_NOUVEAU
+	help
+	  Support for Nvidia-based GPUs.
+
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	bool "DRI radeon driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 40e53cc..195ccff 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -70,6 +70,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU) += nouveau
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
 
 ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
-- 
2.6.4
