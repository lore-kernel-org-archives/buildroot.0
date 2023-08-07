Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEE0EB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 08:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F59A81AF6;
	Mon,  7 Aug 2023 08:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F59A81AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id io4HSZd7g4QA; Mon,  7 Aug 2023 08:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A8A98198A;
	Mon,  7 Aug 2023 08:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A8A98198A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DFDC1BF852
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FBC960E5F
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FBC960E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jW0I6aZZrrE5 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 08:12:23 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C3A1606C6
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 08:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C3A1606C6
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b9b904bb04so67782601fa.1
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 01:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691395939; x=1692000739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=99epBqxyJFSH8fhza2Rbzdb8Wgbh/STXvRo50NUzYyM=;
 b=ZhLKwYuIVfzV0ihnkIMV2EUEhstrIUoRKIicUtY7ILmbMi4diI+Zth04g2qPk5fnki
 OaE5VEeLU78nDW0OyiV8Lll1SW12akZBH/mM2GfnfBwlkVNE8WDK1cxq0a6x26IQE65z
 MZri3Rv2i2CRWvkcY1C8PgiNOh9w/wcPbxxhAvV7HMvTXT6b7rK3YwCUe4ulXCda83HY
 u0bhmN02kRm4pwLTEHTj/Sa2TDv8pA8NZ2OvBAsbKud2bLm6J8X09XwzO//5iDBw0yj/
 7oMF2NAkSr4Q/DFEKVpH8D7DMe93+5Xolbi1FQxq3RkFbY9dgLoL4+iNGeAYWysxjRJw
 8C2w==
X-Gm-Message-State: AOJu0Yz56/B3pdzLYNLcZz8Qksmu8qL6B61nyOax3RxbHn/SdsR9ZSAD
 cOp89noB9f6PLN+mpL1dTajvnneTKaSKuIGf
X-Google-Smtp-Source: AGHT+IF2MpAMXRKzeefd8C3D9t8DkS87EMOJSUC84yrpce7J/LOW7TJKnETSLqxZ3/YNrhtR9eFr+Q==
X-Received: by 2002:a2e:7d09:0:b0:2b7:3a8a:4d5f with SMTP id
 y9-20020a2e7d09000000b002b73a8a4d5fmr6086360ljc.0.1691395939232; 
 Mon, 07 Aug 2023 01:12:19 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 y16-20020a05651c021000b002b936cf7530sm1719112ljn.126.2023.08.07.01.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 01:12:18 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 10:14:07 +0200
Message-Id: <20230807081407.4167545-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691395939; x=1692000739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=99epBqxyJFSH8fhza2Rbzdb8Wgbh/STXvRo50NUzYyM=;
 b=GQXy0Ei1xihCDUmQ0DmIxtJ5u/bddzh7BPCYBZUFk1lddCxAiuqFHLedfnCqfEB5Aa
 y0+RP6WpsMkwIkt3AjJfvfNuBZvaufuGGsjEKY4Zf66UXQ3JsrL664FBdxu/z7NQc75r
 cHggkbg4xTRlHFZos/yHpZ2osYNnU59NZ8DaKeK8m3DWNaT2hWDXri4siXLO174vWbRo
 gskEufbY5bEIqgngWLrfSaMN+VuCFp653Ci/H7gSg6BAFoH4qFa4Rw7qZwjq6QxDqH03
 KXh6zPN+UJaJQBUTwbVI1Tt77D3hed5k75NGwLNEMi8JrIdp4d2R5MSIR0cdBxUAIiX1
 QG7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GQXy0Ei1
Subject: [Buildroot] [PATCH] package/libcamera: bump to version 0.1.0
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 01505aa02e..c25a737809 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  0cad66dc09520dddd47510603e053cc9913dc968db4cebe2ac5ddd43fd08fef6  libcamera-v0.0.5-br1.tar.gz
+sha256  f38b42fa849d4d1d5a4dd4ca3013b4b297861cba53970e665e295d3e57de58e6  libcamera-v0.1.0-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 2e30077e20..8dce67f60f 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.0.5
+LIBCAMERA_VERSION = v0.1.0
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
