From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:51:23 +0100
Subject: [Buildroot] [git commit] configs/bananapi_m1_plus_defconfig: select
 custom headers
Message-ID: <20210320212816.D6ABF81730@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76efcc2f548b307a821b8e4ab284a31a97b1c315
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Board used custom Kernel but did not specify
custom headers. This broke the build when
Linux 5.11 was added in d2fe9c6.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1089053980

Signed-off-by: Filip Skoneczny <fskoneczny@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/bananapi_m1_plus_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/bananapi_m1_plus_defconfig b/configs/bananapi_m1_plus_defconfig
index 8f278f932d..271124f79a 100644
--- a/configs/bananapi_m1_plus_defconfig
+++ b/configs/bananapi_m1_plus_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/sinovoip/m1-plus/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_HOSTNAME="bananapi"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Banana Pi!"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
