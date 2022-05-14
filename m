Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BC3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 22:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D892740558;
	Sat, 14 May 2022 22:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fYxworxmOXg; Sat, 14 May 2022 22:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03E3440253;
	Sat, 14 May 2022 22:42:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 784AB1BF5F5
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7603C82656
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HxybqvTW7UFj for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 22:42:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC61882628
 for <buildroot@buildroot.org>; Sat, 14 May 2022 22:42:28 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id e15so12443108iob.3
 for <buildroot@buildroot.org>; Sat, 14 May 2022 15:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8jaArqe8LJCkj29leLuL6LBpRyY7eQQnqdZeudxtlrY=;
 b=eIw3Eg8jZYFmGyqIeqtkyAidoab0NUT5j3GuL47WVrYOaZT3GblzCf48n0vY/KgkoD
 AiT5pPYMsbtKzynazSKHJ8fiubhL7/ZSF1cxPJcgAr8fpC7UtsHDh4pmwXL4cpEv+LyE
 lUF/LOtJIeG00EA1moNdUjJt+dC7dP5XSovm1mEa80gJsrwfSoiDpKy94JrGyweoEvOh
 lPc1Sbf4oFcqg9ASDg4Wvxqjq19kkSSiwKDOOOrOAKEmsdx+xU7563Y99UmDTr4Jf+tu
 GY/uV2w3HG/wRwEj/6y4XPFTS048AEIm1DYmv7d/ufEorHB3QkdmgldHZGW/9VnPo0mb
 urUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8jaArqe8LJCkj29leLuL6LBpRyY7eQQnqdZeudxtlrY=;
 b=EegHXr4SaXKVYvj40AddOXu2JUG7ZdQGZrEaxH39fUaeOAgZvJILPZ5Ffbtho6HXFc
 KZ2o4IRMfJ8xdu67eEL4u4eJPjAzNMcfxNypx6EpRg5MMxx98FJrez6ydD6fNl9Qx/2b
 oEFl60eXoDuXqxazMzhIyKUMnElRMzfUj8X04kszLz7RJHCbU5NcOxp1Z+JMB+b1T6h+
 Ooab8lFg3eiJ0y/Yc2HW81ReHKlFB2hDMc6wKRvT3I7RFz5RVGbr92gCrhukRGtsr7H4
 kHBgI/UaraPQkcJ187PAeqi41cwIhna4PLIka8xzLts0WXHZRRZsUlz31meznoPQ722F
 N//w==
X-Gm-Message-State: AOAM532AiBJX1fxhG70cXjOWDTLQqD5l65ng/n9AQZ3eYH2EnzNXsrvW
 QEoJQdbU6l3gYObhd0JFM3FIxi/t3p0=
X-Google-Smtp-Source: ABdhPJyGsgJlc3+rOwoB1hCZvLGBh0ncz5jo3Lz+vZdkbh617LwTPOqJznkHHTRqaSiGznMuIOf2RQ==
X-Received: by 2002:a5e:820a:0:b0:649:5b8:d02c with SMTP id
 l10-20020a5e820a000000b0064905b8d02cmr5140943iom.50.1652568147565; 
 Sat, 14 May 2022 15:42:27 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 i4-20020a023b44000000b0032b3a7817bbsm1691564jaf.127.2022.05.14.15.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 15:42:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 16:42:00 -0600
Message-Id: <20220514224200.1156944-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pinentry: add missing
 !BR2_ARM_CPU_ARMV4 dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Propagate this missing BR2_PACKAGE_QT5 dependency.

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT5
  Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_HOST_GCC_AT_LEAST_5 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_5 [=y] && !BR2_ARM_CPU_ARMV4 [=y] && !BR2_STATIC_LIBS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PINENTRY_QT5 [=y] && BR2_PACKAGE_PINENTRY [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_HOST_GCC_AT_LEAST_5 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_5 [=y] && !BR2_arc [=n] && !BR2_STATIC_LIBS [=n]

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pinentry/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 3f005f8c58..24acf4c478 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -74,6 +74,7 @@ config BR2_PACKAGE_PINENTRY_QT5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_HOST_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_arc
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_QT5
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
