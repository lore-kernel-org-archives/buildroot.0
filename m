Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FE3C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 20:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 354BB60E52;
	Mon, 12 May 2025 20:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFX02Oyqyb8H; Mon, 12 May 2025 20:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C0EA60E5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C0EA60E5B;
	Mon, 12 May 2025 20:13:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27BB5153
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0634C60E5B
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2APmJukFQfdj for <buildroot@buildroot.org>;
 Mon, 12 May 2025 20:13:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 78E0F60E52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78E0F60E52
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78E0F60E52
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:13:50 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id EZX1umgqUtr9dEZX1uy3AW; Mon, 12 May 2025 22:13:47 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 12 May 2025 22:13:46 +0200
Message-Id: <20250512201346.573418-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPFGYXdbjABb07aaV7xfsmeNRQfSMtah5V+SpoKLrHcDgP8X4Yj94k1ISmF7l6LfK2eZ/JOfacMCrUg9MvdygMjw20JDTyZGP2SPFl/T3kGyu7VWyeFY
 8Gkw148wRH6pHFLmcA7WkKS3c9kIWVdAKcPl47/TxfFdGc1OnDY1E3x1hn563gqMkp01MZhdC8K7Nv4+9qFPoSFuz4UIh/PwgASAyHEzPdH1gd4M2dHInpji
 6Wx279S89mvwf+WLaZHRIKH2xXBkksWKinIzfvEOCqE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1747080827; bh=Csk0FMpDmKnokkYlcH45HdLRuTntabXUL7O4dftQtgE=;
 h=From:To:Subject:Date:MIME-Version;
 b=eipUs6IBwhmBRCY2TGhAjkS069OFt8cZc8TXloxZNwKRB9/2rJd517DwOFvUQaC9A
 HTEl+sZsp31m0ZEB/S9dcNW59Hhp2Tpld8OMc4QpRhVF5k3IOVZX0JxdpdFQ0l84wr
 PpNu02ESaYtT/rcjd4/3Bj6W2N3O0R8ppHa3US0aoT454qOBjslj6FkqlRjlaAJ7og
 Be49R2yeS5JZdwRgOREKPnTQj4nxmWs5FG7PfNb0YcsOVQDlqyToEBgf7DnRAQ6W9Q
 MbbMQ5ba5dI1gu4qWOtOCYbFu/V3Tk1jo5bgsEXiYq9BbgoRlKfRQ89jum1QkrSZua
 6CH3Pe8ACz3iQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=eipUs6IB
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 11.2.1
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
https://github.com/harfbuzz/harfbuzz/releases/tag/11.2.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 0e641cba07..0fb034cdb4 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  50f7d0a208367e606dbf6eecc5cfbecc01a47be6ee837ae7aff2787e24b09b45  harfbuzz-11.2.0.tar.xz
+sha256  093714c8548a285094685f0bdc999e202d666b59eeb3df2ff921ab68b8336a49  harfbuzz-11.2.1.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 8af0fa6f18..888f343750 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 11.2.0
+HARFBUZZ_VERSION = 11.2.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
