From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 26 Oct 2019 16:34:45 -0300
Subject: [Buildroot] [PATCH 2/2] configs/engicam_imx6qdl_icore_qt5: Remove
 the swrast option
In-Reply-To: <20191026193445.25227-1-festevam@gmail.com>
References: <20191026193445.25227-1-festevam@gmail.com>
Message-ID: <20191026193445.25227-2-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i.MX6 has GPU in hardware, so we really don't need to
fallback to software rendering.

Remove the unneeded BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
option.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/engicam_imx6qdl_icore_qt5_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
index b591c98f23..4d3d4e3a22 100644
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig
+++ b/configs/engicam_imx6qdl_icore_qt5_defconfig
@@ -62,7 +62,6 @@ BR2_PACKAGE_QT5BASE_JPEG=y
 BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
-BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
 BR2_PACKAGE_MESA3D_OPENGL_ES=y
 
 # qt5 demo packages
-- 
2.17.1
