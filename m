From: Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Sun,  2 Feb 2020 14:30:33 +0300
Subject: [Buildroot] [PATCH v1 3/3] package/freescale-imx/imx-gpu-g2d: bump
 to version 6.4.0.p1.0
Message-ID: <20200202113033.17306-1-tuzakli.refik@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
---
 package/freescale-imx/imx-gpu-g2d/Config.in        | 6 +++++-
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 3 ++-
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 6 +++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/Config.in b/package/freescale-imx/imx-gpu-g2d/Config.in
index 47375788d1..aeca087f86 100644
--- a/package/freescale-imx/imx-gpu-g2d/Config.in
+++ b/package/freescale-imx/imx-gpu-g2d/Config.in
@@ -2,10 +2,14 @@ comment "imx-gpu-g2d needs a glibc toolchain with armhf enabled"
 	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
 
+comment "imx-gpu-g2d needs a glibc toolchain"
+	depends on BR2_aarch64
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 config BR2_PACKAGE_IMX_GPU_G2D
 	bool "imx-gpu-g2d"
 	# Pre-built binaries only available for ARM EABIhf
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_arm && BR2_ARM_EABIHF) || BR2_aarch64
 	# Library binaries are linked against libc.so.6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_IMX_GPU_VIV
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 3bcbc558e2..2388cafbc6 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1 +1,2 @@
-sha256	5f2d2171d5cd57f37ab07184fc908a0f6ecb2a97f023f04c2f9f3b3d7fec8481  imx-gpu-g2d-6.2.4.p1.2.bin
+sha256	6d6d02d035d988cbdb2014794f2efe970a3f5ac277202882bbf553bb7fd789d2  imx-gpu-g2d-6.4.0.p1.0-aarch32.bin
+sha256	35885f435dbe951d2c0f439a376ed8a59a50b67a1b7e1e14fa2ab03995abb1ad  imx-gpu-g2d-6.4.0.p1.0-aarch64.bin
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 015ab628b6..6598e4c32b 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -4,7 +4,11 @@
 #
 ################################################################################
 
-IMX_GPU_G2D_VERSION = 6.2.4.p1.2
+ifeq ($(BR2_aarch64),y)
+IMX_GPU_G2D_VERSION = 6.4.0.p1.0-aarch64
+else
+IMX_GPU_G2D_VERSION = 6.4.0.p1.0-aarch32
+endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
 IMX_GPU_G2D_DEPENDENCIES = imx-gpu-viv
-- 
2.17.1
