Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8378DC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED9AC418E2;
	Wed,  9 Aug 2023 17:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED9AC418E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cARKCBD0D7JM; Wed,  9 Aug 2023 17:32:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38663418E5;
	Wed,  9 Aug 2023 17:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38663418E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 100431BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2B38418E5
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2B38418E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MzSOAU_MaSEy for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:32:28 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05889418E2
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05889418E2
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5236a9788a7so1049825a12.0
 for <buildroot@buildroot.org>; Wed, 09 Aug 2023 10:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691602346; x=1692207146;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EfKQ0kaYalN11VxVP8oIj1Lv1XzbQXrL68xrViEVAQU=;
 b=X/zON8hwd90020zZU1Ll5AYNghA1rDpvbVQgHumHPmgoaq4TngYC8Bkg/HYYz7tdCv
 wZ8LAjf9VdFAfZ9wsKcoPnH8HNN4rj0qVcqCritQXWGTmfnqCM2Tje32ULMyFAHXbNis
 Bw7e7ryyhLvFs8of6BPo7LhcKgn0di/3Sy+rEQU24Yc05UAxn6l/mWZvMF2i0VAEyHYj
 awvAIcseBa0OAQZsUO3nIMPgS5+O7k527GzF7ODHRvgJVPBmgZOiCt1ijjlGjsghPfZl
 mOMQry+SWAq1yCw2FNyLzSAzkmvKNzcleMPjZiUfAdmHJK5BI++6SEW/5kS65mqMkkxs
 T+kQ==
X-Gm-Message-State: AOJu0Yy7bmZO3MF3/LUeqGWjJUHVwFG/NpM6GyNaDMFIU/7STl9BeZrb
 ovW+x5jpYSQt8eI8sFLkKl4ZxyAilC1Y0x53AxDcPxrNIes=
X-Google-Smtp-Source: AGHT+IFcaCwK7es2IS6MFsrTEEcggghXAEMQoNGheV6bS3xl/wy2WwydQsYyjkVRq6QVdXg+/aU/fdLz4euopG4HqOw=
X-Received: by 2002:a17:907:7858:b0:99c:56d1:79fd with SMTP id
 lb24-20020a170907785800b0099c56d179fdmr2697081ejc.51.1691602345639; Wed, 09
 Aug 2023 10:32:25 -0700 (PDT)
MIME-Version: 1.0
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Wed, 9 Aug 2023 20:32:15 +0300
Message-ID: <CA+fTLhg9R0KwFb-EZKEYy2U_WgdRzBZyJ6QrmCUv4dCB_kfo8A@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691602346; x=1692207146;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EfKQ0kaYalN11VxVP8oIj1Lv1XzbQXrL68xrViEVAQU=;
 b=Bm6jPrkwjwAh/0ljtqxovOBoqTpXRRvqlZfId3BBZOYTZNzgiuMbZlmIPUVotf0Adp
 ja6PHcBRioNTdn8q3q/7AV2Or07Fgmad765CjYL0fVCctVyRLGdR8v5GwNgw1RKcTG3m
 HL8+5XVlJXzXDfxL2wDmf6ciaxgRL3tqVhcl067nQx5hP2m/ae6XLsiC8LIARXWPufAO
 /045UqdfiRUgOq4wE2nWb6d+73Z/qs0kzxI34009uv5oqJx5e3iyMRdkZbq7aDiWQk6t
 07y3S+ssw7VThBFrEimX6QFylAz6fRem2agLXc0R0P/Q7FFVt30Vgcj5KCNEToA/twyG
 StSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Bm6jPrkw
Subject: [Buildroot] [PATCH 1/1] configs/mangopi_mq_d1s: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the support for the MangoPi MQ D1s board.
Allwinner D1/D1s SOC and this particular board is partially supported by
mainline linux kernel so the current configuration runs on mainline 6.4.x
series. Improved support (PWM,SPI,CAN,audio) is coming in the near future.
The provided kernel configuration in linux.fragment ensures that the compiled
kernel is suitable for the board with 64MB RAM (integrated into the CPU).
The configuration is using an u-boot version provided by Samuel Holland.

Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>
---
 DEVELOPERS                                    |  4 ++
 board/mangopi-mq-d1s/genimage.cfg             | 20 ++++++
 board/mangopi-mq-d1s/linux.fragment           | 70 +++++++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |  4 ++
 .../overlay/etc/network/interfaces            |  6 ++
 .../overlay/etc/wpa_supplicant.conf           |  8 +++
 board/mangopi-mq-d1s/readme.txt               | 48 +++++++++++++
 board/mangopi-mq-d1s/uboot_board_defconfig    | 10 +++
 configs/mangopi_mq_d1s_defconfig              | 47 +++++++++++++
 9 files changed, 217 insertions(+)
 create mode 100644 board/mangopi-mq-d1s/genimage.cfg
 create mode 100644 board/mangopi-mq-d1s/linux.fragment
 create mode 100644 board/mangopi-mq-d1s/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/mangopi-mq-d1s/overlay/etc/network/interfaces
 create mode 100644 board/mangopi-mq-d1s/overlay/etc/wpa_supplicant.conf
 create mode 100644 board/mangopi-mq-d1s/readme.txt
 create mode 100644 board/mangopi-mq-d1s/uboot_board_defconfig
 create mode 100644 configs/mangopi_mq_d1s_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 0f6cb75e0e..83a539b46f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1334,6 +1334,10 @@ F: package/keepalived/
 N: Ilya Averyanov <averyanovin@gmail.com>
 F: package/exempi/

