From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Date: Fri, 30 Nov 2018 13:01:23 +0100
Subject: [Buildroot] [PATCH 5/5] configs: libgbm defconfigs build qt5
In-Reply-To: <1543579283-20496-1-git-send-email-tolvupostur@gmail.com>
References: <1543579283-20496-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <1543579283-20496-6-git-send-email-tolvupostur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kmscube removed from ti_sgx and sunxi_mali,
since it doesn't work

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
----------------------
Like before - can't test any of these, but they all build QT5
with EGLFS GBM.
The sunxi_mali was a bit of a shot in the dark, but I figured out
that with -D__GBM__we do get a valid EGLFS for QT. I have no idea
if I added that correctly.

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 configs/libgbm_mesa3d_defconfig     | 5 +++++
 configs/libgbm_sunxi_mali_defconfig | 8 +++++++-
 configs/libgbm_ti_sgx_defconfig     | 9 +++++----
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/configs/libgbm_mesa3d_defconfig b/configs/libgbm_mesa3d_defconfig
index 9816680..9a9c391 100644
--- a/configs/libgbm_mesa3d_defconfig
+++ b/configs/libgbm_mesa3d_defconfig
@@ -16,4 +16,9 @@ BR2_PACKAGE_MESA3D=y
 BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
 BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 BR2_PACKAGE_MESA3D_OPENGL_ES=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5BASE_GUI=y
+BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/libgbm_sunxi_mali_defconfig b/configs/libgbm_sunxi_mali_defconfig
index c89a781..d83e792 100644
--- a/configs/libgbm_sunxi_mali_defconfig
+++ b/configs/libgbm_sunxi_mali_defconfig
@@ -3,9 +3,15 @@ BR2_cortex_a8=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
 BR2_INIT_NONE=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
-BR2_PACKAGE_KMSCUBE=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5BASE_GUI=y
+BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
 BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
 BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND=y
+BR2_PACKAGE_LIBDRM=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/libgbm_ti_sgx_defconfig b/configs/libgbm_ti_sgx_defconfig
index 0226e2b..e70b9c7 100644
--- a/configs/libgbm_ti_sgx_defconfig
+++ b/configs/libgbm_ti_sgx_defconfig
@@ -6,9 +6,10 @@ BR2_INIT_NONE=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
-BR2_PACKAGE_KMSCUBE=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5BASE_GUI=y
+BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
 BR2_PACKAGE_TI_SGX_UM=y
-BR2_PACKAGE_EXPAT=y
-BR2_PACKAGE_LIBXML2=y
-BR2_PACKAGE_LIBFFI=y
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.7.4
