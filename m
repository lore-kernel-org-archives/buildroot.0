Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67515C83F1B
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 13:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27A8360A4A;
	Mon, 14 Jul 2025 13:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcpq87qJKNK9; Mon, 14 Jul 2025 13:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5021860A54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5021860A54;
	Mon, 14 Jul 2025 13:38:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC917DF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEB5F40487
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMeg0AhyKPz9 for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 13:37:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D701B400BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D701B400BE
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D701B400BE
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:37:56 +0000 (UTC)
Received: from charybdis.. (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 2E2C0E001A3;
 Mon, 14 Jul 2025 15:37:54 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Mon, 14 Jul 2025 15:36:54 +0200
Message-ID: <20250714133657.3564-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1752500274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yaOSjmWAaERS//6wgt91/mnly/iUjLdtWExYap0Ql90=;
 b=pOl1pKKdNMeCNMOFwiKqwfbiVEFI1ptZl0PgvDTl9cDPci8Dt5fNiXOvYP159Yob0hxtzj
 TzLXPgcRzOzmg/Qh6HN4yDAMZws5D1BsQ+o+eECVsIEJ90r9UNtTGfZzak+hOXJaIc0rCd
 4dDOTN5jB80LbVp8AzhbyACUOF8ZIhI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=pOl1pKKd
Subject: [Buildroot] [PATCH 1/1] package/wireplumber: bump to 0.5.10
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

Release notes:
https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/7a4d3177550b6b53fe0a49396da5b07f5353daff/NEWS.rst

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/wireplumber/wireplumber.hash | 2 +-
 package/wireplumber/wireplumber.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireplumber/wireplumber.hash b/package/wireplumber/wireplumber.hash
index 7fff34a7a7..a254b68cca 100644
--- a/package/wireplumber/wireplumber.hash
+++ b/package/wireplumber/wireplumber.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4926399cffe3da12f1338e1feec53ef944e86ae7c719384bff87490d7e3edbc7  wireplumber-0.5.5.tar.bz2
+sha256  c89fa29694e89939c0e57cade5c9a7da8e5da21c19071862978ef5f3a346f1e7  wireplumber-0.5.10.tar.bz2
 sha256  ff2eb9af5b05d92ac3a38cffcad27582ef555a31ff1781e1c1d4e087f77c9c81  LICENSE
diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
index c8cc1ad106..8818662059 100644
--- a/package/wireplumber/wireplumber.mk
+++ b/package/wireplumber/wireplumber.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREPLUMBER_VERSION = 0.5.5
+WIREPLUMBER_VERSION = 0.5.10
 WIREPLUMBER_SOURCE = wireplumber-$(WIREPLUMBER_VERSION).tar.bz2
 WIREPLUMBER_SITE = https://gitlab.freedesktop.org/pipewire/wireplumber/-/archive/$(WIREPLUMBER_VERSION)
 WIREPLUMBER_LICENSE = MIT
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
