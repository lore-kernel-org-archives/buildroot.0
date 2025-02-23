Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C07DC021B3
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 17:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C0E440747;
	Sun, 23 Feb 2025 17:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ID5jOQ87IHCT; Sun, 23 Feb 2025 17:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B1C40754
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84B1C40754;
	Sun, 23 Feb 2025 17:33:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D2F9943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 17:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20EEF40B87
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 17:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADmyJeUcTrua for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 17:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DE1340EC0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DE1340EC0
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 17:33:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C55387A30; Sun, 23 Feb 2025 17:33:13 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Feb 2025 18:05:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee91e37299a79c330675e516231f07734d0b862c
X-Git-Newrev: 41734e00c0cc36f4df2f492e72b535a0716d4048
X-Patchwork-Hint: ignore
Message-Id: <20250223173313.3C55387A30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/friendlyarm_nanopi_r3s_defconfig:
 new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5412223516763207420=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5412223516763207420==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=41734e00c0cc36f4df2f492e72b535a0716d4048
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds basic support for the new FriendlyARM NanoPi R3S board:
 - https://www.friendlyelec.com/index.php?route=product/product&product_id=303
 - https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R3S

Hardware Spec:
 - CPU: Rockchip RK3566, Quad-core Cortex-A55
 - RAM: 2GB LPDDR4X
 - Ethernet: one Native Gigabit Ethernet, and one PCIe Gigabit Ethernet
 - USB3.0 Host: Type-A x1
 - Storage: MicroSD Slot x 1, and on-board 32GB eMMC
 - Debug Serial Port: 3.3V TTL, 3-pin 2.54mm pitch connector, 1500000 bauds
 - LED: LED x 3
 - RTC: One low-power RTC, support backup battery input
 - Buttons: 1x User button, 1x MASK button for eMMC flashing via USB-C
 - Display: 1x MIPI-DSI 30-Pin FPC connector

BSP includes the following components:
 - mainline ATF v2.12
 - mainline U-Boot v2025.04-rc2
 - mainline Linux kernel v6.13.4

Note: this defconfig is using U-Boot v2025.04-rc2 because the
NanoPi R3S support was added in upstream commit [1] first included
in v2025.04-rc1.

[1] https://source.denx.de/u-boot/u-boot/-/commit/bf4a33e725ae02cae064a03ea90c45779780f323

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/friendlyarm/nanopi-r3s/extlinux.conf.in      |   4 +
 board/friendlyarm/nanopi-r3s/genimage.cfg.in       |  19 ++++
 board/friendlyarm/nanopi-r3s/kernel.config         | 118 +++++++++++++++++++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |   2 +
 .../patches/linux-headers/linux-headers.hash       |   1 +
 .../nanopi-r3s/patches/linux/linux.hash            |   2 +
 .../nanopi-r3s/patches/uboot/uboot.hash            |   2 +
 board/friendlyarm/nanopi-r3s/post-build.sh         |   7 ++
 board/friendlyarm/nanopi-r3s/readme.txt            |  41 +++++++
 .../rootfs_overlay/etc/network/interfaces          |   8 ++
 configs/friendlyarm_nanopi_r3s_defconfig           |  46 ++++++++
 11 files changed, 250 insertions(+)

