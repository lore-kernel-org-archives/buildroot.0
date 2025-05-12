Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A974C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 19:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 078AF81234;
	Mon, 12 May 2025 19:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXCnWBJbiH-u; Mon, 12 May 2025 19:22:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3130480EC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3130480EC6;
	Mon, 12 May 2025 19:22:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54893150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45F9E80EB3
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkom-uCTS5LE for <buildroot@buildroot.org>;
 Mon, 12 May 2025 19:22:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5EAB48121E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EAB48121E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EAB48121E
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:22:43 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A4F822C84448;
 Mon, 12 May 2025 21:22:40 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 21:22:38 +0200
Message-ID: <20250512192240.235850-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747077760; bh=JETRUmkexIGK0hm0J8WVMf/h2qrsf9UY1iO0xseWnbI=;
 h=From:To:Cc:Subject:Date;
 b=g/DydHxu4PBwDKQGSBbi66WEMVTmbColKVnEEWKU4ircMr7FZoKWXaXym6HTC6Y+/
 ed0VOoqjqk4BMMwOlvkNvXI25zgEGa0nZxBQrypK4xPgq3vm/RlwGlxRIP8UlnJs+U
 jN5BC7atlKalTCJfWIwEdPBcdHPRJQiZeelUaL2HqIi08uUVnEdFQQxS2ulY+YjxJy
 mDz2EAbGv/AcmPlT7KffvBaZYVSUyzZY83Bayyf5TDppxaz8uphzzTo5PV0du+TvKf
 7eQZZS8gGVDlTydWrhjwBo/6hszH48r4Uve3Nc69W/PkUapu3486f2yk0t5t0FpqGJ
 sgd19YSnUJiHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=g/DydHxu
Subject: [Buildroot] [PATCH] package/python-uvicorn: bump to version 0.34.2
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

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index bbaf98dfff..7040ffa37c 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  9944ee2becd37cb1c1e804a96c34a9e0  uvicorn-0.34.0.tar.gz
-sha256  404051050cd7e905de2c9a7e61790943440b3416f49cb409f965d9dcd0fa73e9  uvicorn-0.34.0.tar.gz
+md5  4a741214532ec25c04dbb1e926e085f9  uvicorn-0.34.2.tar.gz
+sha256  0e929828f6186353a80b58ea719861d2629d766293b6d19baf086ba31d4f3328  uvicorn-0.34.2.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index fbb3937af1..944f683bab 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.34.0
+PYTHON_UVICORN_VERSION = 0.34.2
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/4b/4d/938bd85e5bf2edeec766267a5015ad969730bb91e31b44021dfe8b22df6c
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/a6/ae/9bbb19b9e1c450cf9ecaef06463e40234d98d95bf572fab11b4f19ae5ded
 PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
