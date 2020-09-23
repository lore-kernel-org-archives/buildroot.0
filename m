From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 20:51:36 +0200
Subject: [Buildroot] [git commit] board/chromebook: move "mksd.sh" out of
 chromebook snow folder
Message-ID: <20200923190043.0830081963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42866f0c69332728e36d5d78f4959e740698a34c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The same script is going to be used by the Chromebook Elm to generate
a bootable SD / USB image. Therefore, move the script out of the snow
folder to one level above (board/chromebook/snow -> board/chromebook).

Update the chromebook_snow_defconfig to reflect the new location of
the script.

Signed-off-by: Bilal Wasim <bilalwasim676@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/chromebook/{snow => }/mksd.sh | 0
 configs/chromebook_snow_defconfig   | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/chromebook/snow/mksd.sh b/board/chromebook/mksd.sh
similarity index 100%
rename from board/chromebook/snow/mksd.sh
rename to board/chromebook/mksd.sh
diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
index 5558c101d6..bcb94b716b 100644
--- a/configs/chromebook_snow_defconfig
+++ b/configs/chromebook_snow_defconfig
@@ -4,7 +4,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_GENERIC_GETTY_TERM="linux"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/snow/mksd.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/mksd.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
