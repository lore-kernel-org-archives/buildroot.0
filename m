From: Erik Stromdahl <erik.stromdahl@gmail.com>
Date: Fri, 14 Jul 2017 08:48:51 +0200
Subject: [Buildroot] [PATCH 4/4] configs: raspberrypi3_64_defconfig: enable
	uart
In-Reply-To: <1500014931-5599-1-git-send-email-erik.stromdahl@gmail.com>
References: <1500014931-5599-1-git-send-email-erik.stromdahl@gmail.com>
Message-ID: <1500014931-5599-4-git-send-email-erik.stromdahl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is necessary to preserve the same behaviour as
before the --uart-enable option in post-image.sh was
introduced.

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 configs/raspberrypi3_64_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 13a505b..af50930 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -34,4 +34,4 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64 --enable-uart)"
-- 
2.7.4
