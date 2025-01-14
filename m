Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C1EE77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 23:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C0D48409A;
	Tue, 14 Jan 2025 23:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55vv4jhFPwFr; Tue, 14 Jan 2025 23:20:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A21548409E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A21548409E;
	Tue, 14 Jan 2025 23:20:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D669B89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 23:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4581C414F5
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 23:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaK646h9YxAX for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 23:20:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F109A414EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F109A414EC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F109A414EC
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 23:20:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6D6EBB0051E;
 Wed, 15 Jan 2025 00:20:35 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed, 15 Jan 2025 00:20:30 +0100
Message-ID: <20250114232030.1816385-1-ju.o@free.fr>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736896836;
 bh=sPPkNWb/VEveDj3UGFdkbzZyVwP9GQ/9Qp5AyuqIoKY=;
 h=From:To:Cc:Subject:Date:From;
 b=mKB5qoQRFND4hjbnOnypsneyNLhz++dGIO7xBCcEwaYoo4dTd2EaV9LE9Lmy+ASEb
 nKftnu7ZRJ6fPS+XbmoaNAnoy8uAIyB1aKa0nfqZUTL+HCLHlArwWNsGnAv4A8LQaY
 9YnBFmzLtbxe3z2Adv+hxNTnodJp5o0sjNv8PiDavmIolUVqXMegrjgHldfqs97eP1
 D/YtMJTLrJwG4/qunjneKeTVqyyiC0SZknsbs6VXjZqbrRw9WZkmJPaEiERyxPxXUb
 cgfNIeqdNJike76RrK3H+kfqa1ZiMRbO2WYBlNDwPfb6GnL9Bp3vWbI/m3jLYF8RdX
 F07Gkarc1qi+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mKB5qoQR
Subject: [Buildroot] [PATCH 1/1] package/openblas: bump to version v0.3.29
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

For change log since v0.3.28, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.29

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8852519940
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 4439896b14..6b123b5c58 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.28
-md5  0f54185b6ef804173c01b9a40520a0e8  openblas-0.3.28.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.29
+md5  853a0c5c0747c5943e7ef4bbb793162d  openblas-0.3.29.tar.gz
 # Locally calculated
-sha256  f1003466ad074e9b0c8d421a204121100b0751c96fc6fcf3d1456bd12f8a00a1  openblas-0.3.28.tar.gz
+sha256  38240eee1b29e2bde47ebb5d61160207dc68668a54cac62c076bb5032013b1eb  openblas-0.3.29.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index a1f631e6b3..069636f5f0 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.28
+OPENBLAS_VERSION = 0.3.29
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.48.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
