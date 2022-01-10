Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91763C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 19:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 313974021E;
	Mon, 10 Jan 2022 19:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rzjvdd8bQIeh; Mon, 10 Jan 2022 19:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B579401B1;
	Mon, 10 Jan 2022 19:51:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F8551BF488
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 19:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 076B580C1B
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 19:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4LOsgyRAjJV for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 19:51:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A89E80BFF
 for <buildroot@busybox.net>; Mon, 10 Jan 2022 19:51:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id l25so17982024wrb.13
 for <buildroot@busybox.net>; Mon, 10 Jan 2022 11:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=msFXK+3+jjGBPuZnB4rhU6wQM+pMztoP89aXzrr6uIo=;
 b=hfH35YXmaYUWIPYzx2ZEbvCosutFgQ0wsAewe/BH+IiU7UopGbHnmfAIZiMUM9aZNu
 RnPgOfi6Qc8Sj0CwXskh7v8cvFU0KOtzs7nI1HLIDaTZy3XI9zh3xsBJmtzQz2Q9OavJ
 WB/z4Xr/GB9HwzYWD5uMXAghivhpmUbZjD96JSvx85MaEQ5bWJNehODfhyKkarpoBapd
 bDl3YIp4zfjGW920gQ7SJu+uVLbeYjM9UsxaHozBluw0DsE4VKp4x6FAHhwBwMYHKp9S
 ReNcbgEoNlZvUDgDGpuT9fuUa8qSUL50ulhQxk2WyvtBVr3HiEE3Go449OiTBrJbdsPF
 AaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=msFXK+3+jjGBPuZnB4rhU6wQM+pMztoP89aXzrr6uIo=;
 b=wK/iy3XUWfV9K1BqrCPbxqwidWRTXhYcYeDI4xdP4Wiv05ExSJhw868tqS1xLdduaG
 0qn/BFLNkGHzoNLdGuKjgXTORaaci4E4WjYu0JgUlXgx9TJbPkWvfL5u957TQtnap3RS
 itPweqZCNHby4o5Ro8+8JH8ttHiw5yzC9xzXGo5YYUgzWj7afmHh0Y6+a1mCbYhqHK7I
 wUfjfe3GL7VtDboj3Qb5CCpkaWrPCPjNrbYg+9VH3EbYRjiCpFUiQ3DTydILW08Bu82x
 uCMTarJL925hT64hTSaa30Q5qa2/RGlQN/mtov9m3TxBQT/hTrCNrRuCMMr2OH9nRdFY
 32yg==
X-Gm-Message-State: AOAM530PBAzKBc/46oBCWDyiwS7h65JT3YKVehkSUGbHOEePPGpod9YE
 4+ETkC3CzdHBvdtWRpsx2IJAegHun3c=
X-Google-Smtp-Source: ABdhPJyQDmAVRyYsRheMCnTXVGA8Tb5boW41+8l9V8ue0gPq2O3Gqcqj7gAHjTl6vZWpGRlT5gvtyA==
X-Received: by 2002:a5d:5848:: with SMTP id i8mr970893wrf.398.1641844302460;
 Mon, 10 Jan 2022 11:51:42 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id v13sm7267130wmh.45.2022.01.10.11.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 11:51:42 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 10 Jan 2022 20:51:31 +0100
Message-Id: <20220110195131.78165-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/mx6cubox: bump Linux and U-Boot versions
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/mx6cubox_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index e80d99552..6ea4f6e41 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -6,8 +6,8 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 
 # Toolchain
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # System configuration
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -17,7 +17,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.70"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-cubox-i imx6dl-cubox-i-emmc-som-v15 imx6dl-cubox-i-som-v15 imx6dl-hummingboard imx6dl-hummingboard-emmc-som-v15 imx6dl-hummingboard-som-v15 imx6q-cubox-i imx6q-cubox-i-emmc-som-v15 imx6q-cubox-i-som-v15 imx6q-hummingboard imx6q-hummingboard-emmc-som-v15 imx6q-hummingboard-som-v15"
@@ -32,7 +32,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6cuboxi"
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
