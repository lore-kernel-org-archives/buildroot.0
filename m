From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 29 Dec 2016 10:43:35 -0200
Subject: [Buildroot] [PATCH 3/3] configs/imx6ulpico: Select
	BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
In-Reply-To: <1483015415-8998-1-git-send-email-festevam@gmail.com>
References: <1483015415-8998-1-git-send-email-festevam@gmail.com>
Message-ID: <1483015415-8998-3-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV allows the Broadcom wireless driver
to be automatically loaded on boot.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
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
-- 
2.7.4
