Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8E5E94627
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 00:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BAC483C6B;
	Tue, 10 Feb 2026 00:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdvW3AFXJcAr; Tue, 10 Feb 2026 00:08:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ADDD83C6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770682116;
	bh=M7GQqSpd2pjSy5Xb1spsIdChfzSRIEEQDVkj12s557w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QTld7EoiMX9lfjBmIJQHsGLtfLptk/37JKEJ5uhQo5Qdnsh/ksu8QPV/O2LWpijMs
	 H0iqIqVrbc/EZ0lKQbzBYb0/umsfKR9/XwlI1dYtIyZMQTSr1KBdHyC4/tNB5HgUTk
	 LOpIWKoeCrPHysnGTjTlCEfAt0DMMtYvOBmTyk8A6OchanJ1KqGqc+PXgSZ5N/vyR6
	 zHajaENm9Z2e6f/7asryFUBc8Inf6jyAfY/5tWJBqnVKZeHxn25wPJ4U89635V7odF
	 Ty0C59uPJdwKFWlX//KCPt/X+pcfO5PVdfUjRAFcVogHlIbs33F8MyJGsffLIeyNsU
	 M5WVYThBDv5IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ADDD83C6E;
	Tue, 10 Feb 2026 00:08:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A04181A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD0286067C
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwA1Fx_hVHRx for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 00:08:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.42;
 helo=smtpcmd0642.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9005360ABF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9005360ABF
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9005360ABF
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:08:31 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pbIqvaeTtdarQpbIrvRnZC; Tue, 10 Feb 2026 01:08:29 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Feb 2026 01:08:26 +0100
Message-ID: <20260210000827.3811338-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210000827.3811338-1-giulio.benetti@benettiengineering.com>
References: <20260210000827.3811338-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfF3C5JpQZyAqvswXMvh46dh7zpRGbD4wMEa7+sFWyjTjsPYJPTBJW5nuCfmg/BrAVZV76h49ioWXQ+/hHYbWGOGvzPJHqlicIUETjQK/fRCXFe6Z+KLD
 3ano9ZrbwszroOG2rneR7MYN40Y6OPPgwXociez+LN9hxoAiuuIWV+2VoFDOqEpxZiZnz4VpXGaDvW1Ojn9r6FBAKl/7qsuQWRis7nR/Z++wPyW6qbYNK+L2
 2FlRJN1n6rOFdAVeSPH6tCCQ/QuSWGUarcwEEtLACO803UCV7dGXJ2jMJNAP2/sqOuKBKnC/VGQpGVIXxU3jQi5S3gsJ35RO2hDLOazFGHTSBglohsoWwnS3
 brlJYaXF1VjQt08xbr61WKdW4oXjG5DBJeRHubURypP0+zHFum1212MEo1/DwPvldcWROz+rZefGmc+5+9fvdjl/INZRc/BVhGWNMSk76zVnrDeUpy5t9nLZ
 kiD6ndrMG6QWc6J/pbQbgwr2SFTlHsXiBA6h3wHKbTLPQQ0sEsUEjY5Hz5HtKVVEBUE7nHXNIvIgsp4jPrHkiXzk1VKULM9Atty5BNrA/rgNTx585dFcvqpN
 u1c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770682109; bh=sMZemmcjFVpIcE8x502JSqi7fwSFA1yfS6pcLmBLL0Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=NbISqLieZeNVm49fOKzyzXNue3fK0Wn0qr2NX+X62+3vHvdA32Angq76KF9FM/Xyt
 B6QcNTtkbyrwjUfnogTXkdXN0rj/3j/zGv8E7b4BRrnEottQCyVYlDRXvwfnxKL5+9
 y5qWrHnn0Ith+KDlRf12NuvmacueQ2HMVl4Oo75Uxo9bXTvSK3fsIpk4vT5rrfwond
 LIiF/epMbUJN6COBmiJlnp9odACJk20FtSqMP+BErADob22Cz1QN9C91WI+s0hwQ/S
 6lNFO7KpT+hgQNPoEtiqhy8/UtEa5Jr65oZou21H92zzLagaZ/kUhUgMmSfXP5/nef
 PymeNcFIrDP9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=NbISqLie
