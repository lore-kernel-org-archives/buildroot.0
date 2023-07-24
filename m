Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A3CC001DF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 19:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5C5B41868;
	Mon, 24 Jul 2023 19:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5C5B41868
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJ4LdG4j5cCF; Mon, 24 Jul 2023 19:17:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA4F41855;
	Mon, 24 Jul 2023 19:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BA4F41855
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4EE21BF3C3
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE221404B9
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE221404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bAkWsN5ZhA9Z for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 19:16:46 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B71B64016B
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 19:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B71B64016B
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbca8935bfso38269775e9.3
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 12:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690226203; x=1690831003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BZCIIhN0oam1x/2AxobvHxWCvi0CUWQZrhJ0SYbw03k=;
 b=k80ORbfZsfODidTswJm0YzTb0ik0fUDP8Ctz0AkmKlSKewoTEgdMrp2SdMQ++bWRYJ
 OVnwcWxbRv1lGY86vgShN9WHRUjXfrSqwIOXh3M0Bjcl5A4eILh1AQTru93IB7uepAQu
 C0+BNnYhROIN1iijuzNBKz4oUfVNrA+gS+ABEpdvrPDY7co5nXG7DdEC5FFw53RVrBXA
 t2ACdBjoRKR0D8ScfjX60whmIAa7pZwxaq9rmV33e1dnzQ2wd6Zp/WyqOiI/P+fOLnly
 f0OuB+Prdvfzs30KN9gecAhVHtcieGTgKjxpmTcQ1A8JtSlDcyvw4NFjhOrPrX/rawLV
 eRYg==
X-Gm-Message-State: ABy/qLbJv4mHGyiNMnRjekfg9lrqDNGMquN9ipqDVaR8Dk5vqAcj3Iq+
 SAFhNy9Oo6q9ugk6dKYfopBzxvayI/rdxA==
X-Google-Smtp-Source: APBJJlGq2qllur8zxT1cELWTtCKoXXE7PdVZtVdHhH771p1PnxW6i0tTLi9r7Qel+FLQFnechcdQMA==
X-Received: by 2002:a05:600c:204:b0:3fb:8284:35b0 with SMTP id
 4-20020a05600c020400b003fb828435b0mr7470972wmi.30.1690226203119; 
 Mon, 24 Jul 2023 12:16:43 -0700 (PDT)
Received: from effi.fritz.box
 (p200300d197289500922b34fffe35b24f.dip0.t-ipconnect.de.
 [2003:d1:9728:9500:922b:34ff:fe35:b24f])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c214400b003fa973e6612sm13652513wml.44.2023.07.24.12.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 12:16:42 -0700 (PDT)
From: stefan.nickl@gmail.com
X-Google-Original-From: Stefan.Nickl@gmail.com
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 21:16:37 +0200
Message-ID: <20230724191638.637054-5-Stefan.Nickl@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
References: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690226203; x=1690831003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZCIIhN0oam1x/2AxobvHxWCvi0CUWQZrhJ0SYbw03k=;
 b=mS8mQLuxdQmIr1/ml7WN1puIOk3dOvxtPCbNbv/o9zdj27aU9pLsCtqcz66lU0OY2x
 g0uv39QZk+IUpe9dc4O8OPHGaEpax4WjagieXqzHlhWzVp5oaZr7QOnZC1XN3CmJqvFw
 qg5fZukBWmAOrZKrh8pdo5yNFlxMRYcgZtXONYgkIip7UH47m+TEAJdCwHReMaiaqBXz
 YJBppZJUq6BcBY1hkIAnZtbNseJLYjBVi4rw9t2+u+m0jITFGhElWRMrzRujJcNE5wBR
 mqaVHlJcixdf8UQaTuJAYB2UbtdfpSvOMOrh7WycNPsEaRDi9ksW/x0HsXmtLu7zmHDo
 oo/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=mS8mQLux
Subject: [Buildroot] [PATCH v2 4/5] configs/freescale_imx8dxlevk: new
 defconfig
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Maeva Manuel <maeva.manuel@oss.nxp.com>, Charles Hardin <ckhardin@gmail.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Nickl <Stefan.Nickl@gmail.com>

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
---
 board/freescale/imx8dxlevk/readme.txt  | 69 ++++++++++++++++++++++++++
 configs/freescale_imx8dxlevk_defconfig | 39 +++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 board/freescale/imx8dxlevk/readme.txt
 create mode 100644 configs/freescale_imx8dxlevk_defconfig

diff --git a/board/freescale/imx8dxlevk/readme.txt b/board/freescale/imx8dxlevk/readme.txt
new file mode 100644
index 00000000..33ceb669
--- /dev/null
+++ b/board/freescale/imx8dxlevk/readme.txt
@@ -0,0 +1,69 @@
+******************************
+Freescale i.MX8DXL WEVK board
+******************************
+
+This file documents the Buildroot support for the Freescale i.MX8DXL WEVK
+board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX8DXL WEVK board:
+
+  make freescale_imx8dxlevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - ahab-container.img
+  - bl31.bin
+  - boot.vfat
+  - Image
+  - imx8-boot-sd.bin
+  - imx8dxl-evk.dtb
+  - mkimg.commit
+  - mx8dxl-ddr3-evk-scfw-tcm.bin
+  - mx8dxl-evk-scfw-tcm.bin
+  - mx8dxl-phantom-mek-scfw-tcm.bin
+  - mx8dxl-val-scfw-tcm.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot-atf.bin
+  - u-boot.bin
+  - u-boot-hash.bin
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template_imx8.
+
+Boot the i.MX8DXL WEVK board
+============================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the boot switch as follows:
+SW1:	ON	ON	OFF	OFF
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/freescale_imx8dxlevk_defconfig b/configs/freescale_imx8dxlevk_defconfig
new file mode 100644
index 00000000..bf59e644
--- /dev/null
+++ b/configs/freescale_imx8dxlevk_defconfig
@@ -0,0 +1,39 @@
+BR2_aarch64=y
+BR2_cortex_a35=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8dxl-evk.dtb"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.22-2.0.0)/linux-imx-lf-6.1.22-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8dxl-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_IMX_SC_FIRMWARE=y
+BR2_PACKAGE_IMX_SECO=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.22-2.0.0)/imx-atf-lf-6.1.22-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8dxl"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.22-2.0.0)/uboot-imx-lf-6.1.22-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8dxl_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
