Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6CFCAC5AA
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 00:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FAC3608CD;
	Tue, 23 Sep 2025 00:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zIBZXohKP4Z; Tue, 23 Sep 2025 00:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5250608AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5250608AF;
	Tue, 23 Sep 2025 00:30:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0027B200D
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 00:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9F00407C4
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 00:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XP9-ovsJo_3a for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 00:30:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.133;
 helo=smtpdh18-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE53E4070A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE53E4070A
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE53E4070A
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 00:30:08 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 0quzvly2rUZSE0quzv7N7J; Tue, 23 Sep 2025 02:30:05 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 23 Sep 2025 00:28:19 +0200
Message-ID: <20250922222819.330433-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfISd2s7mB8zi3hFXPN9Q9sGnQhGOGPZjCgYYKiFvVNdZbuLFqaa9q7FEzCZwCNPwgITCgWHNnoAy/J9YRs/AyO3hlz3YyPUexsrsbAfniJ9xisZrN1RH
 Ukr/PHGxqpe7MRikCPonOLWqZs0yx9FP34NHY0BO66WGka+kHR/i9alRhuT3TtgOPq/jjDaFIyiIs58tms5Ui4RhyD6tYmqCkLEWUEXZskhTxY1qNx3fQhZN
 L9+8rKIT17FKnIV+KYG2jWAax5IuMaVcgwr9R6zzl9g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1758587405; bh=0GCFL0Mdod+r1HBB2FDWggrQ6sHuERMn2csTQbBLyIo=;
 h=From:To:Subject:Date:MIME-Version;
 b=GL71mQ/hB1tw32WEEtXlYz+QnL5tQRhoE7AxDjvc0tXpwF8s8CdeEQ01g0C1ajviu
 tvOhCk9amZIt6XNfNacU/ggpERLGlA+IWfXXZfkOeUQ19Vxckh8AFsfaIWQNS4gv3c
 3aifFii3dFZmrEXm5Rm2Qu/Bwq/wLF5uE89wW6PARbNMa9HazbSCEkAdtpXsYyW1Ir
 h7hRAj5p+U9kRRWWLtSVIOk0/e3I+genhUw7lMOS22xabN5Zu24pYdnNY/SSIfyc42
 SsbHXRfSsuk10up87Iyhzsh+we9e79BqWtSW2q4p/g8ewWyM+JiaBCTL9iDxRTeIyR
 hiDBbe57ikOIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=GL71mQ/h
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 11.5.1
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
https://github.com/harfbuzz/harfbuzz/releases/tag/11.5.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index ccf96ec6d0..a6c34d92a3 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d30ba45c4c8ec4de661a1002b4f88d0841ff1a3087f34629275f5436d722109  harfbuzz-11.5.0.tar.xz
+sha256  972a60a8d274d49e70361da6920c3a73dfb0fb4387f6c6811906a47ba634d8a1  harfbuzz-11.5.1.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 4ec3165e57..5c3666bf75 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 11.5.0
+HARFBUZZ_VERSION = 11.5.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
