From: unixmania at gmail.com <unixmania@gmail.com>
Date: Wed, 13 Nov 2019 09:21:58 -0300
Subject: [Buildroot] [PATCH/next] configs/beaglebone: bump kernel version to
 4.19.79-ti-r30
Message-ID: <20191113122158.11955-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Use the github macro instead of git, to save download time.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 configs/beaglebone_defconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 2de1bd0b32..f8b7cc66ab 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -6,9 +6,8 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglebone/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/beagleboard/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.19.73-ti-r29"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.79-ti-r30)/linux-4.19.79-ti-r30.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
-- 
2.18.1
