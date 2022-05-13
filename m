Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA27AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 07:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C6E060B3C;
	Fri, 13 May 2022 07:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSFQLgWpYn3i; Fri, 13 May 2022 07:16:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AD7060B25;
	Fri, 13 May 2022 07:16:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB6C41BF357
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7BFB60B25
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUN6fHT-oOU5 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 07:15:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E002C60AEE
 for <buildroot@buildroot.org>; Fri, 13 May 2022 07:15:39 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id k27so8891923edk.4
 for <buildroot@buildroot.org>; Fri, 13 May 2022 00:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/8QQfDgCzz+kYPzNruXPc+FPDvNMU5Of0EuBr/lElFM=;
 b=LFAAv/5ruTsMetCOwW38HMovDgM1LSz2xMcZiiP5hd+ZhSwvaJomGa2bSU/Hibw/Tt
 DtB3tWO0R+2094QDjp/ccybkqLBHk0CbOBC/Ropc0lNbh8R6TXNJPImMMoS10lzRrodv
 OFqsUi/zDg1kBVYm3oD5o6zpIRCqZuQ+jtWVqru6BFZhzOzNW/TCFPKCokwbKK9S0kDh
 azsVG2xZs4D17f8bs2CF5pf1LfWV3KzI0jXSZ8NfG0FPwO85soaOH4F38IitNkIZyH7d
 xS2BhoT0Nb+1vt7GwX4ffyUgLyPsdgU8WqgSZePqds4fYR6lHkSoA0/SqFFd+SehVLMT
 Th6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/8QQfDgCzz+kYPzNruXPc+FPDvNMU5Of0EuBr/lElFM=;
 b=2PmnZ7aTb9pKElZMrb4D/VlJw3/it6yJerfPNL7BcEHf8/vlEJXoH8jbsOvjBgK4mk
 IH5qriamwklvoYdc5a73uC6PSfEXd3XA/Hwb9mcKfBtLac3N4LF1FsoII8mFe3mlGofG
 30BD3w5h11Q08iqOkbev8tprkG9nKh4Jm8cKgmf0O/ZW2Qyfvh7PihLSMIRaIfrvHMa4
 zt1HxBa90vq2/6y9Q40L2bIAJL//dVy8rV/Xt+Ise8hE/9/BVpwjeTK5E3gLUXRqqPAk
 mxARmSRtkyBybnZl5+VLwnjYZaxqUTUQxGS5LKmlAdtXldh//ivWUTWYDGuP7wUmEBZs
 Kwvg==
X-Gm-Message-State: AOAM530ZiSMYHelSg7JDTOVRUO/TJoqKOly88vWf8fhYfr/Vnc6wVMko
 70P1EGx/eXFYyuBxPrtwOpmCYgM8RH7uJQ==
X-Google-Smtp-Source: ABdhPJyt1qR6c+H7snCXyDf912aY4PmuLk31jxH2svAoWfAgHf4nvbNMgvH9mcbSuD3oBA/VrhtmLA==
X-Received: by 2002:a05:6402:35d3:b0:427:b3c7:f7f2 with SMTP id
 z19-20020a05640235d300b00427b3c7f7f2mr39211279edc.152.1652426137896; 
 Fri, 13 May 2022 00:15:37 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 d27-20020a056402517b00b0042a2ccdd2b8sm577065ede.70.2022.05.13.00.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 00:15:37 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 09:15:24 +0200
Message-Id: <20220513071522.19853-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220513071522.19853-1-heiko.thiery@gmail.com>
References: <20220513071522.19853-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/kontron_pitx_imx8m: switch to upstream
 U-Boot
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch U-Boot from vendor downstream version to upstream. Since the
upstream U-Boot uses binman to build the bootable binary (flash.bin) the
need for the iMX specifc prepare script is no longer required.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 board/kontron/pitx-imx8m/genimage.cfg  |  2 +-
 board/kontron/pitx-imx8m/post-image.sh |  3 ---
 configs/kontron_pitx_imx8m_defconfig   | 20 +++++++++++++-------
 3 files changed, 14 insertions(+), 11 deletions(-)
 delete mode 100755 board/kontron/pitx-imx8m/post-image.sh

diff --git a/board/kontron/pitx-imx8m/genimage.cfg b/board/kontron/pitx-imx8m/genimage.cfg
index 4a0aa117fb..bc100b171d 100644
--- a/board/kontron/pitx-imx8m/genimage.cfg
+++ b/board/kontron/pitx-imx8m/genimage.cfg
@@ -5,7 +5,7 @@ image sdcard.img {
 
 	partition imx-boot {
 		in-partition-table = "no"
-		image = "imx8-boot-sd.bin"
+		image = "flash.bin"
 		offset = 33K
 	}
 
diff --git a/board/kontron/pitx-imx8m/post-image.sh b/board/kontron/pitx-imx8m/post-image.sh
deleted file mode 100755
index 3452fd4501..0000000000
--- a/board/kontron/pitx-imx8m/post-image.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-support/scripts/genimage.sh -c ${BINARIES_DIR}/genimage.cfg
diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
index 8f756f5246..161b9cfe3b 100644
--- a/configs/kontron_pitx_imx8m_defconfig
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -3,9 +3,9 @@ BR2_aarch64=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/kontron/pitx-imx8m/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/kontron/pitx-imx8m/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/pitx-imx8mq.dtb"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/pitx-imx8m/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -37,12 +37,18 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://gitlab.kontron.com/imx/u-boot-imx/-/archive/PITX-IMX8M-R12/u-boot-imx-PITX-IMX8M-R12.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pitx-imx8m"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_pitx_imx8m"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
+BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
 BR2_TARGET_UBOOT_SPL=y
 
 # Required host tools to create the SD/eMMC image
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
