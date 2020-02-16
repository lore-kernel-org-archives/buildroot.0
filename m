From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Date: Sun, 16 Feb 2020 22:19:36 +0100
Subject: [Buildroot] [PATCH 3/4] configs/beelink_gs1: bump to kernel 5.5
In-Reply-To: <20200216211937.27200-1-peron.clem@gmail.com>
References: <20200216211937.27200-1-peron.clem@gmail.com>
Message-ID: <20200216211937.27200-3-peron.clem@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping to kernel 5.5 add many new features compare to
the actual 5.3 used on Beelink GS1.
Which are crypto, USB3, GPU, IR, S/PDIF and RTC.

Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
---
 configs/beelink_gs1_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
index c48c02c4508c..04c8b544eafb 100644
--- a/configs/beelink_gs1_defconfig
+++ b/configs/beelink_gs1_defconfig
@@ -9,11 +9,11 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/beelink/gs1/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beelink/gs1/genimage.cfg"
 
-# Kernel Linux headers same as kernel, a 5.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
+# Kernel Linux headers same as kernel, a 5.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_5=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.5.4"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h6-beelink-gs1"
-- 
2.20.1
