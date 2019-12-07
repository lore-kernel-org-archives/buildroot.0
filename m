From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat,  7 Dec 2019 14:32:24 +0300
Subject: [Buildroot] [PATCH 1/1] configs/linksprite_pcduino: add
 host-openssl for kernel build
Message-ID: <20191207113224.2635748-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated kernel version for pcDuino board requires host-openssl
to build successfully. This commit adds the required option:
    BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/371286142

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/linksprite_pcduino_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/linksprite_pcduino_defconfig b/configs/linksprite_pcduino_defconfig
index a8577b6e79..5a00e57281 100644
--- a/configs/linksprite_pcduino_defconfig
+++ b/configs/linksprite_pcduino_defconfig
@@ -28,6 +28,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-pcduino"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/linksprite/pcduino/linux-extras.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.24.0
