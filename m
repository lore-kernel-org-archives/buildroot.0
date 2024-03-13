Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83509C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 16:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D301560BFD;
	Wed, 13 Mar 2024 16:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BT6_zhFPiPKb; Wed, 13 Mar 2024 16:19:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9D3C60AFD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9D3C60AFD;
	Wed, 13 Mar 2024 16:19:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D607E1BF239
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 16:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE72C402BB
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 16:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OxQm6agF0bwd for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 16:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8419A40266
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8419A40266
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8419A40266
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 16:19:46 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1dd6dbcc622so16796765ad.1
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 09:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710346785; x=1710951585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G7gXkOop8zRRANta245JfbRsWvAWyvBE2w9mMLofWiM=;
 b=cBBC9jslEkaIdxdZtqh4pAgvSwktH3AiIgTI9nfHemJm79fAr+td8Rw/CPdZvT5OdO
 F4a+qNuSFI2Eb/ZfcA4hwiHPAIdc4r8xylu7HQaJAbPBI2bJH6FSfc24DAS0jfrfiI8W
 z92zh8s+/NUoWsTtUHe3fOJgkrV029rteKHjLnwkE3Q6F3FQg262dOLCxvRtWtrI6Y+d
 eJBv/ktVS/4iplYnj3rPLiHCpWmYSzpMXQEDo4mrdCIrsNX158sLb8k5SUZD+RL0Gmkr
 CAr00GchiZ5KHjJuuqgn4Jm8u/QwbAyYY+4hbCITRDaC2VeRF4Ec4zYh2LN4Z/XBoOOK
 huYA==
X-Gm-Message-State: AOJu0Yz/jAgw2hAjZ/72FsGQ0ECaylTjbNhgW20oO3PkuiLDYXl7rklO
 cIADAnN239i1cpBMzlmRjI0Mi3su4DTFQkYbhMOzw3nOe9wN2dZwF1K9W5m+
X-Google-Smtp-Source: AGHT+IHE9FIYegUdWq915YMs4SgS0puQDwwzjJSNyM9iqIKY0+W9e1uQ3Kt0EnOTXVfEh+c0DjqhSQ==
X-Received: by 2002:a17:902:bb8c:b0:1dc:df03:ad86 with SMTP id
 m12-20020a170902bb8c00b001dcdf03ad86mr14568546pls.2.1710346785396; 
 Wed, 13 Mar 2024 09:19:45 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8d95:edda:2db4:e65])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a170902c75500b001dc96b19616sm8923259plq.66.2024.03.13.09.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 09:19:44 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Mar 2024 13:19:39 -0300
Message-Id: <20240313161939.3295928-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710346785; x=1710951585; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G7gXkOop8zRRANta245JfbRsWvAWyvBE2w9mMLofWiM=;
 b=gsFDK/KpXk+v/FL80N+A7sTmvRk2xy/drUabIvk2KtmpGvwXGWr1/9xBPeblp497o4
 9lXz/cM2tX+lEXjVA8j4j/bGftdYvMy4N8vkLHB23ZyZC2zgfN6Jbj2rpes+QwSnuoyy
 INvGlhM8QA19ifa4K35zfm4UUNO8I+oYMXy9HP7B8jmz4XqO4WJp49CiKOS94eq6yUt3
 pqh47A9NH6IEe7kdYAdQrOJx9wHlfLeoBRAWinLLDAZ27VPyjxmj/B8BOEdJKGcCbEVD
 tF1g5aMeG+swY3PtfXztpZ1qxv5kswCpOCpPKjeMVPJbQ4HN9HmuGTZ7qTL8ERQxBWZ8
 5Tqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gsFDK/Kp
Subject: [Buildroot] [PATCH] configs/imx7d-sdb: bump the kernel version
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the kernel version to 6.6.21.

Also pass the nxp/imx/ path due to the devicetree reorganization
in kernel 6.6.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx7d-sdb_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
index cf4da342c150..e7f3df81568a 100644
--- a/configs/imx7d-sdb_defconfig
+++ b/configs/imx7d-sdb_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -12,10 +12,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.34"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.21"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7d-sdb"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
