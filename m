Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B8BCD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 22:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3E6760EA9;
	Wed, 10 Apr 2024 22:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJ5LKk8-KW6F; Wed, 10 Apr 2024 22:14:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6FB760EAF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6FB760EAF;
	Wed, 10 Apr 2024 22:14:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 979471BF40A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 22:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 847B8404D2
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 22:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNoo9tbNU41B for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 22:14:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35E82404A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35E82404A5
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35E82404A5
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 22:14:53 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-417d14b39feso1648235e9.2
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 15:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712787291; x=1713392091;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JEwoW00CFJCtlk1jS/oWNTPYjt819C6QBTPM1J3GgFo=;
 b=tFxBpwtX0N0u5ObFNSebzG/8EcUhctU8Sx9zFxdwCNTT/wlESUvQLgp+rYt5Wz9bX3
 1u5oJq+znAzhFz/d+4IVbnu5eqlmOKOVf5pCfhg+V9fd64WtzyKzB2XnYSs9HJ5K1lJw
 kEeDHeC6Dq1hcutWzj+vInrQ40WXZHipFQIk7Q6rVcvGC5dePnP4oswNW8JzQAhvF0gw
 /xBf4vCE28a+JQKNUG7vpVJhI5cUbc6/6fr8giwxeysAq5zumZGAyDp7FEKOhT/htPGP
 DmpjpcnCoJdUC5Chkic4UixXaNJ/quthEQP3jLa5ZqsTYFAz5C1TPgZ7BRmKF0Ky8ooU
 dlpA==
X-Gm-Message-State: AOJu0YwgmI2S6El7kEPRNapGr6wUMRVyGZzRntPWN6Fmkyz0d6LukmRn
 CA7E6LAeHyAHmGMfHkZpekMuFffYHL4rFXl4Sde1XvdovxYWwi5QxItuNcG1NfNFH0BEGRBrNKc
 i
X-Google-Smtp-Source: AGHT+IFHQEQUandC4jXwPgjL24mCOJNEzw7jCOYQLBmm0ilWlpbMofgm6OyJfMfcSTnUyaZcKV5cPQ==
X-Received: by 2002:a7b:ca57:0:b0:414:8c5:42ce with SMTP id
 m23-20020a7bca57000000b0041408c542cemr2963427wml.19.1712787291175; 
 Wed, 10 Apr 2024 15:14:51 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a5d4b46000000b00341c7129e28sm213944wrs.91.2024.04.10.15.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 15:14:50 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 00:14:48 +0200
Message-ID: <20240410221448.88466-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712787291; x=1713392091;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JEwoW00CFJCtlk1jS/oWNTPYjt819C6QBTPM1J3GgFo=;
 b=wBFoBN9TieL7s1nXYoqqn8NCEF/A8p+IVS7LTOJ6XGK23p4GLGnq/CvFNxPHXNnoBm
 7l2OJss4f+kmSXEOSGC2ajUgVy20osKWe/KdB5M2UpUTVSaoKmwqzNob3Dl/iaSNr7cy
 zKIOjJ5TRD0UudZA0NUxMz+eJrxJiQa8TRj25xuCkZpsTMY+wx12hvIgCcTGqhPGrziK
 KIcoyx4Ngeawsy6kOZ1qpcKV6aHTcCKyqEJKegJp73MoU/WU4JwwVSZnp/g+IymWufZI
 XvYIao3mzEx6t9ztvX9m/No8qII40vSiey2l6mfDXG0WvddMWY9hAL3ucwvIZAWF9U5H
 yLXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=wBFoBN9T
Subject: [Buildroot] [PATCH] support/testing: regenerate .checkpackageignore
 used in TestCheckPackage
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
Cc: Romain Naour <romain.naour@smile.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit ccb4e5db5c ("utils/check-package: emit library name along with check function name")
updated the .checkpackageignore format but forgot to update
.checkpackageignore files used in TestCheckPackage.

Keep .checkpackageignore_outdated as is since it must be outdated.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786785

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/utils/br2-external/.checkpackageignore    | 2 +-
 .../tests/utils/br2-external/package/.checkpackageignore        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/utils/br2-external/.checkpackageignore b/support/testing/tests/utils/br2-external/.checkpackageignore
index efb7680173..2a29916d08 100644
--- a/support/testing/tests/utils/br2-external/.checkpackageignore
+++ b/support/testing/tests/utils/br2-external/.checkpackageignore
@@ -1 +1 @@
-package/external/external.mk PackageHeader
+package/external/external.mk lib_mk.PackageHeader
diff --git a/support/testing/tests/utils/br2-external/package/.checkpackageignore b/support/testing/tests/utils/br2-external/package/.checkpackageignore
index 5f4a5e1187..a9368d1c1c 100644
--- a/support/testing/tests/utils/br2-external/package/.checkpackageignore
+++ b/support/testing/tests/utils/br2-external/package/.checkpackageignore
@@ -1 +1 @@
-external/external.mk PackageHeader
+external/external.mk lib_mk.PackageHeader
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
