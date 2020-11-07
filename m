From: Xavier Roumegue <xroumegue@gmail.com>
Date: Sat,  7 Nov 2020 14:59:06 +0100
Subject: [Buildroot] [PATCH v2 5/8] board/freescale/common/imx: Add Support
 for uboot 'flash.bin' image
In-Reply-To: <20201103233934.1ab8a7fc@windsurf.home>
References: <20201103233934.1ab8a7fc@windsurf.home>
Message-ID: <20201107135909.1265116-6-xroumegue@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
---
 board/freescale/common/imx/post-image.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 06ccaac3a4..1cca1849be 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -70,6 +70,8 @@ uboot_image()
 		echo "u-boot-dtb.imx"
 	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMX=y$" ${BR2_CONFIG}; then
 		echo "u-boot.imx"
+	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMX_FIT=y$" ${BR2_CONFIG}; then
+		echo "flash.bin"
 	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y$" ${BR2_CONFIG}; then
 	    echo "u-boot-dtb.img"
 	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMG=y$" ${BR2_CONFIG}; then
-- 
2.28.0
