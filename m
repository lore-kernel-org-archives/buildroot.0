From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Sep 2019 08:38:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: Remove x86/x86_64
 dependency for nouveau Gallium driver
Message-ID: <20190928063856.11664-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nvidia chips are used on arm hardware as well like Jetson:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

Suggested-by: Ross Green <grunpferd@netscape.net>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 99b3818235..92caa05679 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -119,7 +119,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
-	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
-- 
2.20.1
