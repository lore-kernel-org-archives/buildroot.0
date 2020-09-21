From: Bilal Wasim <bilalwasim676@gmail.com>
Date: Mon, 21 Sep 2020 23:12:45 +0500
Subject: [Buildroot] [PATCH 2/3] boards: chromebook: Move "mksd.sh" out of
 chromebook snow folder.
In-Reply-To: <20200921181246.88781-1-bilalwasim676@gmail.com>
References: <20200921181246.88781-1-bilalwasim676@gmail.com>
Message-ID: <20200921181246.88781-3-bilalwasim676@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The same script is used by Chromebook Elm to generate a bootable
SD / USB image. Therefore, move the script out of the snow folder
to one level above (boards/chromebook/snow -> boards/chromebook).

Update the Chrome snow defconfig to reflect the new location of the
script.

Signed-off-by: Bilal Wasim <bilalwasim676@gmail.com>
---
 board/chromebook/{snow => }/mksd.sh | 0
 configs/chromebook_snow_defconfig   | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename board/chromebook/{snow => }/mksd.sh (100%)

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
-- 
2.25.1
