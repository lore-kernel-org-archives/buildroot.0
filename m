From: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Thu, 15 Jul 2021 22:47:45 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32mp157a_dk1: remove uboot
 config fragment
Message-ID: <20210715204746.22089-1-texier.pj2@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Running stm32mp1 watchdog is properly recognized and handled by kernel
watchdog framework since Linux v5.6.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config | 1 -
 configs/stm32mp157a_dk1_defconfig                              | 1 -
 2 files changed, 2 deletions(-)
 delete mode 100644 board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config

diff --git a/board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config b/board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config
deleted file mode 100644
index a278ce9e23..0000000000
--- a/board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config
+++ /dev/null
@@ -1 +0,0 @@
-# CONFIG_STM32MP_WATCHDOG is not set
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index bdb99c8663..86265d77f8 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -27,7 +27,6 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157a-dk1"
-- 
2.17.1
