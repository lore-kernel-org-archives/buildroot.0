Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ACFC2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 08:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13A1960EDB;
	Wed, 26 Jan 2022 08:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDA-AMnK-nKb; Wed, 26 Jan 2022 08:25:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 495E860ECE;
	Wed, 26 Jan 2022 08:25:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFDCA1BF2F2
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 08:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDDC7415E3
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 08:25:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bUUkNqV55a8J for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 08:25:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84C6C415E1
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 08:25:29 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id o12so37128194eju.13
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 00:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zxSvZPwZ3EfNAync4cyFhtNxdDwcNPKhDoJEif7p1R0=;
 b=IB2TAN/qJklwNS/8jSftw8UKJAbymgKzN4kQDtHWc1c/KYN2A90w+De6pySbfFVETl
 2yv9BOrce3Yz+UXJ96rMFhowM5LZ+DEMKs3XW3K2ez5AHZQ8rhGTKUthGV/tPW4yIF7F
 8FPNoqOLIA0X8t62QRjsRLMf9MYkjHuIh/Ag5ljg1tsrX1PcT/rGKjPlcfndvKedCFbV
 8INBzlnbx31LJhXQw8MAEZYNOtas7vTFmWdeBuvnEndpqxDKvMF1S/F1qaI6ceCIxE5o
 R4WbrcHRyo8J5qfmwb15991ap1osYQmnleLWUooLhPv1QUGY3gbuUQvXvBMtf1Ilvbss
 yUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zxSvZPwZ3EfNAync4cyFhtNxdDwcNPKhDoJEif7p1R0=;
 b=OYQ3SXBoA89AFcFvoHEl+b7p8ZLpepZI+AH49pmmDb5QCED+SKPxenE2jbwbN2KQCJ
 sArgYF3VFAvDCYJ+yw5ayRvIoc1pVkLxb6ahQEaMJ7HC+Z1iQCJDhVS4EWXELXHmRmyz
 FrXx39L4pYleRNH1OEd8x4LNJKHaXxXgo1793W4dtoUc4son17lDf7z2dU9kVeLai4p2
 4PUGrh9RQ8gezu82SzcN0eqjfc+OzomuIR7b7Ox++NvPr6EzXRtPOtqogn9Bhd6hgfEU
 1sj1Bp4DxIlx/OTNPtt4ny82Mc1KwVwhbwW1l9tEPlyj7cdwjxnLVpSihMMRswc84VqM
 WvbQ==
X-Gm-Message-State: AOAM532rMtsnkV7EFrFDIaPcom6JyR6DSz8qRkdKWKM2zoqFaUcU607m
 unXl5Qduc9BZtYrM+PLy37xcZx2Dd0A=
X-Google-Smtp-Source: ABdhPJznQ42YbCBueC2MPzYdRBCmXsKog0E6cz8B49m6alPCcVAnzyBuCpZlaAIHkabOqE/+cJBg4Q==
X-Received: by 2002:a17:907:7e85:: with SMTP id
 qb5mr15056470ejc.557.1643185527422; 
 Wed, 26 Jan 2022 00:25:27 -0800 (PST)
Received: from WRKS-PIETER-01.Basalte.local ([213.224.0.118])
 by smtp.gmail.com with ESMTPSA id m16sm3595041eji.110.2022.01.26.00.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 00:25:26 -0800 (PST)
From: Pieter De Gendt <pieter.degendt@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 09:25:05 +0100
Message-Id: <20220126082505.10253-1-pieter.degendt@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boost: enable context/coroutine for
 arm variants
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add boost context support for aarch64/aarch64_be and select AAPCS
as ABI for all arm variants.

Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
---
 package/boost/Config.in | 1 +
 package/boost/boost.mk  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 1c405a36c3..cc11b8f53e 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -74,6 +74,7 @@ config BR2_PACKAGE_BOOST_CONTAINER
 config BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	bool
 	default y if ((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM)
+	default y if (BR2_aarch64 || BR2_aarch64_be)
 	default y if BR2_i386
 	default y if BR2_mips
 	default y if BR2_mipsel
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 2d2a8fb311..b6681b0ad3 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -85,7 +85,7 @@ HOST_BOOST_OPTS += --no-cmake-config toolset=gcc threading=multi \
 
 ifeq ($(BR2_MIPS_OABI32),y)
 BOOST_ABI = o32
-else ifeq ($(BR2_arm),y)
+else ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be),y)
 BOOST_ABI = aapcs
 else
 BOOST_ABI = sysv
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
