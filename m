Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C27D26D8E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 18:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6474740C36;
	Fri,  9 Jan 2026 18:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPes0uQnAQvI; Fri,  9 Jan 2026 18:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96FAF40C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767983437;
	bh=H3CJlKebpLS8kYrnceW9w0xwbA7q9jC+7jc6PwkgdWw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ay1wIPgj/jpaVckJlnLsXL21yF9tBTEukVpfGo2AUdf0tCt83dDU9uosO+E2nUK/J
	 xX0cAk7NpiqjfOzRiTCN+fPL9ke0IXYXG0AtHGQcWFA6xqGLvFQB2kzd+T73GIOTw/
	 JmuVsGPI8Fkr73A8eItqAJIPH25S+ewqNnbRgP6e3cB8cOxQXmNil9slCkmJBlArbL
	 gOVMJE233OFVBmsGdfc5pgQ3FzQuv0lMzcx2KCkWZE5WOB8rXKeLfLCedK7wIMKEmU
	 EDJyqqxGeVcSWkk2vvLpDnZA7kZXxzuC0dj1bYwDWjz/fK+pEbbYGkLdr5Jf7Hp6vY
	 BH/D2Z5/sUWig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96FAF40C39;
	Fri,  9 Jan 2026 18:30:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40B3D278
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32E4360E94
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2W1Ov8culTW1 for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 18:30:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47767606AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47767606AF
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47767606AF
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 18:30:35 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-64d4d8b3ad7so7327992a12.2
 for <buildroot@buildroot.org>; Fri, 09 Jan 2026 10:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767983433; x=1768588233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LqzVKzOvzUtAi52L7xXF01JN4C3W88WjvGk7b6jMtIM=;
 b=fAd4KNeytr6j49CqCPrGQ7v8ZPWg0Vk5/hyYh+nhr3yls0HfxayXmgN8qVAzxCHnEB
 ch3BXZJwuvNiUVEHg//o7lwK5cu5oDntoCZMgN69VdqFUV+wKCnx1NegAIHb8KHTr6L7
 X3vtI2xfUvx+aBW1PL4LHnlEIV9zFm8f5tHSxexWNJVCgmnOHlWMyUGYMGpzV+YJthXJ
 CQ/0f8fKoxgZqk9SA9Qch0JRRKaksakkJVKYpC+f+fxJG6615RryfIqhZRJBkOCKiM6X
 V25Be7lGpBl2SXtl2f40Ss/cS4jcBc6yLyYZIq0gJfGPthAzlnybifXThyLS1zJzOlY0
 rDMA==
X-Gm-Message-State: AOJu0Yz3DNA7oGlZh5Sq8Dq961qDroDYTE41g2YN+UVn+wa23mBoa2w4
 y/ZWWMOtaJyxovz4g3FNE+k8ilaWEzkoQNqexAWixlc6PSM8XAiQ7Xrl5jwaFOX1oUOyFuRVbCI
 5RqTC
X-Gm-Gg: AY/fxX6l8V8FcGLP9J8CAe9sj5VPq2ADSjCDCH+TcX7nNNPF7XhRlOt6XbLo77jIi53
 c3YOA2sLy2vpuX3JPhTZOgArGKDAcoktzP60SLS7FqPFSUcCaSIG5Ijrrz8Pd7TR9paGzo+z8O0
 2grcb2YdCFrHl5lqVVD327GILNm5aSo7Oh49+VYi+nQa2qHiKLuBGXznQEpyiBVgNQ3Gj1f7qo6
 W8ibFjwpKyCfG138eQas6WKnykUvtu71sgbW/R9qxhl6lfmh5yYdw3BLI7SW3C5xDjUMrIn9gNm
 +Wd01qsyL45ULPKY3Kup7h6nkAkO2uXWa/5LV8imeGuyBp7umvZPKKTuWMNnD563+/JbqM0kBC/
 9ALEkZiEknScBV82iTr3GMwgEwx+Uk5jPqDYG9yH44LhEkz9IZI9YecExGKJ/IP91iKxQsDnh2H
 nKfu8I6V5yV/78CE7JMseY/ePWxgFKDPvDOdjTl80jXLkdE5/8yaJhFKWOkPpaGuDcSwKgsr30a
 ZZv7UbAX7Br++DqDRYPBCIbudwYCfFBDDFEB51WDvU=
X-Google-Smtp-Source: AGHT+IEh6w+rpx13P1oisrzELpcjUmorVyeRtpRYD/Fda3JlcEJfeA2TEA4ZQx5ZDLXBYIL5eFBCUg==
X-Received: by 2002:a17:907:2d0e:b0:b84:200d:15b7 with SMTP id
 a640c23a62f3a-b84453385c0mr1123093966b.39.1767983431997; 
 Fri, 09 Jan 2026 10:30:31 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.40.2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4cfe76sm1173515766b.40.2026.01.09.10.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 10:30:31 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jan 2026 19:30:26 +0100
Message-ID: <20260109183026.535792-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767983433; x=1768588233;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LqzVKzOvzUtAi52L7xXF01JN4C3W88WjvGk7b6jMtIM=;
 b=AyO29sw/+vL0X+0GlaCKBYG8Yjct2qTfNz1f+6PxtnepjL3MCPjCyMUerTPQN3Dn+5
 3pVvoV9nZ2WUh9IEfrbPW4QYContZFN83qaBXvWN1hW1x3djgVOEypWVM0/vHX0Gur9S
 zxENO/3beam7KjK2LCUIT/3vojcw3l1rLlq8U=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=AyO29sw/
Subject: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux to
 5.15.197 and U-Boot to 2026.01
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.197 and U-Boot to
version 2026.01.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f746-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f746-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f746_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
index 27549bda9349..50c6664f950c 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  348d6faada05fd4684450cd7c4e666c3c98cdb96f2309b1520c9a92a378c267e  linux-5.15.194.tar.xz
+sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
index 98a5c53aaf97..b6a925ea4e89 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
index cd2123b992ca..027ecc0f4b3f 100644
--- a/configs/stm32f746_disco_sd_defconfig
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.194"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.197"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
