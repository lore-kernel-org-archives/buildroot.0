From: Erik Stromdahl <erik.stromdahl@gmail.com>
Date: Sat, 15 Jul 2017 14:50:32 +0200
Subject: [Buildroot] [PATCH v2 4/4] configs: raspberrypi3_64_defconfig:
	enable uart
In-Reply-To: <1500123032-9198-1-git-send-email-erik.stromdahl@gmail.com>
References: <1500123032-9198-1-git-send-email-erik.stromdahl@gmail.com>
Message-ID: <1500123032-9198-4-git-send-email-erik.stromdahl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is necessary to preserve the same behaviour as
before the --enable-uart option in post-image.sh was
introduced.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
Changes v1 -> v2:
  - Fixed bad print in patch 2
  - Fixed commit comment and removed parenthesis in patch 4
    (comment from Ricardo Martincoski)

 configs/raspberrypi3_64_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 23db9cc..2e56adb 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -34,4 +34,4 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64 --enable-uart"
-- 
2.7.4