Subject: [Buildroot] [PATCH v2 12/13] configs/olimex_a33_olinuxino: bump
 Linux to 6.18.8 and U-Boot to 2026.01
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
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch:
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* forces check hashes
* switches to extlinux

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .checkpackageignore                              |  2 --
 board/olimex/a33_olinuxino/boot.cmd              |  5 -----
 .../patches/linux-headers/linux-headers.hash     |  1 +
 .../a33_olinuxino/patches/linux/linux.hash       |  2 ++
 .../a33_olinuxino/patches/uboot/uboot.hash       |  2 ++
 board/olimex/a33_olinuxino/post-build.sh         |  2 --
 .../rootfs_overlay/boot/extlinux/extlinux.conf   |  4 ++++
 configs/olimex_a33_olinuxino_defconfig           | 16 ++++++++--------
 8 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 board/olimex/a33_olinuxino/boot.cmd
 create mode 120000 board/olimex/a33_olinuxino/patches/linux-headers/linux-headers.hash
 create mode 100644 board/olimex/a33_olinuxino/patches/linux/linux.hash
 create mode 100644 board/olimex/a33_olinuxino/patches/uboot/uboot.hash
 delete mode 100755 board/olimex/a33_olinuxino/post-build.sh
 create mode 100644 board/olimex/a33_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf

diff --git a/.checkpackageignore b/.checkpackageignore
index bdc67897a4..74fdd450c6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -32,7 +32,6 @@ board/octavo/osd32mp1-brk/patches/uboot/0001-Add-OSD32MP1-BRK-device-tree-suppor
 board/octavo/osd32mp1-brk/patches/uboot/0002-Add-OSD32MP1-BRK-build-config.patch lib_patch.NumberedSubject lib_patch.Upstream
 board/octavo/osd32mp1-red/patches/uboot/0001-Add-OSD32MP1-RED-Device-Tree-support.patch lib_patch.NumberedSubject lib_patch.Upstream
 board/octavo/osd32mp1-red/patches/uboot/0002-configs-stm32mp15_trusted_defconfig-disable-environm.patch lib_patch.NumberedSubject lib_patch.Upstream
-board/olimex/a33_olinuxino/post-build.sh Shellcheck
 board/olpc/post-build.sh Shellcheck
 board/orangepi/common/post-build.sh Shellcheck
 board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch lib_patch.Upstream
@@ -131,7 +130,6 @@ configs/nitrogen8mm_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mn_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mp_defconfig lib_defconfig.ForceCheckHash
 configs/odroidc2_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/olimex/a33_olinuxino/boot.cmd b/board/olimex/a33_olinuxino/boot.cmd
deleted file mode 100644
index 44d9239a94..0000000000
--- a/board/olimex/a33_olinuxino/boot.cmd
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
-ext4load mmc 0 0x49000000 /boot/${fdtfile}
-ext4load mmc 0 0x46000000 /boot/zImage
-env set fdt_high ffffffff
-bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a33_olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/a33_olinuxino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/olimex/a33_olinuxino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/a33_olinuxino/patches/linux/linux.hash b/board/olimex/a33_olinuxino/patches/linux/linux.hash
new file mode 100644
index 0000000000..b1a0042a91
--- /dev/null
+++ b/board/olimex/a33_olinuxino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/olimex/a33_olinuxino/patches/uboot/uboot.hash b/board/olimex/a33_olinuxino/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/olimex/a33_olinuxino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/olimex/a33_olinuxino/post-build.sh b/board/olimex/a33_olinuxino/post-build.sh
deleted file mode 100755
index b418120652..0000000000
--- a/board/olimex/a33_olinuxino/post-build.sh
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/olimex/a33_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a33_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..f852b75a44
--- /dev/null
+++ b/board/olimex/a33_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label A13-Olinuxino
+    kernel /boot/zImage
+    fdtdir /boot
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
diff --git a/configs/olimex_a33_olinuxino_defconfig b/configs/olimex_a33_olinuxino_defconfig
index 8c053ef3d6..3606d49a41 100644
--- a/configs/olimex_a33_olinuxino_defconfig
+++ b/configs/olimex_a33_olinuxino_defconfig
@@ -1,34 +1,34 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/olimex/a33_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="A33-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to A33 OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a33_olinuxino/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/olimex/a33_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a33_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-a33-olinuxino"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-a33-olinuxino"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A33-OLinuXino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a33_olinuxino/boot.cmd"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
