From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2019 08:53:04 +0100
Subject: [Buildroot] [git commit] configs/linksprite_pcduino: add
 host-openssl for kernel build
Message-ID: <20191208074523.04AE68871C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6683f175493e864836a46f2aa46d5af75483d93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated kernel version for pcDuino board requires host-openssl
to build successfully. This commit adds the required option:
    BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/371286142

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
