Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58655EB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 20:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4213605A7;
	Sun,  2 Jul 2023 20:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4213605A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NzSoeb2KrHfE; Sun,  2 Jul 2023 20:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0081D60655;
	Sun,  2 Jul 2023 20:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0081D60655
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B937E1BF263
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 20:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F668402EA
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 20:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F668402EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-Thv_onvihm for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 20:53:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41B1F402D7
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41B1F402D7
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 20:53:13 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 6BF5EA035E;
 Sun,  2 Jul 2023 22:53:11 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 50CDAA03C1;
 Sun,  2 Jul 2023 22:53:11 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id 0A7BDC009A;
 Sun,  2 Jul 2023 22:53:10 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 22:52:24 +0200
Message-Id: <20230702205224.50568-3-kilian.zinnecker@mail.de>
In-Reply-To: <b0bc0426b400fa2f5402bdf85703a132@umbiko.net>
References: <b0bc0426b400fa2f5402bdf85703a132@umbiko.net>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 4743
X-purgate-ID: 154282::1688331191-1E7FEC09-2E03C66C/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688331191;
 bh=757BgzlDf24FQsskNZCZuZx9Sl11g2vocRCdLInQij0=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=S74F6RFbL4oUOprUyHxbISe4gDsiIv7HCBhgH3dQMWkArbstB6TVBP4GEH1nD02x6
 0ob0xb2f8YlEHOWzYqut2ktjf7oRhRFCxzJbUx2SmbSlWI7gaPngE2xybTA6+Ri4dy
 o9atVwTf6TiCww8khAWqpI0AJuTp/ocF6fV3y9H+aQReG25DNU+7V9jl5LoB6iKDiV
 f54gLA4Fm2hdPBAv2sp/BObPIW3j/WnuVFM9omjnFXv5A0g3IfJ2gckUAkUBE/Eq/b
 l2sGBKgdbFq40/8RxWce4BEhwPm8bx0UyoZ04LEDf0y9yUwcLxXDADFjrQTfiZxNSO
 fGC2u1exIjs1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=S74F6RFb
Subject: [Buildroot] [PATCH v2 3/3] board/radxa/rock5b: Add sdcard image
 scripts
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds post image scripts, generating an sdcard.img file,
which can be flashed on an SD card to boot the Radxa Rock 5B.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 board/radxa/rock5b/genimage.cfg   | 36 ++++++++++++++++++++++++
 board/radxa/rock5b/post-image.sh  | 24 ++++++++++++++++
 board/radxa/rock5b/rock5b.its     | 46 +++++++++++++++++++++++++++++++
 board/radxa/rock5b/uboot.fragment |  3 ++
 configs/rock5b_defconfig          |  4 +++
 5 files changed, 113 insertions(+)
 create mode 100644 board/radxa/rock5b/genimage.cfg
 create mode 100755 board/radxa/rock5b/post-image.sh
 create mode 100644 board/radxa/rock5b/rock5b.its
 create mode 100644 board/radxa/rock5b/uboot.fragment

diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
new file mode 100644
index 0000000000..88a4f1ee9e
--- /dev/null
+++ b/board/radxa/rock5b/genimage.cfg
@@ -0,0 +1,36 @@
+# SD card image for Radxa Rock 5b
+
+image boot.vfat {
+	vfat {
+		file image.itb {
+			image = "image.itb"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+		partition-table-type = "hybrid"
+	}
+
+	partition uboot {
+		in-partition-table = "false"
+		image = "u-boot-rockchip.bin"
+		offset = 32K
+		size = 12M
+	}
+
+	partition boot {
+		partition-type = "0xC"
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 64M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		offset = 96M
+	}
+}
diff --git a/board/radxa/rock5b/post-image.sh b/board/radxa/rock5b/post-image.sh
new file mode 100755
index 0000000000..891f52201d
--- /dev/null
+++ b/board/radxa/rock5b/post-image.sh
@@ -0,0 +1,24 @@
+#!/usr/bin/env bash
+
+GENIMAGE_CFG="$(dirname $0)/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+# genimage needs u-boot-rockchip.bin
+
+cp output/build/uboot-2023.07-rc4/u-boot-rockchip.bin ${BINARIES_DIR}/
+
+gzip -fk ${BINARIES_DIR}/Image
+cp board/radxa/rock5b/rock5b.its ${BINARIES_DIR}
+(cd $BINARIES_DIR && mkimage -f rock5b.its image.itb)
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+  --rootpath "${TARGET_DIR}" \
+  --tmppath "${GENIMAGE_TMP}" \
+  --inputpath "${BINARIES_DIR}" \
+  --outputpath "${BINARIES_DIR}" \
+  --config "${GENIMAGE_CFG}"
+
+RET=${?}
+exit ${RET}
diff --git a/board/radxa/rock5b/rock5b.its b/board/radxa/rock5b/rock5b.its
new file mode 100644
index 0000000000..d73659a56e
--- /dev/null
+++ b/board/radxa/rock5b/rock5b.its
@@ -0,0 +1,46 @@
+/dts-v1/;
+
+/ {
+	description = "Rock 5B FIT Image";
+	#address-cells = <1>;
+
+	images {
+		kernel {
+			description = "Kernel";
+			data = /incbin/("Image.gz");
+			type = "kernel";
+			arch = "arm64";
+			os = "linux";
+			compression = "gzip";
+			load = <0x0a200000>;
+			entry = <0x0a200000>;
+			hash {
+				algo = "sha256";
+			};
+		};
+		fdt {
+			description = "Device Tree";
+			data = /incbin/("rk3588-rock-5b.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			load = <0x0e000000>;
+			entry = <0x0e000000>;
+			hash {
+				algo = "sha256";
+			};
+		};
+	};
+
+	configurations {
+		default = "standard";
+		standard {
+			description = "Standard Boot";
+			kernel = "kernel";
+			fdt = "fdt";
+			hash {
+				algo = "sha256";
+			};
+		};
+	};
+};
diff --git a/board/radxa/rock5b/uboot.fragment b/board/radxa/rock5b/uboot.fragment
new file mode 100644
index 0000000000..0613e0b772
--- /dev/null
+++ b/board/radxa/rock5b/uboot.fragment
@@ -0,0 +1,3 @@
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="root=/dev/mmcblk0p2 rw rootfstype=ext4 clkin_hz=(25000000) earlycon clk_ignore_unused earlyprintk console=ttyS2,1500000n8 rootwait"
+CONFIG_BOOTCOMMAND="fatload mmc 1:1 ${loadaddr} image.itb && bootm ${loadaddr}"
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index f300e5d080..fb8ecf07e2 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a76_a55=y
 BR2_KERNEL_HEADERS_5_10=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/radxa/rock5b/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS=""
 BR2_TARGET_GENERIC_HOSTNAME="rock5b"
 BR2_TARGET_GENERIC_ISSUE="Rock 5b"
 BR2_SYSTEM_DHCP="eth0"
@@ -32,7 +34,9 @@ BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="BL31=bl31.bin ROCKCHIP_TPL=ddr.bin"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/uboot.fragment"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_DTC=y
+BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
