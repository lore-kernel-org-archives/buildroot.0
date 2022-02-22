Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABED3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 11:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56148405B3;
	Tue, 22 Feb 2022 11:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WCei0w1xbgHf; Tue, 22 Feb 2022 11:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35468405AD;
	Tue, 22 Feb 2022 11:34:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7832D1BF865
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 11:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64A3C403D8
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 11:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vNbYIqsHYV-7 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 11:33:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A96BE4099E
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 11:33:59 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id p14so41850872ejf.11
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 03:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R7Rh/pOJwj+BzoqWSOHQIIP2PAIJCje3BY+tiFPcFV8=;
 b=G0Mj5a9vba7jCjAz/CcwQTE4SmD8A12wSQ4nNdlW1bnSNJBM20ruwCPfF3AMqnylAi
 juGbnzyodew9J/EyNbFn0X15wx6W0vAQ8bgchwyvlG0WHWRKVqVW1GWTXqb1aS9M75eN
 Sk2P2c3Wt0tR6GBohuMBA9M7rdqyABl2f+aXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R7Rh/pOJwj+BzoqWSOHQIIP2PAIJCje3BY+tiFPcFV8=;
 b=MsCIdyzeQeqTxvOTellWgdAI+XA7z/hDFbcdeU+aChTqSDvvlH307R96VmfuGF/C6W
 WwJGyWyZjwAlncyH2ZV8YQCvCT2Qdu2GabFu+wPYqkpSmiacCaDJTOgsEOauSF6uQbCi
 5oq7ipx9rnPrmAFxdgz8SrwDnQtiQEFNL5B9Qpb24LtxVmlujAY5fTWcX6xPCd8+i3Vm
 gO8O+fEkyGR99UywguMiHGy6jVn7eiPSJB9Y7RoDtC7WA625qN571Ln73VXU28gDgZ9T
 MRXyffunejH07V2Wo0sgqWTVfEXFKUc07aav1Ap8bEEo5ADwxMkq4IdvGrXi6NYdmBOB
 NbjA==
X-Gm-Message-State: AOAM531pEolHEP28WJlx6r25X09lEFzOlumnGnrTTpMfX8t5JqARO6O8
 GERTqvZsqx4/DXP0FFBI2Ytp0jhxC6beEQ==
X-Google-Smtp-Source: ABdhPJxfvFmslSs/tu5Ys5ORXMEkJbky/sjoqEuS4StyQaswXxgUhIjkKdAldPGr0hKsUPqLiquAlQ==
X-Received: by 2002:a17:907:12d5:b0:6cf:bb0d:9b2f with SMTP id
 vp21-20020a17090712d500b006cfbb0d9b2fmr19280713ejb.138.1645529637915; 
 Tue, 22 Feb 2022 03:33:57 -0800 (PST)
Received: from localhost.localdomain (host185127038042.static.fidoka.tech.
 [185.127.38.42])
 by smtp.gmail.com with ESMTPSA id eq6sm9678975edb.83.2022.02.22.03.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:33:57 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 12:33:54 +0100
Message-Id: <20220222113354.2609277-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pydal: bump to version 20220213.2
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pydal/python-pydal.hash | 2 +-
 package/python-pydal/python-pydal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index eef00030bd..46271dfd91 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  9634f34a31d4411588b73825c8acc7f73ca69ba8a665bb00d0a9b5baff69498b  python-pydal-20210626.3.tar.gz
+sha256  40a2cafb5aa830d51ababfe34a8f8a0e3b630bc4f931f04db75ed84c3f55ea38  python-pydal-20220213.2.tar.gz
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 428999f5c1..c3be683dda 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20210626.3
+PYTHON_PYDAL_VERSION = 20220213.2
 PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
