From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Dec 2018 15:50:14 +0100
Subject: [Buildroot] [PATCH] configs/bananapi_m2_ultra: add kernel headers
 version option
Message-ID: <20181208145015.3095-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bananapi_m2_plus defconfig uses a 4.18 kernel, but doesn't specify
anything for the kernel headers version, so the Buildroot default gets
used, which currently is 4.19. Since 4.19 is newer than 4.18,
Buildroot rightfully whines:

  Incorrect selection of kernel headers: expected 4.19.x, got 4.18.x

Let's fix this by telling this defconfig to use the headers from the
kernel, and that they are of version 4.18.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/131216938

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/bananapi_m2_ultra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
index 5dd3edd664..bc1d31a60a 100644
--- a/configs/bananapi_m2_ultra_defconfig
+++ b/configs/bananapi_m2_ultra_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Ultra"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-ultra/genimage.cfg"
-- 
2.19.2
