From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Wed, 29 Apr 2020 11:12:24 +0200
Subject: [Buildroot] [PATCH v2 4/5] board/freescale/common/imx: add support
 for i.MX8M Nano
In-Reply-To: <1588151545-9346-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1588151545-9346-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <1588151545-9346-5-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Reviewed-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 board/freescale/common/imx/post-image.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 138ea7b..06ccaac 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -38,6 +38,8 @@ genimage_type()
 		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_imx8"
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y$" ${BR2_CONFIG}; then
+		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" ${BR2_CONFIG}; then
-- 
2.7.4
