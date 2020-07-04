From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat,  4 Jul 2020 23:09:09 +0900
Subject: [Buildroot] [PATCH] arm_foundationv8_defconfig: use
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
Message-ID: <20200704140909.1584989-1-masahiroy@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 53ced1f6d3da ("linux: allow the selection of the architecture's
default configuration") allows us to specify the Linux defconfig cleanly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 configs/arm_foundationv8_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index d31f69d3ac..ea19f35502 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -5,8 +5,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.3"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(LINUX_DIR)/arch/arm64/configs/defconfig"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/foundation-v8"
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.25.1
