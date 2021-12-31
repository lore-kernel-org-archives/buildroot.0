Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7CFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 23:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC26740393;
	Fri, 31 Dec 2021 23:04:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RG2iobcyHhzv; Fri, 31 Dec 2021 23:04:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7966400C7;
	Fri, 31 Dec 2021 23:04:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 862BC1BF37F
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 23:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73C1F400C7
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 23:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NV6YxVx2fxVR for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 23:04:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59E4140017
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 23:04:33 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so26836080pjw.2
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 15:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nfs7QjrIvcLNPVDIfEyDysALJ3+3NMN+LW7BbnIhlPY=;
 b=MNn4AdD86MlruW02iI99sBORFreLQYdKYmRRA3+yWl24XQVdKSg+GaihOhl+iRyJtZ
 pWrHmC+8JyFPeF2BezxK8VG3fOsuokgL73EQymE+/2vMDkqpoHZR2KZ3G8LcmWAyiIxh
 DO/Jr2Ua14wH23qScludvRqJHYP7B4w3zqHj/dNMTb7Thnf0XWZ4IW4itWEmFwO3Z9Uk
 ISulEislW+EvhtLZYWAeUSr5jIvqRBo7eVJ4SfHp53Vy1/pzWvptB8WkKT5JV/fzShRg
 jEdaFFDzWYG1izlaeqC4JpDmaUSz/VlZf1OStovHHfGalofIB/das2A0S9aL0zsPjMxF
 iYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nfs7QjrIvcLNPVDIfEyDysALJ3+3NMN+LW7BbnIhlPY=;
 b=dJXPaqBvYg9CS5wswvir3iMMUGbHKBVlWLsLMEfPnAP+TsZ23+n+zpuQ5EQPuobLmB
 NB5bfA7EW3ScejGpgC6WlRq1Dzl12M8zBTKRUTVkORh+Fqnx7p4+xl9e/QTVvko6d/2q
 nnSXXh1DelkAu30YrxcnDTJyAG0CCLYkwlynK4Ij7QKiWL/D5+V4SY37sM4xjY1iE7NZ
 oNYblVIWigR6UH+FcusNzDaFBmoY9qoE0FG9vL8ZnezSRsM+xoH4/mHPVPoOUlH+vxJD
 vbDMcC78GTk+gVT3t6PQXN/IkMivMzn7nOCmP+TrGgDTfXvT8sgwps7s2wfrxNgbE11s
 +Cgw==
X-Gm-Message-State: AOAM532mG8g3TIZoF2ktnReEWnW0zBLBNyaqUIWXShCmXQJhOnACn4eH
 nYP1zwEF4JJadNiWvfDw9ZXOixt1UTo=
X-Google-Smtp-Source: ABdhPJwIecPEN+bLcn66PWU5RX8mOKUDZMhvcQuv07eFH31LEoB/oJBY9EzsnROip2M2JF5/b9qt2A==
X-Received: by 2002:a17:90b:4b4a:: with SMTP id
 mi10mr45559086pjb.55.1640991872599; 
 Fri, 31 Dec 2021 15:04:32 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id f16sm33462369pfj.6.2021.12.31.15.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 15:04:32 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 15:04:22 -0800
Message-Id: <20211231230422.955804-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libimxvpuapi: depend on host-python3
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package builds just fine with python3.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libimxvpuapi/libimxvpuapi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
index a2a3b21105..d8f214b9e0 100644
--- a/package/libimxvpuapi/libimxvpuapi.mk
+++ b/package/libimxvpuapi/libimxvpuapi.mk
@@ -8,7 +8,7 @@ LIBIMXVPUAPI_VERSION = 0.10.3
 LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
 LIBIMXVPUAPI_LICENSE = LGPL-2.1+
 LIBIMXVPUAPI_LICENSE_FILES = LICENSE
-LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu
+LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python3 imx-vpu
 LIBIMXVPUAPI_INSTALL_STAGING = YES
 LIBIMXVPUAPI_NEEDS_EXTERNAL_WAF = YES
 
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
