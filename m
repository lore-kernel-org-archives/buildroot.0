From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Fri, 6 Apr 2018 13:57:45 -0700
Subject: [Buildroot] [PATCH v2 1/2] configs/at91sam9g20dfc: add ubifs target
 filesystem
Message-ID: <1523048266-28521-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a required component to complete the configuration. It also makes sense
to add ubifs so that this board can be flashed with the board/atmel/flasher.sh
script.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>

---

v2:
- Add extended UBI options to defconfig similar to other defconfigs
---
 configs/at91sam9g20dfc_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 0824868..7511c96 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -15,6 +15,13 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g20ek"
 
 # Filesystem
 BR2_TARGET_ROOTFS_TAR=y
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x20000
+BR2_TARGET_ROOTFS_UBI_SUBSIZE=512
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f800
+BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x800
+BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2047
 
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
-- 
2.7.4
