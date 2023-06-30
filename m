Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F72EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 30 Jun 2023 21:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6D7741F48;
	Fri, 30 Jun 2023 21:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6D7741F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kRHZQxyDhJHc; Fri, 30 Jun 2023 21:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50F8841F63;
	Fri, 30 Jun 2023 21:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50F8841F63
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D42B1BF844
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 21:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55A09417B2
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 21:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55A09417B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5I220jei4n_0 for <buildroot@lists.busybox.net>;
 Fri, 30 Jun 2023 21:27:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B9F241F48
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B9F241F48
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 21:27:10 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 814EDA0398
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 23:27:08 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 676A4A03C2;
 Fri, 30 Jun 2023 23:27:08 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id 254F2C002F;
 Fri, 30 Jun 2023 23:27:08 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 30 Jun 2023 23:26:54 +0200
Message-Id: <20230630212654.699657-3-kilian.zinnecker@mail.de>
In-Reply-To: <20230630212654.699657-1-kilian.zinnecker@mail.de>
References: <20230630212654.699657-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 4700
X-purgate-ID: 154282::1688160428-FFFFBC09-64660D85/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688160428;
 bh=LbM1HiRawv2ur2aiykrKkLUuaEfT+dipmzhwWK84nzo=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=7BGtdpuw6ihrUX6fuBBTnRXEAVp6dnDnFlp6TwKaugw9iGg6QY5Iay0WsidnNRllh
 ZG07EiAYaPtsepXgFluGXYC3jL7L2XL/YJsaIaOmQd/yL7JAllCzbQc9lRt9NXmsEH
 0bdaqjYeqoNmIxJ3m1h1kauUeXGiiA2U35uPzcAKGv8NsAJNJidnv71Gdfm9LNZF9L
 Qv1Zwh9pdh8iCZ4tK3FU31PySwArmZiGgjgMEGI7DeR2SRbry9HwpQ1k3gWiytl77k
 lwaQDsN4KgrqSgnef64MnXXZgIhWKq8zeKtPOIn9u3jG16Ynq0QzSuhpGN9JQZ8LfN
 SfGK9KgDOKT0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=7BGtdpuw
Subject: [Buildroot] [PATCH 3/3] board/radxa/rock5b: Add sdcard image scripts
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds post image scripts, generating an sdcard.img file,
which can be flashed on an SD card to boot the Radxa Rock 5B.
---
 board/radxa/rock5b/genimage.cfg   | 36 ++++++++++++++++++++++++
 board/radxa/rock5b/post-image.sh  | 24 ++++++++++++++++
 board/radxa/rock5b/rock5b.its     | 46 +++++++++++++++++++++++++++++++
 board/radxa/rock5b/uboot.fragment |  3 ++
 configs/rock5b_defconfig          |  3 ++
 5 files changed, 112 insertions(+)
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
index 157d81b163..3c814bf356 100644
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
@@ -30,6 +32,7 @@ BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="BL31=$(BINARIES_DIR)/rk3588_bl31_v1.38.elf ROCKCHIP_TPL=$(BINARIES_DIR)/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/uboot.fragment"
 BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_DTC=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
