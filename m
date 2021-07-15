From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 21:59:42 +0200
Subject: [Buildroot] [git commit] configs/stm32mp157c_dk2: remove uboot
 config fragment
Message-ID: <20210715192625.60A17908AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=fe2e655666f3b3bc5ebc38036585fe9e0bbb7e30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Running stm32mp1 watchdog is properly recognized and handled by kernel
watchdog framework since Linux v5.6. For details see the Linux commit
85fdc63fe256 ("drivers: watchdog: stm32_iwdg: set WDOG_HW_RUNNING at
probe"). So U-Boot config fragment can be safely removed without
adding userspace watchdog daemon.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config | 1 -
 configs/stm32mp157c_dk2_defconfig                              | 1 -
 2 files changed, 2 deletions(-)

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
