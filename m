Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AC8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 07:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E9D8410D4;
	Wed, 20 Apr 2022 07:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9XoAhOsglbdN; Wed, 20 Apr 2022 07:27:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FB25410C6;
	Wed, 20 Apr 2022 07:27:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F33571BF38A
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 07:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F09D8840CE
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 07:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ok89N6sRQxI6 for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 07:27:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C2DD82ADD
 for <buildroot@busybox.net>; Wed, 20 Apr 2022 07:27:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q3so962348wrj.7
 for <buildroot@busybox.net>; Wed, 20 Apr 2022 00:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nsxfBkbftPzfnGV+gXiEBTsdMsrfeZel8s05/5+v6YM=;
 b=Kxp8rPPU34/CZZ28AQT0zPAaF+RWEzZon2sgVCbdVWnyMQWJLRj56xegurnVlnsNwi
 QVBPL342br/pJ4n1keSkL3onFualt8Q3wCX2my6srhkLcTRhhTIsIgJgqbnZhumlgwaV
 OIwdhYM4Mqjki6n6pEKH6xR3QJCpZJCYOYbLpP51wdHbyrM5oavV66X0dcF8UPecI9Jq
 hoohqqa80ZaNFhgwo2yooHLJW3oxbsfkHPYwSplFV61Wsf0urXCn4DcAZWJ7elFN8Jbf
 S49umyW8h6V1Di/JzyxO8GzXhcy3ratY9v+myq4HEGC+cJEA0yIUR5DNxC+dk/gAKhaY
 6oXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nsxfBkbftPzfnGV+gXiEBTsdMsrfeZel8s05/5+v6YM=;
 b=tCBWPG4SBRpwCgxNH4bOXxucfrJyikDWEjzjBPifkveRJRu6COm98Ft5zWyipg5df+
 AEcxwVE24fX16S/oLlCI6lK4OFYq3UWEfMtNdHqFgrIrRLdF/OAmnGfIW3VaEc9PtE7P
 0I4LYED4xrl/U70SaZDpEAh8baGU5Zq2Olj4txM3NKjwK1tF33Bfnn3nnWXu4ytz0N0Q
 Lt/SdHZhiqcJwgkVDdyYkqsv5je2BSaWSylY6/rHTZc4FOxmugrJoxhcjUpR9QinuhDy
 NQBdSY17k9Xh1MNoO/u/VWj1wWg5oqvRcde/M1sD9S/bB+HavKrQHqZEoS7sWgmn14Zp
 Rs/A==
X-Gm-Message-State: AOAM530pKxns9hk+raY3hSEG6m1tGNlPBKzFlf+wR3ZjhKK8GF1QSE7s
 nZdd2ScRpkbz1+v0LjYybJPkNMwfoqg=
X-Google-Smtp-Source: ABdhPJwDuThPFRSf9asRIreW1r8Mf8Z2Y55WyxRc4Je3N8apCp4kf4xELHnwjGSwmeee67ls8HtzFQ==
X-Received: by 2002:adf:e0cc:0:b0:207:b690:acb8 with SMTP id
 m12-20020adfe0cc000000b00207b690acb8mr13963644wri.412.1650439625374; 
 Wed, 20 Apr 2022 00:27:05 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a1c541b000000b003928e866d32sm11012778wmb.37.2022.04.20.00.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 00:27:05 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 20 Apr 2022 09:26:55 +0200
Message-Id: <20220420072655.3422392-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pcre2: bump to version 10.40
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pcre2/pcre2.hash | 4 ++--
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 3e6299f80..e4f798074 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature:
-# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.39/pcre2-10.39.tar.bz2.sig
-sha256  0f03caf57f81d9ff362ac28cd389c055ec2bf0678d277349a1a4bee00ad6d440  pcre2-10.39.tar.bz2
+# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.40/pcre2-10.40.tar.bz2.sig
+sha256  14e4b83c4783933dc17e964318e6324f7cae1bc75d8f3c79bc6969f00c159d68  pcre2-10.40.tar.bz2
 # Locally computed
 sha256  15bc778a1f7e1f857d57abab4181749a06ad1d1f9420d5c9e3c23ef8c991b025  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index adcfaf1ca..043f6d866 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.39
+PCRE2_VERSION = 10.40
 PCRE2_SITE = https://github.com/PhilipHazel/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
