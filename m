Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0229BECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 00:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EE0C8439A;
	Sun, 18 Sep 2022 00:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EE0C8439A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WKJQJ5RcXbvo; Sun, 18 Sep 2022 00:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 674C584319;
	Sun, 18 Sep 2022 00:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 674C584319
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98AA21BF423
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 00:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 720FB41912
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 00:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 720FB41912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNwh0OIl0Hb6 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 00:09:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F01C41910
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F01C41910
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 00:09:05 +0000 (UTC)
Received: from localhost.localdomain ([146.241.46.240])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Zhroojh9PMW5FZhrpobDBh; Sun, 18 Sep 2022 02:09:01 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 02:08:59 +0200
Message-Id: <20220918000859.837023-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLnnXxGKmKDtN0yJqb5d4jSxyOuVWeQlCC7jM9x+9hLv42ns/BE/mO7u96jpAtbBxadZ1mAACqQqAYgctvdMU/FeNevmCLoDpndwzLyK223SqAy1fjf6
 tIFc/eYFXlngmZMcPtdHinDf/8SxGev3C0yW/O+jWZSD6vAxgmDTZVLA89fQURq2ahbBlsIi21wUefplElpUcCLhNh9JNeYAip5vs+BaPnH98x6GBu2SDLrZ
 be92MJkqK3EjgueibCBeiUeH48zaVFRahB/twcJTSPIfrFB5uifxyKRl2V5TdIGn
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663459741; bh=BO62DufkNCBsz1OSEQY+8AMg3Ly/vNk/sqJWAtigMrg=;
 h=From:To:Subject:Date:MIME-Version;
 b=Knv8by7iVESvy1ThJgf2wq5BtbiHYSOPNZyLEYTH6DF8tGDwX1ibhxzWBWz5mPMHa
 bRjZ3+kicD3ARke+niaK7zlKztMLXZeCaAjChFfFrZEsrMCrxe1ao3p3GNS/+PfKMf
 jLkU06LthqFZM5xa8p0NYq7snSRSnKFdHa9Rd4/WoQPfRflzBe5MiVCMycGkoRmsKq
 QOf4lJN7sTWC6hAtZF73AvnbwKiiOoHb3MVDyQGmudELBSW8lFMVvTSHaEHuqBLAf1
 ovAnJhQ+EDh+28k8ppkEIiMk1enJ7HTeeyq2Q9omGHYb+JhNTzA5bp7v3AGp204GQJ
 Jb1qH1NhIWAMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Knv8by7i
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 5.2.0
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
index 9ec5c63f55..0d55c15f79 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2edb95db668781aaa8d60959d21be2ff80085f31b12053cdd660d9a50ce84f05  harfbuzz-5.1.0.tar.xz
+sha256  735a94917b47936575acb4d4fa7e7986522f8a89527e4635721474dee2bc942c  harfbuzz-5.2.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 75d55106ea..15a58c4bf4 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 5.1.0
+HARFBUZZ_VERSION = 5.2.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
