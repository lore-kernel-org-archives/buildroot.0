Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95537C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 21:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A3A482416;
	Tue,  7 Dec 2021 21:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y2A1GlQ7VK9K; Tue,  7 Dec 2021 21:50:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89C0D81BB4;
	Tue,  7 Dec 2021 21:50:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45DFF1BF470
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 21:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42E2F41CAD
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 21:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RA4kIM9I8bhw for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 21:50:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B747403C5
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 21:50:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id o13so479750wrs.12
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 13:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6XfWHuL+lxjfVgEd1vSie0t7f9ZT2hEVgmkir6+xOkw=;
 b=bbtbJHHCSjTjTKzUdLQEP4RYHPztuR5z4iZ7ZDcRdky9SmVslvJhNSPrWqrOc1C5Cg
 G0NYPT0vee1XOlpuZsHo1FoWLvdCwcK+V5WwH1IFtzWJoTOlT7yZWJ2RNyutMomH2mJn
 NKaqgRc7rKdW5iPA9DZBPTtvlwmXcwt3I4F7CHN2/ntWLDuS1FNSdCdCZUMr1lXQQP9s
 YMnWnEUdBFXpt0tmq0+LqM2m238Evma0YqpOxPc8EoszTQIn0mV0U2Ex7JFxst/RmDZ4
 lFjFYC2r1sj0VhBq0JLCnK+nrjQYEeoxwRWe7lUjmrdCcazvUHdMSd+MuOLw4vS+CGL0
 wcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6XfWHuL+lxjfVgEd1vSie0t7f9ZT2hEVgmkir6+xOkw=;
 b=yCcAAssZXAGp9YTS1hSeW3gl1Dn8X5F1HPyu+z28YyG7lTQWYEj5MDA2BK5A6nZ6tg
 Oi4PEzuYIzc9hxjrsHFNTiSlnF1xMcokJ4UgBaXpQGtq/xKzc+cKKNa1VrLrStmVfVLm
 xOg8GPbgwj0uX5zGsBj+73IrkzS/G47MD/Cet9bog0eiFpLrfL2blNVOOrgNcnLLaOlR
 RVkVyhrTIwx6nGfxzNzUJszTwrl4Xa9zpbyY+0kRTZiEyt0s+FMp3CFKRyeqesD9tyPe
 Ca5G4WgRKVL6JpguTS4rABfuzhgPaS2FIOCzQkD5Xd7t4qpKfY2fAa/McoGmTYdC2F/M
 5fqw==
X-Gm-Message-State: AOAM531runxArgQdy5HktlYm/d40dExTjB8lYhLoaJcTuE2uR1qae/Sr
 iyolCsuxrgUYoIUyNJilASj9J1eYqk4OhQ==
X-Google-Smtp-Source: ABdhPJyxxJzh9lKGaTNlX/MuiMF3HZTcCTOq3JLpjW7Mw4uz+aFtWLvFpDXTTVayddoJtL7HgmxwSA==
X-Received: by 2002:adf:da41:: with SMTP id r1mr54730513wrl.443.1638913812442; 
 Tue, 07 Dec 2021 13:50:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id az4sm3948845wmb.20.2021.12.07.13.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 13:50:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Dec 2021 22:50:13 +0100
Message-Id: <20211207215013.3316480-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tinycbor: bump to version 0.6.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/intel/tinycbor/releases/tag/v0.6.0
https://github.com/intel/tinycbor/compare/v0.5.4...v0.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinycbor/tinycbor.hash | 2 +-
 package/tinycbor/tinycbor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index 29f0cfabf0..0e616d1e9f 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e63668a71fd6d7abf1727dc31682ec7f107599a3c024a445c3e5da6af9328983  tinycbor-0.5.4.tar.gz
+sha256  512e2c9fce74f60ef9ed3af59161e905f9e19f30a52e433fc55f39f4c70d27e4  tinycbor-0.6.0.tar.gz
 sha256  3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e  LICENSE
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 476da67363..bf6e8e4c1e 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = 0.5.4
+TINYCBOR_VERSION = 0.6.0
 TINYCBOR_SITE = $(call github,intel,tinycbor,v$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
