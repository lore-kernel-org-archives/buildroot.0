From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Feb 2015 21:10:13 +0100
Subject: [Buildroot] [PATCH 3/3] configs: add Raspberry Pi 2 defconfig
In-Reply-To: <cover.1424635766.git.yann.morin.1998@free.fr>
References: <cover.1424635766.git.yann.morin.1998@free.fr>
Message-ID: <ce51aa53f9f02f95284eb78edef084896dbc94bb.1424635766.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hebden <james@hebden.net.au>

Signed-off-by: James Hebden <james@hebden.net.au>
[yann.morin.1998 at free.fr: fix commit log; further bump]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: "Guillermo A. Amaral" <g@maral.me>

---
Changes v3 -> v4:
  - Further bumped, fix commit log  (Yann)

Changes v2 -> v3
  - Reformatted defonfig using make savedefconfig

Changes v1 -> v2
  - Removed custom kernel configuration, used default kernel config for bcm2709
  - Removed changes to rpi-firmware package, separate patch coming
  - Enabled EABIhf
---
 configs/raspberrypi2_defconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/raspberrypi2_defconfig

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
new file mode 100644
index 0000000..d2f97fb
--- /dev/null
+++ b/configs/raspberrypi2_defconfig
@@ -0,0 +1,15 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3c9fd364bfa6c0f6ef725d74b72a9b77dd0d0fb4"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
-- 
1.9.1
