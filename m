From: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
Date: Thu, 31 Aug 2017 16:29:31 -0400
Subject: [Buildroot] [PATCH] configs/ts4900: bump kernel version to 4.12
Message-ID: <1504211371-457-1-git-send-email-mathieu.audat@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ts4900 defconfig is upstream in Linux since v4.9:
       a2f1145 ARM: dts: TS-4900: add basic device tree

Bump kernel version to v4.12 and use the upstreamed defconfig
imx_v6_v7.

Signed-off-by: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
---
 configs/ts4900_defconfig | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/configs/ts4900_defconfig b/configs/ts4900_defconfig
index 7d5d02b..082234f 100644
--- a/configs/ts4900_defconfig
+++ b/configs/ts4900_defconfig
@@ -1,12 +1,9 @@
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts4900/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/embeddedarm/linux-3.10.17-imx6.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="70d1e85a22879e27cc9e36384438d5a9793e44b0"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.7.4
