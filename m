From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 12 Jul 2017 21:44:32 +0200
Subject: [Buildroot] [PATCH 2/2] configs/bananapro: bump U-Boot to version
	2017.07
In-Reply-To: <20170712194432.21975-1-joerg.krause@embedded.rocks>
References: <20170712194432.21975-1-joerg.krause@embedded.rocks>
Message-ID: <20170712194432.21975-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note, that since version 2017.07 the sunxi targets needs the Python
libfdt library on the host. Therefore, additionally select the U-Boot
config option BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 configs/bananapro_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index 5b93823af5..53dca1c225 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -42,9 +42,10 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.03"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Bananapro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-- 
2.13.2
