Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812F5CCD1A5
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 08:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36F5960859;
	Tue, 21 Oct 2025 08:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8TZpAPnx5_4; Tue, 21 Oct 2025 08:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2E2160877
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2E2160877;
	Tue, 21 Oct 2025 08:39:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B05C277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C7014059C
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GFLGAUhA9lT for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 08:39:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D323C4054F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D323C4054F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D323C4054F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:39:42 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A7CAB2C80CE3;
 Tue, 21 Oct 2025 10:39:40 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 10:39:41 +0200
Message-ID: <20251021083942.726874-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1761035980; bh=d2W9QurVjvQU5g/+2vyN9bwoaypdJ5JETzIEtW34fUk=;
 h=From:To:Cc:Subject:Date;
 b=rlQrDa+a4QSPQpxnu8xgD/iNMQbMw5KgrlLTC2mOzfsApxtNndD5dO18DqqHBJn89
 3KEtMd0620GazAoqTObxdFo1Sus8i7g4OrmuXW70N+LRLzZ5ab89utCAjGMwGGfs4Q
 utCWE9uTwxRhCxVlGEi01/M+t5QQ8N2GuN4/TWpugqbKSN29c7jBpZuzyjSu88ofDX
 nA6Grfz7LWQz2bpTOOTigUil5MpPiGwFagedTcopm/a2n8fxaDFAsRi8AB6capzI8C
 YlhKaDy5jdBVPemrnbxC8OwN8dOCp2YQ/m/raD4iMRBewRbWxH2j1z0+pSXMKQRVg9
 MLozc5I4xCXZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=rlQrDa+a
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to 0.119.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes: https://github.com/fastapi/fastapi/releases/tag/0.119.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index c4bbaccc33..34bfe22c87 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  8fcc33a9c143b2e7462064825e190ed7  fastapi-0.119.0.tar.gz
-sha256  451082403a2c1f0b99c6bd57c09110ed5463856804c8078d38e5a1f1035dbbb7  fastapi-0.119.0.tar.gz
+md5  5d539db8065d3579430ed00577e8a86b  fastapi-0.119.1.tar.gz
+sha256  a5e3426edce3fe221af4e1992c6d79011b247e3b03cc57999d697fe76cbf8ae0  fastapi-0.119.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index a0d6412339..4a067494a7 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.119.0
+PYTHON_FASTAPI_VERSION = 0.119.1
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0a/f9/5c5bcce82a7997cc0eb8c47b7800f862f6b56adc40486ed246e5010d443b
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a6/f4/152127681182e6413e7a89684c434e19e7414ed7ac0c632999c3c6980640
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.51.1.dirty

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
