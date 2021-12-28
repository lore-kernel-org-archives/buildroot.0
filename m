Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0E3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 11:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DBA840290;
	Tue, 28 Dec 2021 11:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3PohOel6x9JT; Tue, 28 Dec 2021 11:06:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7337402F8;
	Tue, 28 Dec 2021 11:06:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 184CB1BF592
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 11:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 070F240201
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 11:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pyzhnC-9h9XE for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 11:06:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 046FE401B7
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 11:06:14 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s1so37669027wra.6
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 03:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dSAAX0HFcEURXd/DCSx9xkgmi2DVv01rxKnm4+qSR8w=;
 b=H3nqORTy+ukXymohKATguana7ovPtS14bpYIGXV0y6uEFttnJ+aHT3og7/CO7qyoQX
 ClsGN8Vdu9deFKWNlq8XovBmauWmKaw8SQXr9wWMMM2dnAIZ/nEtXVOFnqBIQvvPV62C
 8rfd8upDfZAngyfah1uc4eOnl6FwrvePgRFgrAVvzMCeKXo/VlI55KqXuE0P9Y2ywnpg
 ROXqJgdo3r7nKJ7oHIlpIFmSCNhZ0pynMWbYmf9OnNatMc3ErLi1qJZ2hgHvLxPEDq07
 S0qX4q8Hh3OKxZslUOmkX5IsYADNBT/ad2N/J14Rh/lzQanvPUejSz7OalmS65UGqdAu
 Locg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dSAAX0HFcEURXd/DCSx9xkgmi2DVv01rxKnm4+qSR8w=;
 b=AMkZH40TbN+maibYYwJttgor5Kc0Cyug0pGlHdb6jgZooFr0CbM+jG6NFsGqmVlsIn
 6TZiBcECMxWfR7K+ns0XT83CO0X691Qz7Sy1PPPuuDO2/oUJ7nevzYhrjawgEmTWxeiA
 4d3fGL0chy3/oBC8z5CoLqvSu0OGkqVfgx2PPOTy0VIIpzIAOgTZXpPgD58wQgrc4BUb
 ayYT3QWVf8rY7BCQMHbUsS2rvPXYQth2oLutaWa8ERqFu/7eaP9yYgJmSjwecewvo3+m
 maMy1+o+80oFPKA1eh8CJ6XPZJAb7Hi4NYBMf3wfFlUdcxpJotdgwfD50sUOfY1pMVUg
 9mMQ==
X-Gm-Message-State: AOAM530OFeD0ytZVbPtdIK0w83jiyVdFPV9wZZEy/mYt+7y2d0wk0Dh+
 uOQbjz2sQatj9vGuH7quP1fU7249ZnQ=
X-Google-Smtp-Source: ABdhPJwjXrFKOU6XWRVYuLShE581AuSGB4cZKm9lsicR1NBSA/mjAL/5M+ECVRS5x2kdzY0sMtp5JA==
X-Received: by 2002:a05:6000:1a87:: with SMTP id
 f7mr16169255wry.150.1640689573276; 
 Tue, 28 Dec 2021 03:06:13 -0800 (PST)
Received: from winie.fritz.box (i59F5253A.versanet.de. [89.245.37.58])
 by smtp.gmail.com with ESMTPSA id o8sm20754690wry.20.2021.12.28.03.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 03:06:12 -0800 (PST)
X-Google-Original-From: Florian La Roche <Florian.LaRoche@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 12:06:10 +0100
Message-Id: <20211228110610.304548-1-Florian.LaRoche@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: bump version to 2.3
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
From: Florian La Roche via buildroot <buildroot@buildroot.org>
Reply-To: Florian La Roche <florian.laroche@googlemail.com>
Cc: Florian La Roche <Florian.LaRoche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Florian La Roche <Florian.LaRoche@gmail.com>
---
 package/rt-tests/rt-tests.hash | 2 +-
 package/rt-tests/rt-tests.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rt-tests/rt-tests.hash b/package/rt-tests/rt-tests.hash
index c731feaf21..4f84e0d0ca 100644
--- a/package/rt-tests/rt-tests.hash
+++ b/package/rt-tests/rt-tests.hash
@@ -1,4 +1,4 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/rt-tests/sha256sums.asc
-sha256 48346ab2b5bf2ffbdb1ed0d4540e9e8e22f6665e6bb3d59c22614f9722b13a91  rt-tests-2.2.tar.xz
+sha256 b5e7959bcb5c703b2743030751af975ea4e04962e29fc1118f4b605987585735  rt-tests-2.3.tar.xz
 # locally computed hash
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index a0d7f76e8e..056a4a6723 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -6,7 +6,7 @@
 
 RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
-RT_TESTS_VERSION = 2.2
+RT_TESTS_VERSION = 2.3
 RT_TESTS_LICENSE = GPL-2.0+
 RT_TESTS_LICENSE_FILES = COPYING
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
