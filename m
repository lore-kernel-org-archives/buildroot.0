Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC79CF258C
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 08:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53C8A41E5E;
	Wed, 19 Nov 2025 08:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxXrjFzlAWce; Wed, 19 Nov 2025 08:29:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78822402BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78822402BE;
	Wed, 19 Nov 2025 08:29:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A69037D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 08:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36F91418D3
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 08:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCfmUTWoqI_l for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 08:29:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD1F441895
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD1F441895
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD1F441895
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 08:29:06 +0000 (UTC)
Received: from pyk-laptop.. (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2C3F2B0057C;
 Wed, 19 Nov 2025 09:29:01 +0100 (CET)
To: buildroot@buildroot.org
Cc: Andrey Yurovsky <yurovsky@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Wed, 19 Nov 2025 09:28:46 +0100
Message-ID: <20251119082846.2193337-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763540944;
 bh=oPXyUckjR9WOVOxMZLpeHbI+Vn9x3l836W/ha/QbiA4=;
 h=From:To:Cc:Subject:Date:From;
 b=RyvbvNUj+eU/wTjo2jEk027WYV4bhutna5I9wP2Grk+S4Yit3QA9RygxCJDoSGBcp
 dMT/vFFumS4TWY7t31IlYgQ6Z3pBWehdMVYLX159f/1Ad2NurTHTeQYJveKsePEprb
 ceBcqVpVEcy5ULqeKPoiYWHfYyBLxSS0bMRVgOldU15ZX0Q4NniYWmMz0M03r8ixVW
 uiS6ViRp7tAs6qfNrwb8Itt3lmaWuVRaP/lxPtKhnfAtspaTByjc2hQH69dxqkgjXp
 wZbwIPEcDFV2spxKyA6z0OA+JfV9MTkkM/28RiAFo0y7xG/dTij5/LdNxGbpdQ7evx
 fRU0vVcR5Myrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RyvbvNUj
Subject: [Buildroot] [PATCH 1/1] package/rauc: bump to 1.15
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

Changelog: https://github.com/rauc/rauc/releases/tag/v1.15

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 6795bc9485..c0eee0d8d8 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  f48c85573d82bf9378e907f6eba0cbe4f2021839a1e9fe3f8431f61dd54ef42c  rauc-1.14.tar.xz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  4ae0b5246c668acb544ce0230a3bada81c78e8afd4755e5afa2218cbd686fd70  rauc-1.15.tar.xz
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index d20b0121df..10d4a2db95 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.14
+RAUC_VERSION = 1.15
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
