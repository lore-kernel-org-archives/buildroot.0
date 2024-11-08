Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D4CD5C0C0
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 12:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D14B66120D;
	Fri,  8 Nov 2024 12:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 775r6C7IrIJ3; Fri,  8 Nov 2024 12:10:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E45A96120F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E45A96120F;
	Fri,  8 Nov 2024 12:10:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60FC4C0
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 12:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40BE94316F
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 12:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuikh2fR2JlP for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 12:10:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7155B4316D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7155B4316D
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7155B4316D
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 12:10:15 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-20c767a9c50so21150985ad.1
 for <buildroot@buildroot.org>; Fri, 08 Nov 2024 04:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731067814; x=1731672614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SiWDClB98DSHe9erWkbF0By47t4NKFySP8q5+h2wTKc=;
 b=Q48uJ79kN0WaxxjSSJMOtJHxYCc+YbuovysGCtRM9bVcfPzyur4yYYiJ2Lm5Dc+lUP
 ATJnw5OdUFUamLKjzl+Hl+GYn3pYnx/BjU1JjPGcct0CcjDdPuGuP7Oz24kRFF09RASv
 hy0GafbxhPQPwKyQeDtYELcAvrZDa/Fy31VjZGLLGmEA4w21KdAuuomDj3LqqVHQS7i4
 oBEyEo5cJvRg8xyOy5jQ0wfCAj944h66NnoOjYETfLcI6X8V7BxNArwIwc0HPEFJnLwP
 HpcAizz8YtdLkeJQcW4UV1lm6JNr8sfgHnhLA9nz9n+NpeWHEPJjLPgcim/4gs/SD1xd
 3a/Q==
X-Gm-Message-State: AOJu0YyrvKPaN+gENZ2dK5K5ST4xaF4ecUBwM2ty4mzEXV0xvzkX3IJ7
 0s+qC4bNFDn/pI4WKynwwl8d4deYdOuxu+lNPC1KIDQ+RgE21uUri+PlXg==
X-Google-Smtp-Source: AGHT+IHmXWefvviMEFgOZHtarhm+bRDx2Rok/RNeQqUuDRLSA5/94vpFHw/QCnvQz+44YX7BXWUnvA==
X-Received: by 2002:a17:902:cf0b:b0:20c:6bff:fcae with SMTP id
 d9443c01a7336-21183c7e1bbmr24680565ad.5.1731067813597; 
 Fri, 08 Nov 2024 04:10:13 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e458bdsm28816705ad.133.2024.11.08.04.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 04:10:13 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Fri,  8 Nov 2024 20:09:33 +0800
Message-ID: <20241108120935.540508-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731067814; x=1731672614; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SiWDClB98DSHe9erWkbF0By47t4NKFySP8q5+h2wTKc=;
 b=M7BmwljKVAvw+xtxXpfT3Sj3gJTGDY+godTNCCk6Q+VU81TFap5ToVDpnPwdLZQJZl
 rTRwN4bHbbyO0HK+iXhozoU5CpqFAnENE3s/nO4kzp3gMDrOr2xsujhYS2b8flcg2CUD
 QnrOyzn6kNfTIGuFPuvfuyvYLtNzVpWhmvHpEVHDrES//hIIA1qMVGeIs8lbIk2FqfuW
 wmIDc4X1pjYQnBLOcENICutV/SM2ooF/5xiSCz5rTGPzLqnPcjX7yGRhboyXrzhQfgN6
 MGq62vjPMVyMYes2WGt+OYCiy77zoTQrDGt2siojXJXYRahsvk16vvNmWqaRnBqIu2Ac
 /eXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M7BmwljK
Subject: [Buildroot] [PATCH] configs/cubieboard1: Bump U-Boot to version
 2024.10 and kernel to 6.11.6.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 configs/cubieboard1_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index c2ced443ef..aeea988201 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard1/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/cubietech/cubieboard1/rootfs_overlay"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.6"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
