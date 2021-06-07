From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:36 -0000
Subject: [Buildroot] [git commit] configs: add espressobin ultra dts and
 bump kernel to 5.11.21
Message-ID: <20210607144653.10A2B8B398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04cd621a4532601328157aacf2c78c171f25eb52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for the Globalscale EspressoBin Ultra, which is
an evolution of the EspressoBin family.  Same SoC and switchcore, more
Ethernet ports, including one PoE PD port.

Tested-by: Atallah Amine <amine_atallah@outlook.com>
Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/globalscale_espressobin_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/globalscale_espressobin_defconfig b/configs/globalscale_espressobin_defconfig
index 50cfc6b530..37d9c1859c 100644
--- a/configs/globalscale_espressobin_defconfig
+++ b/configs/globalscale_espressobin_defconfig
@@ -2,17 +2,17 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 5.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+# Linux headers same as kernel, a 5.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.11.21"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/globalscale/espressobin/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-3720-espressobin marvell/armada-3720-espressobin-emmc marvell/armada-3720-espressobin-v7 marvell/armada-3720-espressobin-v7-emmc"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-3720-espressobin marvell/armada-3720-espressobin-emmc marvell/armada-3720-espressobin-v7 marvell/armada-3720-espressobin-v7-emmc marvell/armada-3720-espressobin-ultra"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
