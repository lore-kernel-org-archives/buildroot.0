From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Dec 2016 22:15:24 +0100
Subject: [Buildroot] [git commit] configs/imx6ulpico: Select
	BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
Message-ID: <20161230211734.C14C281EC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ecb1296717c162211151d65011df529fa5f15667
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV allows the Broadcom wireless driver
to be automatically loaded on boot.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx6ulpico_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index f7f7f20..96ac038 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -25,6 +25,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-pico-hobbit"
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
 
+# For automatic firmware loading
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+
 # wireless packages
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WPA_SUPPLICANT=y
