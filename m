From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  4 Jul 2021 18:45:15 +0300
Subject: [Buildroot] [PATCH v2 2/2] stm32mp157c_dk2: remove uboot config
 fragment
In-Reply-To: <20210704154515.431798-1-geomatsi@gmail.com>
References: <20210704154515.431798-1-geomatsi@gmail.com>
Message-ID: <20210704154515.431798-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Running stm32mp1 watchdog is properly recognized and handled by kernel
watchdog framework since Linux v5.6. For details see the Linux commit
85fdc63fe256 ("drivers: watchdog: stm32_iwdg: set WDOG_HW_RUNNING at
probe"). So U-Boot config fragment can be safely removed without
adding userspace watchdog daemon.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config | 1 -
 configs/stm32mp157c_dk2_defconfig                              | 1 -
 2 files changed, 2 deletions(-)
 delete mode 100644 board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config

diff --git a/board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config b/board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config
deleted file mode 100644
index a278ce9e23..0000000000
--- a/board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config
+++ /dev/null
@@ -1 +0,0 @@
-# CONFIG_STM32MP_WATCHDOG is not set
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 6fea63d427..a4bff897e5 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -27,7 +27,6 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-dk2"
-- 
2.32.0
