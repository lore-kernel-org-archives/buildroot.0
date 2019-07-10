From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 10 Jul 2019 22:18:46 +0200
Subject: [Buildroot] [git commit] board/freescale: Fix wrong config for
 u-boot.img
Message-ID: <20190710202129.64DD7811FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f97d69b2ac831988a7bb3f132cc0beebbbd12b73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/freescale/common/imx/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index ab51dc2098..19d8fffb63 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -68,7 +68,7 @@ uboot_image()
 		echo "u-boot.imx"
 	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y$" ${BR2_CONFIG}; then
 	    echo "u-boot-dtb.img"
-	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMG=y$" ${BR2_CONFIG}; then
 	    echo "u-boot.img"
 	fi
 }
