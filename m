Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AEAC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 17:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26F08818CD;
	Wed, 22 Dec 2021 17:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QlqBfQi1VdLb; Wed, 22 Dec 2021 17:18:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 824BE814B7;
	Wed, 22 Dec 2021 17:18:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C22F41BF27E
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B162D814B7
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:18:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9XDNEqPxa-gV for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 17:17:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 603DE8148E
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:17:59 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id i12so2050448wmq.4
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 09:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TVh/mtJch/OAe+6c2BH7KOI3SrYw6VgJI9za6wuK56k=;
 b=RfIVFUak1S+ZGeeNm6j1JuPrv0D+n1hNAAg7bq3jJfDvzWjuqQuxC8oJVGwK5rH5BJ
 HYRBdVXLol9pwUSjsqL+X3QXhE0Cv0Q+ZPjQcaKzXH+aSp/+4dCopRZEbS8DUfpE3D6l
 FNyOCsttpH/HTjF5zAOGli6B5QxuoeTCk/yaf50Yf6w1ktuMGQOLZMkk/eLiHPTrMM0e
 g1kaztg37LbsrzyK5T8MkTRY6+ctrVEEKz3kXbs8qKA41PsOf/hR3cCEkEpqFIu6jlpz
 D+S40P5J6bwh6lpyTG8u1oOiFUWstGfBjtW2zKf1Q+hpgQ11cLrbqoVimsCDQPbZjbAO
 OXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TVh/mtJch/OAe+6c2BH7KOI3SrYw6VgJI9za6wuK56k=;
 b=cyW05A/Do/HiZ95f2W+SNKEvPvCpzmtlasywxUF6aOAJ0IiV5bJFfitNPoMeBqB+F6
 sIS9h/yODKOP6Tpt30T/bxSpj383EjVS9bp6ThirqWR26zKsspW5biVEX1dWbpxD58Ni
 qOxBCXY/CtGtjLSZpULRb/+Ed+LvJWZprDv0urkHYb31XFqyICLwqRilrr2tUA6/+79m
 EBc5RZ+QbQs23610BXOD3MBjtaMmPtbjeInwgGCr4I2jj4Nk0XUu8Y0YyTOe+R2eIiae
 ILJ2irsdzxSO5rSn/p54aOpUSn1ObdDfS6/z1kF0sHbE9qh1x0AGxFeI6BzqfaKvts1E
 Il+w==
X-Gm-Message-State: AOAM533TNtdUBYtEniZKd0Ob9qpdohtFoHKikeFwm8d8W6SV+D+bGubP
 vvpa4vfG3AUyNtMVwfFnlBLjfMVqm555Yw==
X-Google-Smtp-Source: ABdhPJzU+dppZ2I12RJpvDQ6T1l+nVvgwyb8JV/K+ft0i1Ye6X6/4sMHqGgKZvsUllbmQDScAfHuIQ==
X-Received: by 2002:a7b:ce8e:: with SMTP id q14mr1607343wmj.51.1640193477498; 
 Wed, 22 Dec 2021 09:17:57 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id m15sm2826964wrw.27.2021.12.22.09.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 09:17:57 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 18:17:50 +0100
Message-Id: <20211222171750.306943-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zstd: bump to version 1.5.1
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/zstd/zstd.hash | 4 ++--
 package/zstd/zstd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index 2d7bf37b2a..d7d8a448ff 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
-# From https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-1.5.0.tar.gz.sha256
-sha256  5194fbfa781fcf45b98c5e849651aa7b3b0a008c6b72d4a0db760f3002291e94  zstd-1.5.0.tar.gz
+# From https://github.com/facebook/zstd/releases/download/v1.5.1/zstd-1.5.1.tar.gz.sha256
+sha256  e28b2f2ed5710ea0d3a1ecac3f6a947a016b972b9dd30242369010e5f53d7002  zstd-1.5.1.tar.gz
 
 # License files (locally computed)
 sha256  2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b  LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index e970d87cbf..476190e9ae 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.5.0
+ZSTD_VERSION = 1.5.1
 ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
