Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814EEC433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 17:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DED2E405AE;
	Wed,  2 Feb 2022 17:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k44jU27l6nb8; Wed,  2 Feb 2022 17:50:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD0D940938;
	Wed,  2 Feb 2022 17:50:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 407F51BF573
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 17:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BF14405AF
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 17:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dzJbfb_uBznV for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 17:49:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E91E405A7
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 17:49:58 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id x193so41234346oix.0
 for <buildroot@buildroot.org>; Wed, 02 Feb 2022 09:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+SYnQRupCR/wilupZ20yanHctJPH27JzNLHV2Ypy9Rc=;
 b=CX4tn6N8Mre2lEz8Y1pb2BdLk5kvHEZW/fR3P+oAcZNAmEAAtkKUxPDf+wz1ednHNj
 PxJAnk6QMD42ysWBjmPW2mW+HN0lvjsDFHHAKLFX0xi/UCg/K0T+HpvDMhxrKcAVL+0z
 3agllCNrbBpzaM4ymmoGJWty401/M+TmPW0WAfhUXCq3r/PZqjvjeKsdQH+7Pva6bCGA
 xZ0zjqHqJeHk+8IhB2nuYdCnSu+ueCyDsxoG8c2jimgrEQAVRYwe77XNtE0oIvyN0hgU
 ipj1svWp+Zlf652WfmShdpTHL2iopwysjhjem7Vm2JBhpGZnYepqFAVJ3mMMtAmqSy10
 qzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+SYnQRupCR/wilupZ20yanHctJPH27JzNLHV2Ypy9Rc=;
 b=QRxrcB6P+T3eY2f/pRqQaMdaA7bFo7MfujhUvpKm5njslL7KwYiJdCRMCQjWV+88L5
 HjaCajMkMyHnLMgUjOJHbG0H0PzAs6o2/ojWZTjutAKYoI0HEpm1BgcYGYGTNvSQj4w4
 lu3nZZyWgu8i3M9z3A3wnaH2A8SqG6jNgNEP8LTIxoEJ1VN9VtatnOWVUc1WlqFEfuXW
 rQpiGMFCmb82Yk/ZBEThKwocc1ifkSOidwkSigEPqON2daXprdXu7Tbx8WEUX+14NkID
 BJoeos2etBOi2DThLhaDe++c5uMM9GQFg1r70/chxkiztD4xUKAsGZa5Itdp9p9Zr1AW
 4Z0g==
X-Gm-Message-State: AOAM530B5GF/6Wx0RRbAL0IFqomoZ/isI9diLif8v+o165cTYsXsJevW
 ER9n4su70ffXziENZtii3W7IcJrwAAI=
X-Google-Smtp-Source: ABdhPJzLImB6OiT6RVo8KoQGG/6chhCi4wvjD+r1O7XhRsZ4EvBLphOEDW+mo1XpDU/gtcKlOvE2PA==
X-Received: by 2002:a05:6808:ec4:: with SMTP id
 q4mr5389761oiv.326.1643824197189; 
 Wed, 02 Feb 2022 09:49:57 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:679c:5f8b:eef9:c6c7])
 by smtp.gmail.com with ESMTPSA id
 bk4sm5734088oib.24.2022.02.02.09.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 09:49:56 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 14:49:48 -0300
Message-Id: <20220202174948.1919945-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/warp7: bump Kernel and U-Boot version
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

Bump U-Boot to 2022.01 and kernel to version 5.16.5.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/warp7_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 5fca9f6cfc..04dfc94f7d 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+# Linux headers same as kernel, a 5.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.5"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
@@ -25,7 +25,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
