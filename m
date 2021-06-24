From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jun 2021 09:22:22 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] configs/stm32f469_disco:
 add host {dosfs, m}tools
Message-ID: <20210624065201.4988D8DC69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95a85898ef1db77cfba8ad744f4e4f318b938087
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Commit 04a0094f0ef077 (configs/stm32f469_disco: fix kernel bootup) changed
the defconfig to build a vfat image, but forgot to add dosfstools/mtools
host utilities needed for this.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6dd9e246a7b497819fd34595835d61c635d993f6)
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
