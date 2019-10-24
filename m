From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Thu, 24 Oct 2019 19:29:42 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32mp157_dk_defconfig: switch to
 mainline 5.3.7 linux version
Message-ID: <20191024172943.31907-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to the official Linux repository since
the board has been officially supported.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 configs/stm32mp157_dk_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/stm32mp157_dk_defconfig b/configs/stm32mp157_dk_defconfig
index cb8cfb1693..65876a795b 100644
--- a/configs/stm32mp157_dk_defconfig
+++ b/configs/stm32mp157_dk_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157-dk/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32mp157-dk/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,STMicroelectronics,linux,v4.19-stm32mp-r1.5)/linux-v4.19-stm32mp-r1.5.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157-dk/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.23.0
