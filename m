Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00156C7115C
	for <buildroot@archiver.kernel.org>; Sat, 21 Jun 2025 16:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 962926071D;
	Sat, 21 Jun 2025 16:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMj6_dvrwBMy; Sat, 21 Jun 2025 16:35:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A83DA606C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A83DA606C2;
	Sat, 21 Jun 2025 16:35:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C2DF154
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 16:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E3B640240
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 16:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t62GhAP8rzMv for <buildroot@buildroot.org>;
 Sat, 21 Jun 2025 16:35:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 052EF401B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 052EF401B8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 052EF401B8
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 16:35:49 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 21F25B00592;
 Sat, 21 Jun 2025 18:35:44 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 21 Jun 2025 18:35:39 +0200
Message-ID: <20250621163539.263715-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750523746;
 bh=p72yBjhkWYRsXrtHrb8Lt77okSUIk1jdd6y7PjSii9w=;
 h=From:To:Cc:Subject:Date:From;
 b=u0TMfVoeK+e3XZMONKFMe3QCYmcpO1idhDOCBT8ECMONx2wn2PRo6+vZggouLa5A2
 P/p15J0dF149y3n8axwnUmL4nwYCDB1Ojd2qlA4NBhfxLtYGjQ3VYjSsmPTeGB/dOQ
 b6B7P7nq4Xdp832ras/AOUwif4z2lf/3WftJN25Yx9Fz0kpOcD4qUrn9K8Xod6bWZj
 vlZfAFvrkbKKZB+wjJq33ZWGWswZePEtfvBYRgCf6GSDjj4bZb9gAR1HE4mhQqmBIw
 nHU9JU/zEeoIlHgcDSZPMnP5szqdtTBUC8kZwF4TeI+5g0r2PsRemS+J3hJ4Vbw2MG
 QEQoxBrsjJpnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=u0TMfVoe
Subject: [Buildroot] [PATCH 1/1] package/openblas: bump to version v0.3.30
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

For change log since v0.3.29, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.30

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 6b123b5c58..965d7458ba 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.29
-md5  853a0c5c0747c5943e7ef4bbb793162d  openblas-0.3.29.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.30
+md5  8db3d57f4d4485c6ae3f21ea465660e7  openblas-0.3.30.tar.gz
 # Locally calculated
-sha256  38240eee1b29e2bde47ebb5d61160207dc68668a54cac62c076bb5032013b1eb  openblas-0.3.29.tar.gz
+sha256  27342cff518646afb4c2b976d809102e368957974c250a25ccc965e53063c95d  openblas-0.3.30.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 069636f5f0..edab26493d 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.29
+OPENBLAS_VERSION = 0.3.30
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
