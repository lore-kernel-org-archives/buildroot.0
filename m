Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52595C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 12:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA996407E1;
	Wed,  9 Apr 2025 12:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwuV3nw7u1TY; Wed,  9 Apr 2025 12:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E792240561
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E792240561;
	Wed,  9 Apr 2025 12:27:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E86301F1
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 12:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D039B60A7A
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 12:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94L1k0efkPvy for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 12:27:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79AC76079A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79AC76079A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79AC76079A
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 12:27:17 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A5E3B2C841F6;
 Wed, 09 Apr 2025 14:27:14 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 14:27:12 +0200
Message-ID: <20250409122713.2711739-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1744201634; bh=NKlhZPZTR8pBYMVXji6AWrq4Lwvm4ESS8xVWkOO+CHk=;
 h=From:To:Cc:Subject:Date;
 b=FlLTeqsWLeXmSbyM+SPPNn9nwj8nDvGWw+vpfGKGxFG5PoKPwxwfnAG1f85XsyRoX
 w71aPON2S1x2doz13/2a7rCIaeHyl41qjNEfRot4jwmc2pDR5/uxc0NFizkqgqIEL5
 GcSKS4if8hKU5r1qcbBQwlFqtqIKPfooFR+CD5Exj+686zwzfoDPAV+2SE3sxwv/Qh
 Z4piYHw79QKfVtPsPAmqj3D5zmvQOymv4AMBrMJ32QPltBBpGpxzskOb3LvR1gOx8q
 Qqq14QQZgEtRV+/zA1ngQu/QSC/dbLPqKB0q7BXHafN+DqRD/K3n57+nTxXYBsn0Xe
 eGXo5cj5phXAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=FlLTeqsW
Subject: [Buildroot] [PATCH] package/libndp: security bump to version 1.9
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marcus Hoffmann <marcus.hoffmann@othermo.de>

Fixes: CVE-2024-5564 [1][2]

[1] https://www.cve.org/CVERecord?id=CVE-2024-5564
[2] https://github.com/jpirko/libndp/commit/05e4ba7b0d126eea4c04387dcf40596059ee24af

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libndp/libndp.hash | 2 +-
 package/libndp/libndp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libndp/libndp.hash b/package/libndp/libndp.hash
index 389e0ba5fc..ee2b758919 100644
--- a/package/libndp/libndp.hash
+++ b/package/libndp/libndp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c3ea76e253def89869651686a827da75b56896fe94fabd87d8c14b1d4588fd05  libndp-1.8.tar.gz
+sha256  e564f5914a6b1b799c3afa64c258824a801c1b79a29e2fe6525b682249c65261  libndp-1.9.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index db1de7b81c..30281627af 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNDP_VERSION = 1.8
+LIBNDP_VERSION = 1.9
 LIBNDP_SITE = $(call github,jpirko,libndp,v$(LIBNDP_VERSION))
 LIBNDP_LICENSE = LGPL-2.1+
 LIBNDP_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
