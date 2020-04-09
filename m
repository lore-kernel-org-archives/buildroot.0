From: Fabio Estevam <festevam@gmail.com>
Date: Thu,  9 Apr 2020 09:35:14 -0300
Subject: [Buildroot] [PATCH v2 1/5] package/mesa3d: Do not select
 MESA3D_OPENGL_EGL for etnaviv
Message-ID: <20200409123518.19576-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Thomas, BR2_PACKAGE_MESA3D_OPENGL_EGL should not
be automatically selected by the etnaviv driver.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None

 package/mesa3d/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 16d77f42c2..6f78da174c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -106,7 +106,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_ETNAVIV
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
-	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  Mesa driver for Vivante GPUs.
 
-- 
2.17.1
