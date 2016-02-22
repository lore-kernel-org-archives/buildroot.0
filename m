From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Feb 2016 09:31:42 +0100
Subject: [Buildroot] [git commit branch/next] board/firefly_rk3288: Update
	ARM variant and fix kernel repo
Message-ID: <20160222083229.3B02681789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1e14c85378957b4a82958879169b82226065c68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit updates the two firefly_rk3288 defconfigs recently
added. First we switch to the ARM cortex-A17 core. Second,
we switch the kernel github access from SSH to HTTPS, which
is suitable for anonymous access.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/firefly_rk3288_defconfig      | 4 ++--
 configs/firefly_rk3288_demo_defconfig | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/firefly_rk3288_defconfig b/configs/firefly_rk3288_defconfig
index bd3faa6..0affd67 100644
--- a/configs/firefly_rk3288_defconfig
+++ b/configs/firefly_rk3288_defconfig
@@ -1,5 +1,5 @@
 BR2_arm=y
-BR2_cortex_a12=y
+BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TARGET_GENERIC_HOSTNAME="firefly-rk3288"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/firefly-rk3288/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/firefly/firefly-rk3288/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git at github.com:mmind/linux-rockchip.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mmind/linux-rockchip.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ccb89e9b5657b4911c16d08e1581121222ee12c4"
 BR2_LINUX_KERNEL_DEFCONFIG="rk3288_veyron"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
diff --git a/configs/firefly_rk3288_demo_defconfig b/configs/firefly_rk3288_demo_defconfig
index 4a0aca1..59bbe77 100644
--- a/configs/firefly_rk3288_demo_defconfig
+++ b/configs/firefly_rk3288_demo_defconfig
@@ -1,5 +1,5 @@
 BR2_arm=y
-BR2_cortex_a12=y
+BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/firefly-rk3288/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/firefly/firefly-rk3288/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git at github.com:mmind/linux-rockchip.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mmind/linux-rockchip.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ccb89e9b5657b4911c16d08e1581121222ee12c4"
 BR2_LINUX_KERNEL_DEFCONFIG="rk3288_veyron"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
