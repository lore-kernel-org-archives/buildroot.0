From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 15 Aug 2014 08:14:54 -0300
Subject: [Buildroot] [PATCH 2/2] qmx6/wandboard_defconfig: switch to custom
	kernel headers version
In-Reply-To: <1408101294-22414-1-git-send-email-gustavo@zacarias.com.ar>
References: <1408101294-22414-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1408101294-22414-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 3.0.x was EOL and deprecated this would cause it to use newer
headers than the kernel and cause issues.
So switch to custom kernel headers version string to fix this.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qmx6_defconfig      | 4 +++-
 configs/wandboard_defconfig | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/configs/qmx6_defconfig b/configs/qmx6_defconfig
index fd88e9c..143e058 100644
--- a/configs/qmx6_defconfig
+++ b/configs/qmx6_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_KERNEL_HEADERS_3_0=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.0.101"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/congatec/qmx6/post-build.sh"
 BR2_LINUX_KERNEL=y
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 996a70a..0a6ba50 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_KERNEL_HEADERS_3_0=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.0.101"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-- 
1.8.5.5
