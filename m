Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA773CED265
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 10:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A60DB60A9D;
	Tue, 18 Nov 2025 10:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrZzegJKRWyG; Tue, 18 Nov 2025 10:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D74AE60C20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D74AE60C20;
	Tue, 18 Nov 2025 10:15:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0E2D1BA
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 10:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA9868402C
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 10:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNVWki7DAMGr for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 10:15:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8CC484008
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8CC484008
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8CC484008
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 10:15:27 +0000 (UTC)
Received: from pyk-laptop.. (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3149EB00539;
 Tue, 18 Nov 2025 11:15:22 +0100 (CET)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Tue, 18 Nov 2025 11:14:56 +0100
Message-ID: <20251118101456.1077432-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763460924;
 bh=qo7Q31TSgwaDPNEe8ISGAeCICLnO5T2lmdw7MOjKMoY=;
 h=From:To:Cc:Subject:Date:From;
 b=tRqBwu974keNu0szbjBF/6lyXNrR7iiq7XOxwWW8W+ebAfksebtDLtj2C5OMBmrdn
 KGTwHMScoOu4j23hG2N4n8azBgcJmAU63SVglQSbL23u3DLP/5s4PnebQLNKcO1yhZ
 p1JXn0zfOhOSDc/cyCJcYdxPJBypWODlyoXi6GTsPW99LoW+cFxjUzoXOlW2eOk2jG
 L47UhFgNUU/4kbZ90DbdD8qRhGmMTp42dv3907pOpO3Za1Mv2jiyxGGiA1eTvyFRoi
 eRME0FNbPRlVDyjuVvIPOcu8zzs9cBFf+v6mezKWSJk2d3+dpOG/FPYkvdWvlSFOyu
 zuSoWbbDc1uUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tRqBwu97
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: bump to 0.19.06
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/ColinIanKing/stress-ng/blob/V0.19.06/debian/changelog

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index a945fdc14a..dbe5f60a25 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b0ac75b68bb804fd3276fcb235f1b0a9567090ebd887b2ed0f8a3203f9545e11  stress-ng-0.18.05.tar.gz
+sha256  054953145d7de36725a54636ea68975bb9ada06b4769878d25e556fab5804513  stress-ng-0.19.06.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index bf092b0782..7240e3e321 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.18.05
+STRESS_NG_VERSION = 0.19.06
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
