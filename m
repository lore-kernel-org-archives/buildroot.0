From: Howard Mitchell <hm@hmbedded.co.uk>
Date: Fri,  6 Mar 2020 09:25:03 +0000
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: select vc4 and kmsro driver
 for gallium v3d
Message-ID: <20200306092504.30340-1-hm@hmbedded.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when building for rpi2/3 it is only necessary to to select
vc4 to get acceleration working. However, when building for rpi4 v3d,
vc4 and kmsro have to be selected. Therefore this commit forces the
selection of vc4 and kmsro when v3d is selected.

Signed-off-by: Howard Mitchell <hm@hmbedded.co.uk>
---
 package/mesa3d/Config.in | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 13e516e452..3950170533 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -257,12 +257,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 	bool "Gallium v3d driver"
 	depends on BR2_arm || BR2_aarch64
-	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
-	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
-	select BR2_PACKAGE_LIBDRM_VC4
-	select BR2_PACKAGE_MESA3D_OPENGL_EGL
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
 	help
-	  Driver for Broadcom VC6 (rpi4) GPUs (needs kmsro and vc4).
+	  Driver for Broadcom VC6 (rpi4) GPUs.
 
 	  It requires a kernel 4.18+ with DRM V3D support enabled:
 
-- 
2.17.1
