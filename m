From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 23:30:31 +0200
Subject: [Buildroot] [git commit] configs/freescale_{p1025twr,
 t1040d4rdb}: headers version
Message-ID: <20180412213033.7DF22885AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f68f4de8a9746d5861f63fcbde5d7b07604aa284
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The freescale p1025twr and t1040d4rdb defconfigs use a 4.15 series kernel;
specify BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15 accordingly.

This fixes the following build error:

  Incorrect selection of kernel headers: expected 4.16.x, got 4.15.x

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/freescale_p1025twr_defconfig   | 3 +++
 configs/freescale_t1040d4rdb_defconfig | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/configs/freescale_p1025twr_defconfig b/configs/freescale_p1025twr_defconfig
index 13ec517fbd..f476d92706 100644
--- a/configs/freescale_p1025twr_defconfig
+++ b/configs/freescale_p1025twr_defconfig
@@ -2,6 +2,9 @@
 BR2_powerpc=y
 BR2_powerpc_8548=y
 
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+
 # Serial port config
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
diff --git a/configs/freescale_t1040d4rdb_defconfig b/configs/freescale_t1040d4rdb_defconfig
index 6b09e69646..b8d162736c 100644
--- a/configs/freescale_t1040d4rdb_defconfig
+++ b/configs/freescale_t1040d4rdb_defconfig
@@ -2,6 +2,9 @@
 BR2_powerpc64=y
 BR2_powerpc_e5500=y
 
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+
 # Serial port config
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
