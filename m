Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9578C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 18:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0C7E40E43;
	Sun, 31 Jul 2022 18:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0C7E40E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3FPj7wGknZM0; Sun, 31 Jul 2022 18:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F04B40DC6;
	Sun, 31 Jul 2022 18:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F04B40DC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 140A81BF290
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 18:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2C0060EBB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 18:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C0060EBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xArupi0jgKdH for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 18:17:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3FF660773
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3FF660773
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 18:17:14 +0000 (UTC)
Received: from localhost.localdomain ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IDV1owFvEbMeiIDV1okjQH; Sun, 31 Jul 2022 20:17:12 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 20:17:10 +0200
Message-Id: <20220731181710.191802-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfK2tZ8AGZC1CPx252A9POa6D+RU3gbxrcwLa2BMXMqs4kNxxryK/PbLYtPdF9xnN/2Ew5SE5Hgrca0lmoQFlE7m7m4H9SQDWMkLXYR8K2zkTf5OHQHW3
 yyIdyHoVnpJm+1SEnmzGctZ48KYmnAI2FkEnGtXpTK7Pgxzhvb+gtklEs+iQ03i4alxC+7hWdWC7JeBb/5YrrQ5MR97eLJsHgLOKNz4nEqPclT3OEQpNe86e
 T5ORi/AyyZUkJsVnISB8i5qgsZAC1lu0f+TJGqaE43kSkWJjI/BPmZniMbxWUTNF
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659291432; bh=NeiDjxN4K24+i1fxlugPO0LmnauW0WmRhaW3LhGGgaM=;
 h=From:To:Subject:Date:MIME-Version;
 b=lC8FKkcg1Ant6wk97WdCMkgbcoSypbWuPokop/ZBFYY7Yk/LDKwst3+UmM6Hb2bX2
 4jvCMxHwH5r7fFNboj8TKF/7APr8MJPHnBVIft0hiMBgBH455hag1rpIFGw55/Mx1E
 cg7YJatEEDhqc27yaJ1PWghl+tXvLek/RK4DWDoKL5QQQma4zEyBsIxC+r15iloKjp
 +MaLbWpogZQilYpWfhlwBhaIUgVEeMqpF53KbHDsV4k1/zRov57JoS1Ir0VCW+hkHP
 4Ahc86Feh3txlo+3PDa2TDNTKViWTlwSE2iU6tmePBy0BX2P6RWvNnm84NMIJ9+dtK
 buYECVGpu5juA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=lC8FKkcg
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 5.1.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index b1d236a055..9ec5c63f55 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d0094299a36346b9f5540aa159b358425c022b19fcdf72165eaf94046a179166  harfbuzz-5.0.1.tar.xz
+sha256  2edb95db668781aaa8d60959d21be2ff80085f31b12053cdd660d9a50ce84f05  harfbuzz-5.1.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index c9ff28a526..75d55106ea 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 5.0.1
+HARFBUZZ_VERSION = 5.1.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
