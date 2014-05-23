From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 23 May 2014 22:09:50 +0200
Subject: [Buildroot] [PATCH v2] Adding support for Ariag25 and Terra board
	from Acmesystems
Message-ID: <1400875790-20928-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for Acmesystems' AriaG25 SOM and the
corresponding Terra demo board.
The AriaG25 config is fairly basic, it provides only the minimal
configuration to get the module booting.
The Terra config instead provides many userspace tools.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 board/acmesystems/ariag25/at91-ariag25.config      | 211 +++++++++++++++++++++
 board/acmesystems/ariag25/at91-ariag25.dts         | 191 +++++++++++++++++++
 .../fs-overlay/etc/network/interfaces              |   5 +
 configs/ariag25_defconfig                          |  12 ++
 configs/ariag25_demo_terra_defconfig               |  21 ++
 5 files changed, 440 insertions(+)
 create mode 100644 board/acmesystems/ariag25/at91-ariag25.config
 create mode 100644 board/acmesystems/ariag25/at91-ariag25.dts
 create mode 100644 board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces
 create mode 100644 configs/ariag25_defconfig
 create mode 100644 configs/ariag25_demo_terra_defconfig

diff --git a/board/acmesystems/ariag25/at91-ariag25.config b/board/acmesystems/ariag25/at91-ariag25.config
new file mode 100644
index 0000000..07a0eca
--- /dev/null
+++ b/board/acmesystems/ariag25/at91-ariag25.config
@@ -0,0 +1,211 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_KERNEL_LZO=y
+CONFIG_SYSVIPC=y
+CONFIG_LOG_BUF_SHIFT=16
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+CONFIG_RD_XZ=y
+CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_EMBEDDED=y
+CONFIG_SLAB=y
+CONFIG_JUMP_LABEL=y
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_MODULE_SRCVERSION_ALL=y
+CONFIG_BLK_DEV_BSGLIB=y
+CONFIG_DEFAULT_NOOP=y
+CONFIG_ARCH_AT91=y
+CONFIG_SOC_AT91SAM9260=y
+CONFIG_SOC_AT91SAM9261=y
+CONFIG_SOC_AT91SAM9263=y
+CONFIG_SOC_AT91SAM9RL=y
+CONFIG_SOC_AT91SAM9G45=y
+CONFIG_SOC_AT91SAM9X5=y
+CONFIG_SOC_AT91SAM9N12=y
+CONFIG_MACH_AT91SAM9_DT=y
+CONFIG_AT91_TIMER_HZ=128
+CONFIG_AEABI=y
+CONFIG_UACCESS_WITH_MEMCPY=y
+# CONFIG_ATAGS is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_KEXEC=y
+CONFIG_AUTO_ZRELADDR=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_DIAG is not set
+CONFIG_IPV6=y
+# CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET6_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET6_XFRM_MODE_BEET is not set
+CONFIG_IPV6_SIT_6RD=y
+CONFIG_DNS_RESOLVER=y
+CONFIG_CFG80211=y
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/mdev"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_ATMEL=y
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_GLUEBI=y
+CONFIG_PROC_DEVICETREE=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_ATMEL_PWM=y
+CONFIG_ATMEL_TCLIB=y
+CONFIG_ATMEL_SSC=y
+CONFIG_EEPROM_93CX6=m
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_MULTI_LUN=y
+CONFIG_NETDEVICES=y
+CONFIG_MACB=y
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_CIRRUS is not set
+# CONFIG_NET_VENDOR_FARADAY is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+CONFIG_SMSC_PHY=y
+CONFIG_ATH_CARDS=m
+CONFIG_ATH9K_HTC=m
+CONFIG_RT2X00=y
+CONFIG_RT73USB=m
+CONFIG_RT2800USB=m
+# CONFIG_RT2800USB_RT33XX is not set
+# CONFIG_RT2800USB_RT35XX is not set
+CONFIG_RT2800USB_RT53XX=y
+CONFIG_INPUT_POLLDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=480
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=272
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_SERIO is not set
+CONFIG_LEGACY_PTY_COUNT=4
+CONFIG_SERIAL_ATMEL=y
+CONFIG_SERIAL_ATMEL_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_AT91=m
+CONFIG_SPI=y
+CONFIG_SPI_ATMEL=y
+CONFIG_SPI_SPIDEV=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_W1=y
+CONFIG_W1_MASTER_GPIO=y
+CONFIG_W1_SLAVE_THERM=y
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_AT91SAM9X_WATCHDOG=y
+CONFIG_SSB=m
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_USB_SUPPORT=y
+CONFIG_USB_VIDEO_CLASS=y
+CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_HID_PID=y
+CONFIG_USB_HIDDEV=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=m
+CONFIG_USB_WDM=m
+CONFIG_USB_STORAGE=m
+CONFIG_USB_SERIAL=y
+CONFIG_USB_SERIAL_GENERIC=y
+CONFIG_USB_SERIAL_FTDI_SIO=y
+CONFIG_USB_SERIAL_PL2303=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_AT91=m
+CONFIG_USB_ETH=m
+CONFIG_USB_GADGETFS=m
+CONFIG_USB_CDC_COMPOSITE=m
+CONFIG_USB_G_ACM_MS=m
+CONFIG_USB_G_MULTI=m
+CONFIG_USB_G_MULTI_CDC=y
+CONFIG_MMC=y
+CONFIG_MMC_UNSAFE_RESUME=y
+CONFIG_MMC_ATMELMCI=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_ATMEL_PWM=m
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_ONESHOT=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_CPU=y
+CONFIG_LEDS_TRIGGER_GPIO=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_AT91RM9200=y
+CONFIG_RTC_DRV_AT91SAM9=y
+CONFIG_DMADEVICES=y
+CONFIG_AT_HDMAC=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_PWM=y
+CONFIG_PWM_ATMEL_TCB=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_FANOTIFY=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+# CONFIG_MISC_FILESYSTEMS is not set
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_850=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_PRINTK_TIME=y
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_UNUSED_SYMBOLS=y
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_FTRACE is not set
+CONFIG_STRICT_DEVMEM=y
+CONFIG_DEBUG_USER=y
+CONFIG_KEYS=y
+CONFIG_CRYPTO_ECB=y
+CONFIG_CRYPTO_SHA1=y
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_USER_API_HASH=m
+CONFIG_CRYPTO_USER_API_SKCIPHER=m
+# CONFIG_CRYPTO_HW is not set
+CONFIG_CRC_CCITT=y
+CONFIG_CRC_T10DIF=m
+CONFIG_CRC_ITU_T=y
+CONFIG_CRC7=y
diff --git a/board/acmesystems/ariag25/at91-ariag25.dts b/board/acmesystems/ariag25/at91-ariag25.dts
new file mode 100644
index 0000000..8bb5612
--- /dev/null
+++ b/board/acmesystems/ariag25/at91-ariag25.dts
@@ -0,0 +1,191 @@
+/*
+ * at91-ariag25.dts - Device Tree file for Acme Systems Aria G25
+ *
+ * Copyright (C) 2013 Douglas Gilbert <dgilbert@interlog.com>,
+ *                    Robert Nelson <robertcnelson@gmail.com>
+ * Copyright (C) 2014 Sergio Tanzilli <sergio@tanzilli.com>
+ *
+ * Licensed under GPLv2 or later. 
+ */
+/dts-v1/;
+#include "at91sam9g25.dtsi"
+
+/ {
+  model = "Acme Systems Aria G25";
+  compatible = "acme,ariag25", "atmel,at91sam9x5ek",
+         "atmel,at91sam9x5", "atmel,at91sam9";
+
+  aliases {
+    serial0 = &dbgu;
+    serial1 = &usart0;
+    serial2 = &usart1;
+    serial3 = &usart2;
+    serial4 = &usart3;
+    serial5 = &uart0;
+    serial6 = &uart1;
+  };
+
+  chosen {
+    bootargs = "console=ttyS0,115200 root=/dev/mmcblk0p2 rw rootwait";
+  };
+
+  memory {
+    /* 128 MB Aria G25 version */
+    reg = <0x20000000 0x8000000>;
+    /* 256 MB Aria G25 version */
+    /* reg = <0x20000000 0x10000000>; */
+  };
+
+
+  clocks {
+    #address-cells = <1>;
+    #size-cells = <1>;
+    ranges;
+
+    main_clock: clock at 0 {
+      compatible = "atmel,osc", "fixed-clock";
+      clock-frequency = <12000000>;
+    };
+  };
+
+  ahb {
+    apb {
+      mmc0: mmc at f0008000 {
+        pinctrl-0 = <
+          &pinctrl_mmc0_slot0_clk_cmd_dat0
+          &pinctrl_mmc0_slot0_dat1_3>;
+        status = "okay";
+        slot at 0 {
+          reg = <0>;
+          bus-width = <4>;
+        };
+      };
+
+      i2c0: i2c at f8010000 {
+        status = "okay";
+      };
+
+      i2c1: i2c at f8014000 {
+        status = "disabled";
+      };
+
+      /* /dev/ttyS1 */
+      usart0: serial at f801c000 {
+        pinctrl-0 = <&pinctrl_usart0 &pinctrl_usart0_rts &pinctrl_usart0_cts>;
+        status = "okay";
+      };
+
+      /* /dev/ttyS2 */
+      usart1: serial at f8020000 {
+        pinctrl-0 = <&pinctrl_usart1 &pinctrl_usart1_rts &pinctrl_usart1_cts>;
+        
+        
+        status = "okay";
+      };
+
+      /* /dev/ttyS3 */
+      usart2: serial at f8024000 {
+        pinctrl-0 = <&pinctrl_usart2>;
+        status = "okay";
+      };
+
+      /* /dev/ttyS4 */
+      usart3: serial at f8028000 {
+        compatible = "atmel,at91sam9260-usart";
+        reg = <0xf8028000 0x200>;
+        interrupts = <8 IRQ_TYPE_LEVEL_HIGH 5>;
+        pinctrl-names = "default";
+      
+        pinctrl-0 = <&pinctrl_usart3 &pinctrl_usart3_rts &pinctrl_usart3_cts>;
+        
+        
+         status = "okay";
+      };
+
+      /* /dev/ttyS5 */
+      uart0: serial at f8040000 {
+        status = "disabled";
+      };
+
+      /* /dev/ttyS6 */
+      uart1: serial at f8044000 {
+        status = "disabled";
+      };
+
+      spi0: spi at f0000000 {
+        status = "okay";
+        cs-gpios = <&pioA 14 0>, <&pioA 7 0>, <0>, <0>;
+        
+        device at 0 {
+          compatible = "spidev";
+          // spi-max-frequency = <50000000>;  // 50 MHz
+          spi-max-frequency = <5000000>;	    // 5 MHz
+          reg = <0>;
+        };
+
+        device at 1 {
+          compatible = "spidev";
+          // spi-max-frequency = <50000000>;  // 50 MHz
+          spi-max-frequency = <5000000>;	    // 5 MHz
+          reg = <1>;
+        };
+      };
+
+
+      macb0: ethernet at f802c000 {
+        phy-mode = "rmii";
+        local-mac-address = [00 04 25 21 43 65];
+        status = "okay";
+      };
+
+      adc0: adc at f804c000 {
+        status = "okay";
+        atmel,adc-channels-used = <0xf>;
+        atmel,adc-num-channels = <4>;
+      };
+
+      dbgu: serial at fffff200 {
+        status = "okay";
+      };
+
+      pinctrl at fffff400 {
+        w1_0 {
+          pinctrl_w1_0: w1_0-0 {
+            atmel,pins = <0 21 0x0 0x1>; /* PA21 PIO, pull-up */
+          };
+        };
+      };
+
+      rtc at fffffeb0 {
+        status = "okay";
+      };
+    };
+
+    usb0: ohci at 00600000 {
+      status = "okay";
+      num-ports = <3>;
+    };
+
+    usb1: ehci at 00700000 {
+      status = "okay";
+    };
+  };
+
+  leds {
+    compatible = "gpio-leds";
+
+    aria_led {
+      label = "aria_led";
+      gpios = <&pioB 8 GPIO_ACTIVE_HIGH>; /* PB8 */
+      linux,default-trigger = "heartbeat";
+    };
+
+  };
+
+  onewire at 0 {
+    compatible = "w1-gpio";
+    gpios = <&pioA 21 GPIO_ACTIVE_LOW>;
+    pinctrl-names = "default";
+    pinctrl-0 = <&pinctrl_w1_0>;
+  };
+};
diff --git a/board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces b/board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces
new file mode 100644
index 0000000..104c1a1
--- /dev/null
+++ b/board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces
@@ -0,0 +1,5 @@
+auto lo
+iface lo inet loopback
+
+auto eth0
+iface eth0 inet dhcp
diff --git a/configs/ariag25_defconfig b/configs/ariag25_defconfig
new file mode 100644
index 0000000..b2a23ff
--- /dev/null
+++ b/configs/ariag25_defconfig
@@ -0,0 +1,12 @@
+BR2_arm=y
+BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TARGET_GENERIC_HOSTNAME="ariag25"
+BR2_TARGET_GENERIC_ISSUE="Welcome to AriaG25 by www.acmesystems.it!"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/acmesystems/ariag25/at91-ariag25.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/ariag25/at91-ariag25.dts"
diff --git a/configs/ariag25_demo_terra_defconfig b/configs/ariag25_demo_terra_defconfig
new file mode 100644
index 0000000..3457472
--- /dev/null
+++ b/configs/ariag25_demo_terra_defconfig
@@ -0,0 +1,21 @@
+BR2_arm=y
+BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TARGET_GENERIC_HOSTNAME="ariag25"
+BR2_TARGET_GENERIC_ISSUE="Welcome to AriaG25 by www.acmesystems.it!"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/acmesystems/ariag25/at91-ariag25.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/ariag25/at91-ariag25.dts"
+BR2_PACKAGE_PYTHON=y
+BR2_PACKAGE_PYTHON_SQLITE=y
+BR2_PACKAGE_PYTHON_ZLIB=y
+BR2_PACKAGE_PYTHON_SERIAL=y
+BR2_PACKAGE_DROPBEAR=y
+BR2_PACKAGE_IPUTILS=y
+BR2_PACKAGE_NTP=y
+BR2_PACKAGE_OPKG=y
-- 
1.9.1
