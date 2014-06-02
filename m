From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Jun 2014 23:27:49 +0200
Subject: [Buildroot] [PATCHv2] configs/calao_qil_a9260: fix kernel build
Message-ID: <1401744469-32558-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The calao_qil_a9260 was not specifying an explicit kernel version, so
it ended up downloading the latest kernel version, and therefore fail
to apply the patches. This commit changes the defconfig to used a
fixed kernel version, so that the patches apply properly. It fixes a
Jenkins build failure that has been occuring since quite some time.

While we're at it, also lock down the version of the kernel headers,
as noticed by Peter Korsgaard.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/calao_qil_a9260_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configs/calao_qil_a9260_defconfig b/configs/calao_qil_a9260_defconfig
index f05e95c..05af114 100644
--- a/configs/calao_qil_a9260_defconfig
+++ b/configs/calao_qil_a9260_defconfig
@@ -1,6 +1,9 @@
 BR2_arm=y
 BR2_arm926t=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.4"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4=y
 BR2_PACKAGE_HOST_SAM_BA=y
 BR2_TARGET_ROOTFS_UBIFS=y
 BR2_TARGET_AT91BOOTSTRAP=y
@@ -11,6 +14,8 @@ BR2_TARGET_BAREBOX=y
 BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR="board/calao/qil-a9260/"
 BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="qil_a9260"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
 BR2_LINUX_KERNEL_PATCH="board/calao/qil-a9260/linux-3.4.7.patch"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/qil-a9260/linux-3.4.7.config"
-- 
1.9.3
