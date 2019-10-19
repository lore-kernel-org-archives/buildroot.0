From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 19 Oct 2019 18:05:25 -0300
Subject: [Buildroot] [PATCH] configs/imx6-sabresd_qt5: Remove the swrast
 option
Message-ID: <20191019210525.1142-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i.MX6 has GPU in hardware, so we really don't need to
fallback to software rendering.

Remove the unneeded BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
option.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6-sabresd_qt5_defconfig | 1 -
 1 file changed, 1 deletion(-)
ck
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 7a541951ae..8fbc2beb5b 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -49,7 +49,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
-BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
 BR2_PACKAGE_MESA3D_OPENGL_ES=y
 
 # Fonts
-- 
2.17.1
