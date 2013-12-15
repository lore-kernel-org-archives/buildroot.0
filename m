From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 22:11:21 +0100
Subject: [Buildroot] [git commit] apf27: update configuration
Message-ID: <20131215211458.195A09BD0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8163d3d0851efe7a7cc96c782329f491de92fa84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- move kernel 3.8.3 to 3.12.5
- enable pwm_imx in the kernel configuration
- add u-boot

Acked-by: Eric Jarrige <eric.jarrige@armadeus.org>
Acked-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../apf27/{linux-3.8.config => linux-3.12.config}  |    3 ++-
 configs/armadeus_apf27_defconfig                   |   12 ++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/board/armadeus/apf27/linux-3.8.config b/board/armadeus/apf27/linux-3.12.config
similarity index 99%
rename from board/armadeus/apf27/linux-3.8.config
rename to board/armadeus/apf27/linux-3.12.config
index cff947b..d2955cf 100644
--- a/board/armadeus/apf27/linux-3.8.config
+++ b/board/armadeus/apf27/linux-3.12.config
@@ -1,4 +1,3 @@
-CONFIG_EXPERIMENTAL=y
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
@@ -200,6 +199,8 @@ CONFIG_IMX_SDMA=y
 CONFIG_IMX_DMA=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=m
+CONFIG_PWM=y
+CONFIG_PWM_IMX=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT3_FS_POSIX_ACL=y
diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index 09d491c..409476f 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -4,7 +4,7 @@ BR2_arm926t=y
 
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.8.4"
+BR2_DEFAULT_KERNEL_VERSION="3.12.5"
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf27"
@@ -20,9 +20,13 @@ BR2_TARGET_ROOTFS_UBI=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-3.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-3.12.config"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xA0008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx27-apf27"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx27-apf27dev"
+
+# U-boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="apf27"
