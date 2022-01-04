Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5971EC433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 23:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C213140463;
	Tue,  4 Jan 2022 23:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxR6v1ZZKher; Tue,  4 Jan 2022 23:05:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3D564033A;
	Tue,  4 Jan 2022 23:05:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9115E1BF349
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 23:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E2E84033A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 23:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N7MnkhCqlGvb for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 23:05:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FBE7401F1
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 23:05:26 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so1289433pjf.3
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 15:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NDQF/i9KfP7/Jmqm2vfJDbkLWjpHpey9cHOmRPMoQvI=;
 b=BOC1tvcJCTOD+VNz1lwd4/EI3FKocjiUMgpqJnr/LGMsCM43SyltgDaEgbyD2umdVR
 cDA76rbj4/Mk6VkSi/lRAvRQbCN83kLmno/kNr4dhPcsaWpesQePu4JnYDIMkSuTQJll
 3o1OvpG9IQ47hu84Zwg6o7mPuXlTtXhnYIGk4Q/eJPKBL9ARP4AxNB/cYQDOvfggg2aw
 Vm2hOpf1a4ARUFR5wIhX0kHTA4E3vzLTp00Ht2WkWNfICzIUrHUNx0Huz5309Xe/C5wF
 LAHadG/NPMeNKnsXV3Np84cSqDCyQkA7K3MOwwSNbUS4JR9FSk9XSSzNFIibb1Q/DIid
 XXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NDQF/i9KfP7/Jmqm2vfJDbkLWjpHpey9cHOmRPMoQvI=;
 b=janPXyg57AhZWFhbyQCgHjlmy6EyNFE/pmZPjiOQCcvGSFWfa8Lmg5VinR/PmVV7Yc
 RVKMdtXQaKPPEAL0NedpDcfsFvr+sesFVIcb8F4zYDU6lsIx/D2tV52N3/mqCTUusLg1
 lB/ql3C4mKRZ0EnfzEr7cz5qNlR5RREA7oXbl1qXJs7sUiWBZCsESJuyuwIZoYSUkfjA
 Li4Q1kCECyLkCgZH/7H2SW9u5XHagshafTl7Q6TfaSEKn9lQAILovIO68ARuXEtuPLZA
 oOQDWuV/gD2qRi7TVtBNoDZITSD9jUaZs5krkyjuPXZ7z+kAQuY4FNsjvgH8t8rKQQ9T
 4nyQ==
X-Gm-Message-State: AOAM531gsBMhGtuu3nOV40XN/m9TTWEhe44v5kV3RY9IfdVHLS4HXtr2
 76lA2Bwg1ieZbIplyjUs/3Tvyr6gLpQ=
X-Google-Smtp-Source: ABdhPJyy9cP04Og0crlvuwy0CsQjtiDUutE59YIh510kVfMoi4QLYX1e6YDAHI/goR6aX5f29nfBSA==
X-Received: by 2002:a17:903:41ca:b0:149:2191:d9e9 with SMTP id
 u10-20020a17090341ca00b001492191d9e9mr51371396ple.137.1641337525567; 
 Tue, 04 Jan 2022 15:05:25 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id m15sm35108581pgd.44.2022.01.04.15.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 15:05:25 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
X-Google-Original-From: Florian Fainelli <florian.fainelli@broadcom.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 15:05:22 -0800
Message-Id: <20220104230522.1433670-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/elfutils: bump to version 0.186
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, mmayer@broadcom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Florian Fainelli <f.fainelli@gmail.com>

https://sourceware.org/pipermail/elfutils-devel/2021q4/004346.html

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/elfutils/elfutils.hash | 4 ++--
 package/elfutils/elfutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index 9148758e29f4..3274b3265081 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,5 @@
-# From https://sourceware.org/elfutils/ftp/0.184/sha512.sum
-sha512  5920c354edd6b28bb7e713d674bf6f2221e8ee91b90d582de39b1f45446aea1e7e3d4b6671024c391675b5e7530fe952c1320d730bb625c02d4c647ceb938bc8  elfutils-0.184.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.186/sha512.sum
+sha512  c9180b27ec62935f18b9431268d176f6023d1bb938731d2af6e7626ae460af6608a70ba68483aa1ec7e6cb0fa0528b661ca8b68bc4f58ea8e18af527c5950c78  elfutils-0.186.tar.bz2
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index c64224a90f87..8116ae597241 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.184
+ELFUTILS_VERSION = 0.186
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
