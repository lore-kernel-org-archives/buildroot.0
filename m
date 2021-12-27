Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3693C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 18:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25346813E7;
	Mon, 27 Dec 2021 18:58:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3yEGmus6izN; Mon, 27 Dec 2021 18:58:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CDAD813BA;
	Mon, 27 Dec 2021 18:58:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9ED4B1BF3D6
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 18:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83A0B4016D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 18:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DkR9S1mjG1b4 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 18:57:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2B4640131
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 18:57:59 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id v4so11627061qtk.0
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X7ATQgqiHEcoJ+rT+iRBUToIHOkBPBUR7OBNIE6u2gc=;
 b=B/0NZ92kcu/KX5n3iOPuixRmYQVLMlHk3YeXTElg/HVB1yoeJqELR34AEglTLMchur
 EZch8kcGSCp3RQ2577fu6ovWTXsGvaddcN1iO+2N+r+ZiLLBzDsUBcrUM5l8gIiMNuAF
 fvelbjS9B57f4BJFFppB/sKuq3B2q19GmZBSlm8kmy5TKJzRiWb4K9hlch/7HBbhCQGg
 M9jcL+ykbin+0cRxAzluZqdl8hQC7DjlBiNkGrzplRL/ABd7A6Di2VEOI3PQ0SonDf1S
 hn1CZ/ecAYR5Ob2rMCHf96NVbT/5HeOfDq24URcZ6xrA+BovR4JUA6mK4N3rAsR+sN6+
 OvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X7ATQgqiHEcoJ+rT+iRBUToIHOkBPBUR7OBNIE6u2gc=;
 b=rKb9AK3TG50XKbknzQSdfqyQcq90E/Jw/zg2Te7Tw/FkkgsrlM0SAdswhyQotV2mPH
 54TCWvXE4QOsB+4rqrdClwEsxfbWRRKlw67tsIc8oEuQ6TbhP1MT3GfzGQk9sBH+WDCF
 1pb03Y29YNoqJjf5RjzFz8IxVyFd9tAM5MYPJGJAMRsQx6VZHD+IUDwqu8Ynz2WvOTHq
 jtHhNVfO3N+Rq+hym6fxrNnA9KXYjCQu7GZ4zYGG0pa+Y0/duD65WT4b3bud3fsgKVdD
 WthLtNH/MkGvL1fwClsHkpKMt8dP6vcQDIOSoveT9pbhO7q5k0MOeRmcExRuTn2gdaH/
 zuJQ==
X-Gm-Message-State: AOAM5317+5wYV4jpNFcSRSM2cCZtPA00UqyOChevIf3bFW9/9V8VpZ50
 TlIp/2kkzSgUE7AZ3vmXkUiLMoZgSQw=
X-Google-Smtp-Source: ABdhPJwz4xCdRYVrsvydIc5ARziPrNfrb2+GrCvp+Ah4N6/6Wfdi6p/eNeuMvggIwciGkCPI6C6MPA==
X-Received: by 2002:a05:622a:151:: with SMTP id
 v17mr15732229qtw.167.1640631478391; 
 Mon, 27 Dec 2021 10:57:58 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:8f6b:751e:ed35:8559])
 by smtp.gmail.com with ESMTPSA id
 t204sm10177990qka.127.2021.12.27.10.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 10:57:57 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 15:57:51 -0300
Message-Id: <20211227185751.3308648-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/imx6ulevk: Bump U-Boot and kernel
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

Bump U-Boot to version 2021.10 and kernel to 5.15.11.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6ulevk_defconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/configs/imx6ulevk_defconfig b/configs/imx6ulevk_defconfig
index 53381d71a7ce..22b5a45480bc 100644
--- a/configs/imx6ulevk_defconfig
+++ b/configs/imx6ulevk_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-14x14-evk"
@@ -22,7 +22,8 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ul_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
