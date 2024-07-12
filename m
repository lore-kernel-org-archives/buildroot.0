Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8ACC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 18:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7361D6138C;
	Fri, 12 Jul 2024 18:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFbTVA7evGWB; Fri, 12 Jul 2024 18:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7031F613D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7031F613D1;
	Fri, 12 Jul 2024 18:27:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 025F21BF4D5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFE9240FF2
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46r4NZnnKcfQ for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 18:27:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28F0D40003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28F0D40003
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28F0D40003
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 18:27:24 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4266ea6a412so15893785e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 11:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720808843; x=1721413643;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=87FMUre/ps9GrgPkn9t8YAFZ+JenYn/ZiEESYoYEVM0=;
 b=vhxJQOf1UxII5nNzY+4NEw9d4uCvzFB+F0iaULfhJ1rJOj6Xoh2+ry9mIeHtFCR90G
 ZOup9p1wkTg6irp7qwVAuF1iS1FiW3AOGKBOSndec3pll7EPU3ipLAjXtSUmXZ6FN7dz
 3wEGPBfgr96EHNYFzyMW6XzYL2NCrVa4mV/UR0iexRjNyIVBDiZptaK4RfSs1P0O4G0z
 0CAxnNw3LWIXRZl/B6OZ0TLCIJA/1XjDRpJtMzW1VyCRVNkt7jzEA/wXTogvl5PB0J+b
 iWEP23/bHRk+9DOGIl/CWy6dcjzWFzm/kK+4N0YsEQOLiWf7HcvFRd3KxPP0/0CZnVsB
 nqJQ==
X-Gm-Message-State: AOJu0YxmgIqqSQgDtsoDtaZBJ48CYnPtVXSMEjdOamUB7fFZxpfruXUN
 1KpbLIWlzDiXPnFdGxSZd1IMX7hTKB38FkH2Z8ypVhqXL4lR1JzSpbrFJw==
X-Google-Smtp-Source: AGHT+IHP4qKer/xljoXcHw7JTO8oqrQHCeUnV39aQhtnGWzh9kX6CeC3tAqvy1lKeOd8rfYrBnC6eg==
X-Received: by 2002:a05:600c:2e16:b0:426:59aa:e2fe with SMTP id
 5b1f17b1804b1-426707d7c94mr80254735e9.19.1720808842786; 
 Fri, 12 Jul 2024 11:27:22 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2ba752sm30610715e9.38.2024.07.12.11.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 11:27:22 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 20:27:12 +0200
Message-ID: <20240712182712.216799-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720808843; x=1721413643; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=87FMUre/ps9GrgPkn9t8YAFZ+JenYn/ZiEESYoYEVM0=;
 b=RNZsfceW2UDzSqDbMiyxO6AWFs0a7H7egst25dH7Zj7PMs4P0uWYlC0kJ6wGAMVLpd
 cSeE8AlOywZBXQaMwd3a6EbGXcRozZs+eE5ssTKamS+vjCbCB93ZKH2t71mYFBpPDJ1f
 yVFyNs7i2R1AjWM2DrdstBwbxJAuND10ctDg8jcflbmGfgv4KBjFRmAuiwIeICReEthT
 wotiIqkUMa7/v5Fd2zWxLV5qSzJmDiiN462AQiU+MDyolqv/7Tdl4HvrYZ8iYorcSVf0
 hbhq42IbneOHIMZ5PHlpHfwVZsjfR4ggGpXIQbbrbjbKVyz4yhMx4n6fsQf1KbsGnLhT
 AKBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RNZsfceW
Subject: [Buildroot] [PATCH 1/1] configs/stm32mp157c_dk2: bump Linux to 6.9
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
Cc: Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Base config on latest kernel version available.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 configs/stm32mp157c_dk2_defconfig | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index c48705b2fb..0e26042b90 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -1,31 +1,17 @@
-# Architecture
 BR2_arm=y
 BR2_cortex_a7=y
-
-# Linux headers same as kernel, a 5.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
-
-# System configuration
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
-
-# Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-dk2"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp157c-dk2"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-
-# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
-
-# Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
@@ -41,13 +27,11 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
-# BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-dk2"
-
-# Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
