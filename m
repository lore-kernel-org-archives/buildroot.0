From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Mar 2016 15:01:31 -0300
Subject: [Buildroot] [PATCH] mesa3d: add intel gallium driver support
Message-ID: <1457632891-4354-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mesa3d/Config.in | 9 +++++++++
 package/mesa3d/mesa3d.mk | 1 +
 2 files changed, 10 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 9057746..5badefa 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -43,6 +43,15 @@ config BR2_PACKAGE_MESA3D_NEEDS_XA
 
 comment "Gallium drivers"
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
+	bool "Gallium i915 driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_INTEL
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	help
+	  Driver for Intel integrated graphics.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ff2f932..c1f2f45 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -61,6 +61,7 @@ endif
 # Drivers
 
 #Gallium Drivers
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     += i915
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
-- 
2.4.10
