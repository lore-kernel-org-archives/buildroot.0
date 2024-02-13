Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E97EC4829F
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F54A4029C;
	Tue, 13 Feb 2024 17:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pd2CHFejPoUS; Tue, 13 Feb 2024 17:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 877404022F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 877404022F;
	Tue, 13 Feb 2024 17:29:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4241BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4AE881AEF
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0733zQmWI92 for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 265F581AF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 265F581AF3
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 265F581AF3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:32 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4114e0a2978so13955215e9.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845310; x=1708450110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MgzjQpgXjid7vvMWq3NXWmdCxSizg3Gtuf/xqHzQKNU=;
 b=cQ1XSWlqSKh1otsIZnGqQa9tewXVyXY5pbLSoQq+suYbRM0j+GEwB2tXzN2LYfXG0N
 k8D2MpxtavV0fPAGxRQIPZ2EcWE3qZSY+eWxZUh+aoB6pFrlBtHWEnZC7zZnYLlU5VS7
 Rej78GSLDxVdn567twEO5ZT62N/vg5aHWWhWl/JMfrPFaq3j/vSk3iHdRF6qnSNV6jxL
 w6u4cc6dgPo7xFa81YPOEzXLXqOsYqG4FMUZv2Q8CQxYF5IERMkMjObA0QNATRjlofQF
 czb6Q7/UTtAqSFzT4eVHoI28YGkwDMni/XZaqCmAYRTHqqrgo1b/eVNcUvjpczCaEot0
 Ya1A==
X-Gm-Message-State: AOJu0YzRqTZ/XfLjpSCC7Iswu7zbt2oil7CmtI1do3uQg3bESr8GsOXM
 iB8ocscAZ9bCmclq8BNLZiPOsxLmpUc9tdWJmNcjoyvpx9nZuLlZIcVsgAyIm40HgvXvVrLhrYD
 +
X-Google-Smtp-Source: AGHT+IFRLM9ZLOcr2OW5lL6jS3o6RtryzghyaqG93/LFhWGeV/tpSgyowjJ04IBw/mTuMqaelVxomw==
X-Received: by 2002:a05:6000:4025:b0:33b:28d5:f770 with SMTP id
 cp37-20020a056000402500b0033b28d5f770mr9217394wrb.62.1707845310421; 
 Tue, 13 Feb 2024 09:28:30 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:30 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:16 +0100
Message-ID: <20240213172817.2872849-21-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845310; x=1708450110;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgzjQpgXjid7vvMWq3NXWmdCxSizg3Gtuf/xqHzQKNU=;
 b=kHcMqQeyIhdcn1V5ccuLT3xg5sd7M+lpng7pzC20kBwAT9Gxm+DY/B4g8Uirv2D2GQ
 7Rxm9AUDKpZ0NF/2lEp8lhKDBBwPIBI1tw2aRyrd19Ixw5+SpRJSE0eT8pZZyHXjZfKN
 QmXK3xK6XCqSvv4VIk+kOL2stco92r2dphbeDzRNvKtVBSdqSrrCSdQnV8AbTUL51RHr
 v5hNOM/X+jhaWTuiVZOpDkWhMP+fa5xDD7xet1JF8bRrJxcjoy7oJ+JkEwsOUICj8P/e
 5nFbmgptfn3tf/bxQNgJuifk1E+mhU4H/e/QmUmcFpe8612HCa+7/mMxjhOH12Ie9OEm
 sW6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=kHcMqQey
Subject: [Buildroot] [PATCH 20/21] configs/ti_am64x_sk_defconfig: update to
 uboot 2024.01 to use binman tool
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update u-boot for a53 and r5 core to 2024.01 and enable binman support
in order to remove BR2_TARGET_TI_K3_IMAGE_GEN.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/ti_am64x_sk_defconfig | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 097175bd8f..bcef16777e 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -16,24 +16,28 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
-BR2_TARGET_TI_K3_IMAGE_GEN=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
+BR2_TARGET_TI_K3_BOOT_FIRMWARE=y
+BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM64X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
+BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
