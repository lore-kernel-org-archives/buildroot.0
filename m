From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  3 Oct 2018 10:34:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Fix header version
 dependency for Vulkan Intel driver
Message-ID: <20181003083426.25992-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

memfd.h was included in kernel 3.17, not 3.18.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8b171b0d7f..872859b693 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -217,7 +217,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libxshmfence
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # memfd.h
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
 	depends on BR2_PACKAGE_XORG7 # xorgproto
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
@@ -226,10 +226,10 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
-comment "intel vulkan depends on X.org and needs a glibc toolchain w/ headers >= 3.18"
+comment "intel vulkan depends on X.org and needs a glibc toolchain w/ headers >= 3.17"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 || \
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
 		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_PACKAGE_XORG7
 
 comment "Off-screen Rendering"
-- 
2.19.0