diff --git a/board/friendlyarm/nanopi-r3s/extlinux.conf.in b/board/friendlyarm/nanopi-r3s/extlinux.conf.in
new file mode 100644
index 0000000000..ecddbc420e
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/extlinux.conf.in
@@ -0,0 +1,4 @@
+LABEL default
+  kernel /boot/Image
+  devicetreedir /boot
+  append root=PARTUUID=%PARTUUID% rootwait
diff --git a/board/friendlyarm/nanopi-r3s/genimage.cfg.in b/board/friendlyarm/nanopi-r3s/genimage.cfg.in
new file mode 100644
index 0000000000..f3babe465a
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/genimage.cfg.in
@@ -0,0 +1,19 @@
+image sdcard.img {
+	hdimage {
+		partition-table-type = "gpt"
+		gpt-no-backup = true
+	}
+
+	partition uboot {
+		in-partition-table = false
+		image = "u-boot-rockchip.bin"
+		offset = 32K
+	}
+
+	partition rootfs {
+		offset = 16M
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
+		bootable = true
+	}
+}
diff --git a/board/friendlyarm/nanopi-r3s/kernel.config b/board/friendlyarm/nanopi-r3s/kernel.config
new file mode 100644
index 0000000000..b6fdca8b86
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/kernel.config
@@ -0,0 +1,118 @@
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_ARCH_ROCKCHIP=y
+CONFIG_ARM64_VA_BITS_39=y
+CONFIG_NR_CPUS=4
+# CONFIG_EFI is not set
+# CONFIG_SUSPEND is not set
+CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
+CONFIG_ENERGY_MODEL=y
+CONFIG_CPU_IDLE=y
+CONFIG_ARM_PSCI_CPUIDLE=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
+CONFIG_CPUFREQ_DT=y
+CONFIG_JUMP_LABEL=y
+# CONFIG_GCC_PLUGINS is not set
+# CONFIG_SWAP is not set
+CONFIG_CMA=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_PCI=y
+CONFIG_PCIE_ROCKCHIP_HOST=y
+CONFIG_PCIE_ROCKCHIP_DW_HOST=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_NETDEVICES=y
+CONFIG_R8169=y
+CONFIG_STMMAC_ETH=y
+CONFIG_ROCKCHIP_PHY=y
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_LEGACY_PTY_COUNT=4
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=1
+CONFIG_SERIAL_8250_RUNTIME_UARTS=1
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_RK3X=y
+CONFIG_PINCTRL_RK805=y
+CONFIG_SYSCON_REBOOT_MODE=y
+CONFIG_THERMAL=y
+CONFIG_CPU_THERMAL=y
+CONFIG_ROCKCHIP_THERMAL=y
+CONFIG_WATCHDOG=y
+CONFIG_DW_WATCHDOG=y
+CONFIG_MFD_RK8XX_I2C=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_FAN53555=y
+CONFIG_REGULATOR_RK808=y
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_DWC3=y
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_MMC=y
+CONFIG_MMC_BLOCK_MINORS=32
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_DWCMSHC=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_ROCKCHIP=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_ACTIVITY=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_LEDS_TRIGGER_NETDEV=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_HYM8563=y
+CONFIG_DMADEVICES=y
+CONFIG_PL330_DMA=y
+CONFIG_COMMON_CLK_RK808=y
+# CONFIG_CLK_PX30 is not set
+# CONFIG_CLK_RK3308 is not set
+# CONFIG_CLK_RK3328 is not set
+# CONFIG_CLK_RK3368 is not set
+# CONFIG_CLK_RK3399 is not set
+# CONFIG_CLK_RK3576 is not set
+# CONFIG_CLK_RK3588 is not set
+CONFIG_ROCKCHIP_IOMMU=y
+CONFIG_ROCKCHIP_IODOMAIN=y
+CONFIG_ROCKCHIP_PM_DOMAINS=y
+CONFIG_PHY_ROCKCHIP_EMMC=y
+CONFIG_PHY_ROCKCHIP_INNO_USB2=y
+CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y
+CONFIG_PHY_ROCKCHIP_PCIE=y
+CONFIG_PHY_ROCKCHIP_USB=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
+CONFIG_TMPFS=y
+CONFIG_SECURITY=y
+CONFIG_CRYPTO_USER=y
+CONFIG_CRYPTO_GHASH=y
+CONFIG_CRYPTO_USER_API_RNG=y
+CONFIG_CRYPTO_CHACHA20_NEON=y
+CONFIG_CRYPTO_GHASH_ARM64_CE=y
+CONFIG_CRYPTO_SHA1_ARM64_CE=y
+CONFIG_CRYPTO_SHA2_ARM64_CE=y
+CONFIG_CRYPTO_SHA512_ARM64_CE=y
+CONFIG_CRYPTO_SHA3_ARM64=y
+CONFIG_CRYPTO_AES_ARM64_BS=y
+CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
+CONFIG_CRYPTO_DEV_ROCKCHIP=y
+CONFIG_DMA_CMA=y
+CONFIG_STRIP_ASM_SYMS=y
diff --git a/board/friendlyarm/nanopi-r3s/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/friendlyarm/nanopi-r3s/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..b5898cba3f
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  06b35a3596b8417bf66f7bfdd7acd181bcb53fc36dc13216227b5cae154e0219  arm-trusted-firmware-v2.12-git4.tar.gz
diff --git a/board/friendlyarm/nanopi-r3s/patches/linux-headers/linux-headers.hash b/board/friendlyarm/nanopi-r3s/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash b/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
new file mode 100644
index 0000000000..b2e8ee602b
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  b80e0bc8efbc31e9ce5a84d1084dcccfa40e01bea8cc25afd06648b93d61339e  linux-6.13.4.tar.xz
diff --git a/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash b/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..f9bb6166d1
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  e54102f17328397d5d63b00865e9108d5806d18018509fc24ce6e7e3fe6a12f1  u-boot-2025.04-rc2.tar.bz2
diff --git a/board/friendlyarm/nanopi-r3s/post-build.sh b/board/friendlyarm/nanopi-r3s/post-build.sh
new file mode 100755
index 0000000000..604f387768
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+PARTUUID="$("$HOST_DIR"/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf.in" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg.in" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/friendlyarm/nanopi-r3s/readme.txt b/board/friendlyarm/nanopi-r3s/readme.txt
new file mode 100644
index 0000000000..515620218a
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/readme.txt
@@ -0,0 +1,41 @@
+FriendlyARM NanoPi R3S
+=======================
+https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R3S
+
+How to build
+============
+  $ make friendlyarm_nanopi_r3s_defconfig
+  $ make
+
+Files created in output directory
+=================================
+
+output/images
+├── bl31.elf
+├── genimage.cfg
+├── Image
+├── rk3566_ddr_1056MHz_v1.18.bin
+├── rockchip
+│   └── rk3566-nanopi-r3s.dtb
+├── rootfs.ext2
+├── rootfs.ext4 -> rootfs.ext2
+├── rtl_nic
+│   ├── ...
+│   ├── rtl8168h-2.fw
+│   └── ...
+├── sdcard.img
+├── u-boot.bin
+└── u-boot-rockchip.bin
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M conv=fsync
+
+Insert the micro SDcard in your Nanopi R3S and power it up.
+The console is on the serial line, 1500000 8N1.
diff --git a/board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/network/interfaces b/board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/network/interfaces
new file mode 100644
index 0000000000..d49e95de75
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/network/interfaces
@@ -0,0 +1,8 @@
+auto lo
+iface lo inet loopback
+
+auto eth0
+iface eth0 inet dhcp
+
+auto eth1
+iface eth1 inet dhcp
diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
new file mode 100644
index 0000000000..d0a2478637
--- /dev/null
+++ b/configs/friendlyarm_nanopi_r3s_defconfig
@@ -0,0 +1,46 @@
+BR2_aarch64=y
+BR2_cortex_a55=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-r3s/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="nanopi r3s"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the nanopi r3s board"
+BR2_ROOTFS_OVERLAY="board/friendlyarm/nanopi-r3s/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-r3s/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.13.4"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/friendlyarm/nanopi-r3s/kernel.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3566-nanopi-r3s"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+BR2_PACKAGE_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3566_ddr_1056MHz_v1.18.bin"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3568"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/bl31.elf"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04-rc2"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r3s-rk3566"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_HOST_GENIMAGE=y

--===============5412223516763207420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5412223516763207420==--
