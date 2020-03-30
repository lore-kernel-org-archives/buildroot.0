From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 30 Mar 2020 20:11:14 -0300
Subject: [Buildroot] [PATCH] package/mesa3d: Select more options for
 freedreno
Message-ID: <20200330231114.22168-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently it is not possible to select KMSCUBE on a target that uses
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO due to the missing
dependency.

Fix this problem by selecting BR2_PACKAGE_LIBDRM_FREEDRENO and
BR2_PACKAGE_MESA3D_OPENGL_EGL, just like Etnaviv does.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/mesa3d/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 16d77f42c2..3225aa7598 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -113,7 +113,9 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	bool "Gallium freedreno driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_FREEDRENO
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
+	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  Mesa driver for Freedreno GPUs.
 
-- 
2.17.1
