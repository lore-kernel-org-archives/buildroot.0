From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 28 Apr 2021 10:34:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-gpu-viv: select
 libdrm
Message-ID: <20210428083415.29935-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some libraries (libGL.so, vivante_dri.so, libEGL.so, libgbm_viv.so) are
linked against libdrm so select libdrm package.

Fixes: 8283e838f040 ("package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p1.2")
Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 package/freescale-imx/imx-gpu-viv/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index cca2689905..82cae6c780 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_IMX_GPU_VIV
 	depends on (BR2_arm && BR2_ARM_EABIHF) || BR2_aarch64
 	# Library binaries are linked against libc.so.6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	# Library binaries are linked against libdrm.so.2
+	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_LIBOPENCL
@@ -56,8 +58,6 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	bool "Wayland"
-	# libdrm needed by gbm_viv.so
-	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 
-- 
2.26.3
