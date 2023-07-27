Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50365C001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 22:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4F9441FF7;
	Thu, 27 Jul 2023 22:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4F9441FF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FmQVL625FxcC; Thu, 27 Jul 2023 22:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60F8741FFD;
	Thu, 27 Jul 2023 22:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60F8741FFD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 049821BF990
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1FA260EE9
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1FA260EE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yl8ekZCrZ4TL for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 22:25:51 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E6B760E59
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 22:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E6B760E59
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fba8e2aa52so16604235e9.1
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 15:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690496749; x=1691101549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7GIZBlMHS4SrxaCpeDLWBQ/NhangBRZXzFclsVyAfl8=;
 b=NrbxrU2LA/ZTWSrMyA31czVh9HMJ0pG4tI2/AlmdEIxTT7OV4WTu4XR07Zzs1nCvow
 gvwSj1VLpBPgJGXNUAHoMiaKpvWjBQ2NeXNmZRp+8m9WFq2rXqcT7V29pcskWSRoBof6
 xpqr7pyqsnVA5zHF8+bKnFo2VlBTnllcoRBjAZnhojL6NNgTBH8a5gYCxHlVb7WWpaa0
 Cxgq071VMznjB6Um7+1PAIUTBM3iynowFEsMnaypdq7RzrkhIs4FBwXjaHDv0Gu7G3hL
 ITo936mWSaEBntnoyTa63mEly83WMco8/MJo5qAmr3cnrsbuONChJo84u8Ev4Fq61TtJ
 8I5g==
X-Gm-Message-State: ABy/qLbntooSE40K/P2AByFlrB30DAzPRiG4Mb1GpT8GO65FTI6ExGn0
 Rqw3W9lwTGsEEntxfGVoBtaSXKrGwaA=
X-Google-Smtp-Source: APBJJlH0LyBFk9xkUTJPjmFTf2Qs82sktXUwH5P5DwL81DY5y1VgaLEuWvRolkfAsD+O9Jzym4V7Pg==
X-Received: by 2002:a7b:c4d7:0:b0:3fb:b3f8:506b with SMTP id
 g23-20020a7bc4d7000000b003fbb3f8506bmr260160wmk.24.1690496749352; 
 Thu, 27 Jul 2023 15:25:49 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a5d5112000000b00313e59cb371sm3218163wrt.12.2023.07.27.15.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:25:48 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 00:25:40 +0200
Message-ID: <20230727222544.196562-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727222544.196562-1-romain.naour@gmail.com>
References: <20230727222544.196562-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690496749; x=1691101549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7GIZBlMHS4SrxaCpeDLWBQ/NhangBRZXzFclsVyAfl8=;
 b=KmRQjf9h7Lm2iwnD647OhPEmGwZYQBECe99mzNLLLaF5NIv/lWm2qGBOFy1vUh7a5p
 H8+y2HZcybPxD/Jpzhyesh6sRxsxaSreYoD3mKAC+2zejaj/yh/zc+WRP7Bd5QZmTUM4
 mIctKZWP05fkBOj90ZrPdIlSqyEvkTRpnTRFCgRfcoP7MJjxuo414t8Nu8ToRt/QPsGI
 Alq/Iuifa4lnyiuw9dN49GtMKCoyJUiVpPXGbZBUDLhPUdwMgeVwRBpSd+0lyX/E65n3
 1ZcAI9FthheafyExMcqT0doPfaqJAL6KxTarv4qBYDf2LH6KlaTe4afiPMW++5uxExb8
 rxPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KmRQjf9h
Subject: [Buildroot] [PATCH v2 4/8] arch/Config.in: add
 BR2_ARCH_NEEDS_GCC_AT_LEAST_13
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new symbol will be used by architectures introduced with gcc 13.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 arch/Config.in             | 4 ++++
 package/gcc/Config.in.host | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 1c0c400a98..db0d839c79 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -304,6 +304,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 73ecc14398..5c356e7cbd 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -48,6 +48,7 @@ config BR2_GCC_VERSION_11_X
 
 config BR2_GCC_VERSION_12_X
 	bool "gcc 12.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
