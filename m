From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Jun 2021 10:42:43 +0200
Subject: [Buildroot] [PATCH] configs/stm32f469_disco: add host {dosfs,
 m}tools
Message-ID: <20210622084243.27905-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 04a0094f0ef077 (configs/stm32f469_disco: fix kernel bootup) changed
the defconfig to build a vfat image, but forgot to add dosfstools/mtools
host utilities needed for this.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/stm32f469_disco_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
index c537197ff6..e538a664e2 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_defconfig
@@ -19,5 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_OPENOCD=y
-- 
2.20.1
