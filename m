From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Feb 2013 08:36:01 -0300
Subject: [Buildroot] [PATCH 1/5] configs/sheevaplug_defconfig: lock down
	kernel headers version
Message-ID: <1360323365-5936-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/sheevaplug_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index ead1831..70572d7 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -10,6 +10,11 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
 
+
+# Lock down headers to avoid breaking with new defaults
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.5.4"
+
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="sheevaplug"
-- 
1.7.12.4
