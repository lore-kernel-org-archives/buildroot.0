Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E6AEB64DD
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 06:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB3C0408E9;
	Wed,  5 Jul 2023 06:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB3C0408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ty3FC8NhHlVO; Wed,  5 Jul 2023 06:22:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C33E4173C;
	Wed,  5 Jul 2023 06:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C33E4173C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD431BF842
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 06:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58F4B60769
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 06:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58F4B60769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_LzIFs4jugS for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 06:22:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3803160706
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3803160706
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 06:22:15 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id 8195DA037B;
 Wed,  5 Jul 2023 08:22:13 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix03.mail.de (Postfix) with ESMTP id 648A280283;
 Wed,  5 Jul 2023 08:22:13 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id F3B95C00A9;
 Wed,  5 Jul 2023 08:22:12 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  5 Jul 2023 08:21:42 +0200
Message-Id: <20230705062142.10968-3-kilian.zinnecker@mail.de>
In-Reply-To: <c30c93e29177a1dc15446eff427c7ca8@umbiko.net>
References: <c30c93e29177a1dc15446eff427c7ca8@umbiko.net>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 4798
X-purgate-ID: 154282::1688538133-9F7E8C09-A890281B/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688538133;
 bh=EiTqtmuiV0KP8xk2mXGts5+AsZ5sbz9dqeBN5PbwY3U=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=BSVrT8ESokmbTjLEHASyokR1NnGHooxJ3TRrx1p21B5vcqTC2AMeMEXCXrgKdPlUt
 G4w42DYPQDQOvcKrSFkn0VkzjBxqT1+A2CbDaDkZSKxVY1E0hXHXvlZqUPuBL7Knnk
 Tepb/XQaz3Aca9YlZT1vjeJ3EHni4qLhnVoIt9q7TCAIJmemuhH+grm9J2DA+9NkuE
 reGaqu08X/HQwbyKoG+snxe7Qx2ah84hXkqXC1pDrzESiAjYds5uN6UNmnldLXweBH
 PxiajZ9nOR9JRE8e+zEZNUr8dL937+RlKUa/1DfNCwCo7F+EbBTRoeCS4YK7ffy/sf
 U/o7NqMN31xVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=BSVrT8ES
Subject: [Buildroot] [PATCH v3 3/3] board/radxa/rock5b: Add sdcard image
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds post image scripts for the Radxa Rock 5B. They
generate an sdcard.img file, which can be flashed on an SD card to
boot the board.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 board/radxa/rock5b/genimage.cfg   | 36 ++++++++++++++++++++++++
 board/radxa/rock5b/post-image.sh  | 24 ++++++++++++++++
 board/radxa/rock5b/rock5b.its     | 46 +++++++++++++++++++++++++++++++
 board/radxa/rock5b/uboot.fragment |  3 ++
 configs/rock5b_defconfig          |  5 ++++
 5 files changed, 114 insertions(+)
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
index 0000000000..a9dce56d31
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
+cp ${BUILD_DIR}/uboot-2023.07-rc4/u-boot-rockchip.bin ${BINARIES_DIR}/
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
index 8107bbd0a6..fb8ecf07e2 100644
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
@@ -31,7 +33,10 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="BL31=bl31.bin ROCKCHIP_TPL=ddr.bin"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/uboot.fragment"
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
