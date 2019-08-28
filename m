From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 22:46:35 +0200
Subject: [Buildroot] [PATCH] configs/roseapplepi_defconfig: use gcc 7.x
Message-ID: <20190828204635.20304-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old 3.10.x based vendor kernel does not build correctly with gcc 8.x.

While there is basic s500 support in the mainline kernel, there is not yet a
mmc driver so it isn't quite a replacement yet.

Stick to the vender kernel for now and revert back to gcc 7.x, hopefully
mainline support will be more complete once gcc 7.x gets dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/roseapplepi_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/roseapplepi_defconfig b/configs/roseapplepi_defconfig
index 327176254a..966d444a45 100644
--- a/configs/roseapplepi_defconfig
+++ b/configs/roseapplepi_defconfig
@@ -6,6 +6,8 @@ BR2_ARM_ENABLE_VFP=y
 BR2_GLOBAL_PATCH_DIR="board/roseapplepi/patches"
 # Linux headers same as kernel, a 3.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+# kernel does not build with gcc 8.x
+BR2_GCC_VERSION_7_X=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/roseapplepi/post-image.sh"
 
 BR2_LINUX_KERNEL=y
-- 
2.11.0
