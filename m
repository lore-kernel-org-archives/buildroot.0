From: Davide Viti <zinosat@tiscali.it>
Date: Mon,  5 Oct 2015 09:17:37 +0200
Subject: [Buildroot] [PATCH 1/1] microzed: u-boot needs host-dtc
Message-ID: <1444029457-28890-1-git-send-email-d.viti@infosolution.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

defconfigs that use U-Boot 2015.07 need host-dtc to build
properly.

Signed-off-by: Davide Viti <d.viti@infosolution.it>
---
 configs/microzed_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/microzed_defconfig b/configs/microzed_defconfig
index 5a94275..989170c 100644
--- a/configs/microzed_defconfig
+++ b/configs/microzed_defconfig
@@ -21,6 +21,7 @@ BR2_TARGET_UBOOT_BOARDNAME="zynq_microzed"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
 BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/board/avnet/microzed/uboot"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
-- 
2.1.4
