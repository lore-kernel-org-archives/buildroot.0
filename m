Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FA9CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 19:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E825883D75;
	Mon,  1 Sep 2025 19:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNOFsjnoauEq; Mon,  1 Sep 2025 19:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16E9983D64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E9983D64;
	Mon,  1 Sep 2025 19:49:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBFFC10E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 19:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D806D61085
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 19:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zSOTAc8bM7O for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 19:49:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35CD361076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35CD361076
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35CD361076
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 19:49:08 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id tAWXuCbjc1ugbtAWXuNmk5; Mon, 01 Sep 2025 21:49:05 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  1 Sep 2025 21:49:04 +0200
Message-ID: <20250901194904.390419-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGqNhp04TFmgpG4igBjpziWS8D/278lyfYHi9TegEpaSy5wHds4sMm2676yclOZgdCkwdB8IwZMSK4SFW59ejjomhO2g7JoTtu6ZYml+wwG+jHSY9Gwz
 bCIni3Pgkv8inyLiMNQTS2yeEdFi/2tTxAfGtuEzmycVaqritdLacgH60qWniloUlvqGi5rIvzGspeQWEvnLN86OW1nEcgEQQZkpzaVunFTGsMNEKB4g4NpI
 obd82uTWAhIpjILiIRXLHX9j1ES6S3EPxJZhMt7onB0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1756756145; bh=IRBd4GIuVMrzHW2mlwscxCWdQTEI2ZngYtPRKVc5SkU=;
 h=From:To:Subject:Date:MIME-Version;
 b=aKtEYxEXhWsPJlgSzAT1PFD47lg0hcrD87KzZQ0X2P1YmDL2kd2w+cXpjpi1adyLR
 Toyb9yfEWM7G3q5chiWakpalp7dTXyj5/wpqSifYB7/eagoiSBZUQE9OkCT7TXHoCv
 ZiRt15Ko4zxNYX+vqeMYuaf5DFjbjKuV9ZFa7L9uYwFFfUW4PcMLtQATieOCNQGnYy
 tHElTnDbGHHn29p2HJXMOOcIZRwrUBu2LxTVPW2Vydh090KiLnKoTHf8LeyBwY3BV6
 hCTmmUOLELohuR1oi/v6sb1+O/3wAR5giZTsVZV8TdGqRp/lDVSQx+0EVW8cSWxD97
 y/fUp2iendCoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=aKtEYxEX
Subject: [Buildroot] [for-next] package/harfbuzz: bump to version 11.4.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Release Notes:
https://github.com/harfbuzz/harfbuzz/releases/tag/11.4.5

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 463a37d22b..a4978ca134 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6660415ad48fa1a46e4fa75fcdb70ff819c452153f08677d34ffb29eda66415d  harfbuzz-11.4.3.tar.xz
+sha256  0f052eb4ab01d8bae98ba971c954becb32be57d7250f18af343b1d27892e03fa  harfbuzz-11.4.5.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 103ab7a6f5..b1bec26ccb 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 11.4.3
+HARFBUZZ_VERSION = 11.4.5
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
