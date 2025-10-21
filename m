Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31335CCD1A7
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 16:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D983D40513;
	Tue, 21 Oct 2025 16:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lhuiYhr4xl1; Tue, 21 Oct 2025 16:58:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6200404D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6200404D6;
	Tue, 21 Oct 2025 16:58:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F82B277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EB1B81E00
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMpRyHO1ZDFy for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 16:58:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E86F81DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E86F81DF9
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E86F81DF9
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:58:19 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id DE2992C8315F;
 Tue, 21 Oct 2025 18:58:16 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>,
	Sen Hastings <sen@hastings.org>
Date: Tue, 21 Oct 2025 18:58:18 +0200
Message-ID: <20251021165818.1936386-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1761065897; bh=6wvtE8dXivwnZ6GJMkP4QUzWzdWDUo4FhieTrz5gZBY=;
 h=From:To:Cc:Subject:Date;
 b=nSusi+EzHTIwJURPrv3jVz5u4b2eU2i8UmHHxbgg0Ny4+AgynZjsiYpRJFDcWkNva
 uEIpqADQhvXe5eEdV8lBDnIo38fjnNfPqpRsjwWnSa5qp2cykvu01O5w8GmBUlRxZI
 GiWrj1c6pdAA9z2Ai6fKoirQ0x2Bl8hQBSqTmfzEJNd9/YJlzUfxLH+BTtIChzrBxv
 CckqWjl3kjauVC8itEcjCO2h13t7X1w5c53VtITitXK4b7h3lKIm9Gd6BHBuO9J1nb
 w9sCFKCs3eXd3Pd9dHsWZtjNuyEF3oae2gXNrdn7Clog+11o9ZME4ugXpUL2G2TzvU
 J2MM2X7gSHYOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=nSusi+Ez
Subject: [Buildroot] [PATCH] package/systemd: bump to 257.10
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
https://github.com/systemd/systemd/compare/v257.7...v257.10

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 7f8bc837a9..6743a4a7b9 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  70ecf759260549486045d065555d2f8a0ac0b8523d8f58227559fbd6d7523b08  systemd-257.7.tar.gz
+sha256  5a2f477e6268630f6e2829c7bb3e442017549798a4122635817934eaa0c6ac10  systemd-257.10.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4d15996662..6d04ee2581 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 257.7
+SYSTEMD_VERSION = 257.10
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
-- 
2.51.1.dirty

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
