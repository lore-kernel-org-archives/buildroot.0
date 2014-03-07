From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Mar 2014 09:31:03 -0300
Subject: [Buildroot] [PATCH 1/3] configs/fsl_p1010rdb: fix and bump relevant
	versions
Message-ID: <1394195465-27656-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tweak the config to deal with b155f5a5ab321b06df1c5d5f5e104438e8288cf8
fallout.
And bump to the latest kernel versions.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/freescale_p1010rdb_pa_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/freescale_p1010rdb_pa_defconfig b/configs/freescale_p1010rdb_pa_defconfig
index 4921cca..d3e0538 100644
--- a/configs/freescale_p1010rdb_pa_defconfig
+++ b/configs/freescale_p1010rdb_pa_defconfig
@@ -11,12 +11,13 @@ BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x20000
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.13"
+BR2_DEFAULT_KERNEL_VERSION="3.13.6"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/p1010rdb/linux-3.13.config"
 BR2_LINUX_KERNEL_UIMAGE=y
-- 
1.8.3.2
