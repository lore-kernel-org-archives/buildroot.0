From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 17:04:33 +0200
Subject: [Buildroot] [git commit] configs/imx6q-sabresd_defconfig: Switch to
	SPL boot
Message-ID: <20170924145821.C2DF3810DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc8213041e8afc5adb18ed4584121e50004873ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot 2017.07 has switched to SPL boot, which allows the same binary to
boot on imx6dl, imx6q and imx6qp sabresd boards.

Switch to the SPL mechanism.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/imx6q-sabresd_defconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/configs/imx6q-sabresd_defconfig b/configs/imx6q-sabresd_defconfig
index 2259d16..18d809c 100644
--- a/configs/imx6q-sabresd_defconfig
+++ b/configs/imx6q-sabresd_defconfig
@@ -22,10 +22,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
+BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -33,4 +35,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
