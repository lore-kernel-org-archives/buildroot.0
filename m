From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat,  2 Nov 2019 19:38:39 -0300
Subject: [Buildroot] [PATCH 2/2] configs/beaglebone: use the new
 BeagleBoard/BeagleBone kernel repository
In-Reply-To: <20191102223839.16262-1-unixmania@gmail.com>
References: <20191102223839.16262-1-unixmania@gmail.com>
Message-ID: <20191102223839.16262-3-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The original source URL (http://beagleboard.org/source) now redirects to
https://elinux.org/Beagleboard:BeagleBoneBlack_Rebuilding_Software_Image
which points to an official kernel repository at GitHub.

There are updated RT and non-RT kernel source trees. Use the last non-RT
release (4.19.73-ti-r29) and the omap2plus defconfig.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 configs/beaglebone_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index ee97f80322..2de1bd0b32 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -7,8 +7,8 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4dae378bbe721277b08699d1d88ffae12acc9b09"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/beagleboard/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.19.73-ti-r29"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
-- 
2.18.1
