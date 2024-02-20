Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D36BC48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 05:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 523AA408CA;
	Tue, 20 Feb 2024 05:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6AGKcRyc2F4f; Tue, 20 Feb 2024 05:20:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CD1C40AB0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CD1C40AB0;
	Tue, 20 Feb 2024 05:20:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 77B4B1BF3DE
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 05:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B81F40AB0
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 05:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z76zqRN3PALo for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 05:20:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=jan.kraval@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F68B408CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F68B408CA
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F68B408CA
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 05:20:00 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d220ad10b3so39539211fa.1
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 21:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708406398; x=1709011198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXICMOGZqIgPUNMYcCyh/TuJD9AZQmreW3WMny/U8wg=;
 b=UKYMzOEv+46hgMnCQ7WaHlhXKuoDlv9kgji1Tmmg59zkNmX/BxIOYGUO1o4/2MxXeQ
 meD39u2UUAh1B6ecsGLmR0sPZaXumoXVLnoc3+Q2GlUoxSzZmhq6hS6a3yNyLaOvx5zU
 mQnVrNUNjSEVrFEuHTeoHmly1JlMqYCsjgCrcXt5FDf1HOb4EHBR0vZ9BC4Vq0hHCf0T
 bKTEoWFsx/g6DGcHdAFC7soh/CVhok1FsgkWxIqyoggFI9F7US6IKRXB5VolbM39ljot
 XMvvd1iYK5knLIfnsG6VFhf/MAW8SJ9oATImAQTejTJdWZgY7G9fzYP8URlZ3gjs/bDM
 ox7A==
X-Gm-Message-State: AOJu0Ywa7snlrMcecO0eAsIdoucwaFSUQ581PudRQ6bEWbU2ICpOXoUm
 jDxpnyPTiUNxw78E2hx0+UoFbtCyAJK9JoQTWD5WPnJK+nar5+45S2/WAMBv
X-Google-Smtp-Source: AGHT+IEioYI1PblUF4F8uPpoD//uGYgwyiCaetcheLFX1SEWljShlIZPdimdX6MDn7ApfM4uIEN7Lg==
X-Received: by 2002:a2e:a9a2:0:b0:2d0:e35a:3bab with SMTP id
 x34-20020a2ea9a2000000b002d0e35a3babmr11255718ljq.48.1708406397839; 
 Mon, 19 Feb 2024 21:19:57 -0800 (PST)
Received: from envy.example.org (ip-89-102-235-73.bb.vodafone.cz.
 [89.102.235.73]) by smtp.gmail.com with ESMTPSA id
 ay23-20020a05600c1e1700b004125ff0b572sm8431289wmb.8.2024.02.19.21.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 21:19:57 -0800 (PST)
From: Jan Kraval <jan.kraval@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 06:19:26 +0100
Message-Id: <20240220051926.68559-2-jan.kraval@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220051926.68559-1-jan.kraval@gmail.com>
References: <20240220051926.68559-1-jan.kraval@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708406398; x=1709011198; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXICMOGZqIgPUNMYcCyh/TuJD9AZQmreW3WMny/U8wg=;
 b=iZHvk+nW6uF5OUNb6N2P9F0u6CamfYqo/cC3JGL/GN+RLm6IxJMHpnfUWkRsjb4DWk
 z/fLbzGAlwaVwYFzeJnavrcXHDla8IJFg7I6BfnzcBP7FD2vLCDsqXn81WhnechAbmQn
 KbV1X7trYFXJ/lc307g/6q4Bz9AYUmNbph/mX1Se6Z8RAC5dyYSn8H5eXz3bze/pIF4a
 Z0Pk3OcVKbFu/h5JTrmnnJ6ctWrAgmp532Qq9Er3Scu51r3rutmNEdwAfw/dgsr0EMIS
 DYQmX5nuHnAalY1OuB8gzlDGA7/bN/5zKhLmQh2swvT/cIaDSX76zKJHNYTOlWe63avl
 6eiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iZHvk+nW
Subject: [Buildroot] [PATCH 2/2] configs/orangepi_lite: bump kernel and
 u-boot versions
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
Cc: Jan Kraval <jan.kraval@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

    Bump Linux to 6.6 and U-Boot to 2024.01.

Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
---
 configs/orangepi_lite_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index eff5af938b..1bb1bf3ad1 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Lite"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Lite"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
@@ -9,11 +9,11 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.16"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-lite/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-lite"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-orangepi-lite"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_RTL8189FS=y
@@ -26,7 +26,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_lite"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