+N: Indrek Kruusa <indrek.kruusa@gmail.com>
+F: configs/mangopi_mq_d1s_defconfig
+F: board/mangopi-mq-d1s
+
 N: Ismael Luceno <ismael@iodev.co.uk>
 F: package/axel/
 F: package/mawk/
diff --git a/board/mangopi-mq-d1s/genimage.cfg
b/board/mangopi-mq-d1s/genimage.cfg
new file mode 100644
index 0000000000..3acf78a3ab
--- /dev/null
+++ b/board/mangopi-mq-d1s/genimage.cfg
@@ -0,0 +1,20 @@
+# Minimal SD card image for the MangoPi MQ F133 D1s
+# https://mangopi.org/mangopi_mq
+
+image sdcard.img {
+ hdimage {
+ }
+
+ partition u-boot {
+ in-partition-table = false
+ image = "u-boot-sunxi-with-spl.bin"
+ offset = 8K
+ }
+
+ partition rootfs {
+ partition-type = 0x83
+ image = "rootfs.ext4"
+ bootable = "true"
+ offset = 1M
+ }
+}
diff --git a/board/mangopi-mq-d1s/linux.fragment
b/board/mangopi-mq-d1s/linux.fragment
new file mode 100644
index 0000000000..20a24f841d
--- /dev/null
+++ b/board/mangopi-mq-d1s/linux.fragment
@@ -0,0 +1,70 @@
+# CONFIG_SOC_MICROCHIP_POLARFIRE is not set
+# CONFIG_ARCH_RENESAS is not set
+# CONFIG_SOC_SIFIVE is not set
+# CONFIG_SOC_STARFIVE is not set
+# CONFIG_SOC_VIRT is not set
+# CONFIG_ERRATA_SIFIVE is not set
+CONFIG_BROKEN_ON_SMP=y
+# CONFIG_SMP is not set
+CONFIG_NONPORTABLE=y
+CONFIG_HZ_250=y
+CONFIG_RISCV_SBI_CPUIDLE=y
+# CONFIG_EFI is not set
+# CONFIG_CPU_FREQ is not set
+# CONFIG_KPROBES is not set
+# CONFIG_SWAP is not set
+# CONFIG_ZSWAP is not set
+# CONFIG_VIRTUALIZATION is not set
+# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
+CONFIG_SYSVIPC_COMPAT=y
+CONFIG_POSIX_MQUEUE is not set
+CONFIG_PREEMPT_BUILD=y
+CONFIG_PREEMPT=y
+CONFIG_PREEMPTION=y
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CGROUP_HUGETLB is not set
+# CONFIG_CGROUP_PERF is not set
+# CONFIG_CHECKPOINT_RESTORE is not set
+# CONFIG_BLK_DEV_INITRD is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MQ_IOSCHED_DEADLINE is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+# CONFIG_IOSCHED_BFQ is not set
+CONFIG_COMPAT=y
+# CONFIG_STACKPROTECTOR is not set
+CONFIG_FLATMEM_MANUAL=y
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=y
+CONFIG_SUN50I_DE2_BUS=y
+CONFIG_SUNXI_RSB=y
+CONFIG_GPIO_GENERIC_PLATFORM=y
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_LEGACY_TIOCSTI is not set
+# CONFIG_SERIAL_8250_PCI is not set
+# CONFIG_SERIAL_SIFIVE is not set
+# CONFIG_SPI_SIFIVE is not set
+# CONFIG_GPIO_SIFIVE is not set
+# CONFIG_VHOST_MENU is not set
+# CONFIG_GOLDFISH is not set
+# CONFIG_NET_9P is not set
+# CONFIG_BLK_DEV_NVME is not set
+# CONFIG_BLK_DEBUG_FS is not set
+# CONFIG_SCSI is not set
+# CONFIG_ATA is not set
+# CONFIG_DRM_RADEON is not set
+# CONFIG_DRM_NOUVEAU is not set
+# CONFIG_RAID6_PQ_BENCHMARK is not set
+# CONFIG_DEBUG_PREEMPT is not set
+# CONFIG_LIBNVDIMM is not set
+# CONFIG_DAX is not set
+# CONFIG_ETHERNET is not set
+# CONFIG_PHYLIB is not set
+# CONFIG_USB_NET_DRIVERS is not set
+# CONFIG_WLAN is not set
+# CONFIG_SPI is not set
+# CONFIG_NFS_SWAP is not set
+CONFIG_PINCTRL_SUNXI=y
+CONFIG_PINCTRL_SUN20I_D1=y
+# CONFIG_VIRTIO_BLK is not set
+# CONFIG_MD is not set
+# CONFIG_VIRTIO_MENU is not set
diff --git a/board/mangopi-mq-d1s/overlay/boot/extlinux/extlinux.conf
b/board/mangopi-mq-d1s/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..c825ad4667
--- /dev/null
+++ b/board/mangopi-mq-d1s/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /boot/Image
+  # use devicetree from u-boot
+  append console=ttyS3,115200 root=/dev/mmcblk0p1 ro rootwait
diff --git a/board/mangopi-mq-d1s/overlay/etc/network/interfaces
b/board/mangopi-mq-d1s/overlay/etc/network/interfaces
new file mode 100644
index 0000000000..89e7d74aff
--- /dev/null
+++ b/board/mangopi-mq-d1s/overlay/etc/network/interfaces
@@ -0,0 +1,6 @@
+auto lo
+iface lo inet loopback
+
+auto wlan0
+iface wlan0 inet dhcp
+wpa-conf /etc/wpa_supplicant.conf
diff --git a/board/mangopi-mq-d1s/overlay/etc/wpa_supplicant.conf
b/board/mangopi-mq-d1s/overlay/etc/wpa_supplicant.conf
new file mode 100644
index 0000000000..b43292b0a7
--- /dev/null
+++ b/board/mangopi-mq-d1s/overlay/etc/wpa_supplicant.conf
@@ -0,0 +1,8 @@
+ap_scan=1
+
+network={
+        ssid="YOURSSID"
+        scan_ssid=1
+        key_mgmt=WPA-PSK
+        psk="YOURPASSWD"
+}
diff --git a/board/mangopi-mq-d1s/readme.txt b/board/mangopi-mq-d1s/readme.txt
new file mode 100644
index 0000000000..60b148764e
--- /dev/null
+++ b/board/mangopi-mq-d1s/readme.txt
@@ -0,0 +1,48 @@
+MangoPi MQ D1s (RISC-V)
+=======================
+
+MangoPi MQ D1s (board model MQ1W) is a tiny (4x4cm) RISC-V based
single board computer. It's built around
+Allwinner D1s (also referred as F133) single core 1GHz CPU with
integrated 64MB DDR2 RAM.
+Board features:
+- USB-OTG Type-C socket
+- USB-HOST Type-C socket
+- 2x 22 pin GPIO headers
+- TF card slot
+- RTL8189FTV WiFi module with ext. antenna connector
+- 15 pin DSI FPC connector
+- 40 pin RGB FPC connector
+- 6 pin CTP FPC connector
+- 24 pin DVP FPC connector
+- onboard mic
+- onboard audio amplifier
+- FEL,reset button
+
+There is no HDMI connector.
+
+How to build
+============
+
+$ make mangopi_mq_d1s_defconfig
+$ make
+
+Wifi
+==========
+
+Edit  board/mangopi-mq-d1s/overlay/etc/wpa_supplicant.conf or
+/etc/wpa_supplicant.conf once connected to the board:
+
+* Replace YOURSSID with your AP ssid
+* Replace YOURPASSWD with your AP password
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Connect a TTL UART to the UART3 on P8 header (unpopulated), insert
the microSD card and
+plug in a USB-C cable to the OTG or HOST connector to boot the system.
diff --git a/board/mangopi-mq-d1s/uboot_board_defconfig
b/board/mangopi-mq-d1s/uboot_board_defconfig
new file mode 100644
index 0000000000..0a3d8ded01
--- /dev/null
+++ b/board/mangopi-mq-d1s/uboot_board_defconfig
@@ -0,0 +1,10 @@
+CONFIG_RISCV=y
+CONFIG_DEFAULT_DEVICE_TREE="sun20i-d1s-mangopi-mq"
+CONFIG_TARGET_SUN20I_D1=y
+CONFIG_ARCH_RV64I=y
+CONFIG_RISCV_SMODE=y
+# CONFIG_SPL_SMP is not set
+CONFIG_SYS_SPL_MALLOC=y
+CONFIG_SPL_OPENSBI_SCRATCH_OPTIONS=0x0
+# CONFIG_SYS_I2C_MVTWSI is not set
+CONFIG_DM_REGULATOR_FIXED=y
diff --git a/configs/mangopi_mq_d1s_defconfig b/configs/mangopi_mq_d1s_defconfig
new file mode 100644
index 0000000000..0d2a3c40dd
--- /dev/null
+++ b/configs/mangopi_mq_d1s_defconfig
@@ -0,0 +1,47 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_OVERLAY="board/mangopi-mq-d1s/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/mangopi-mq-d1s/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.8"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/mangopi-mq-d1s/linux.fragment"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1s-mangopi-mq"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_RTL8189FS=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
+BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_PLAT="generic"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
+BR2_TARGET_OPENSBI_LATEST_VERSION=y
+# BR2_TARGET_OPENSBI_CUSTOM_VERSION is not set
+BR2_TARGET_OPENSBI_VERSION="1.3"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call
github,smaeul,u-boot,for-conor)/uboot-for-conor.tar.gz"
+# BR2_TARGET_UBOOT_USE_DEFCONFIG is not set
+BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE="board/mangopi-mq-d1s/uboot_board_defconfig"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
