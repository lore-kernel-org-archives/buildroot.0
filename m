Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D5EC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 11:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8C1040218;
	Mon, 22 Jul 2024 11:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIjoEqS5JerV; Mon, 22 Jul 2024 11:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E4740231
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66E4740231;
	Mon, 22 Jul 2024 11:11:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC4F51BF28A
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 11:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E61EA605D4
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 11:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffdQi3DZ5gwE for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 11:11:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4EC50605CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EC50605CF
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EC50605CF
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 11:11:27 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C56812C86617;
 Mon, 22 Jul 2024 13:11:24 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 13:11:23 +0200
Message-Id: <20240722111123.1256111-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1721646685; bh=L6ROf84y1QBnnLjn9gMhhaXe5VwBCz6ljNTrKnV5dxw=;
 h=From:To:Cc:Subject:Date;
 b=mz8YN68zskvMESk7eNqVFPAknpiZ2bEncLLqATpuwWrqhzQMcgVNdVy99sT3BIum+
 M0KXJ9CaDCUJ5RzczKM9r7j1hekpUVIh1Fj68VpbzdccjUxN/qKo1LiwxWcwOJkqMc
 UoOIQwR/dGgK7KlKUd6pPgj1kYDSym+4AmFkAAfUbqR0V4ujrwNVMRjkHG6cu1vKnz
 xDx902CjZl//rSKshDFAoDi7RkjOtlRnnNYDPvRICGfAq+a8DGKs9UWCgZhGWy/9wG
 5F4efSFzk/eR1ONCZLuDegtZumEBKQN+7jTEGQk0pibloI0ZHGbw7rUEEa8FjY9174
 fhwh9xF3OMLwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=mz8YN68z
Subject: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.30.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:

* https://github.com/encode/uvicorn/releases/tag/0.30.3
* https://github.com/encode/uvicorn/releases/tag/0.30.2

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index 318fc65e21..7032319999 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  a000939f41470e55bad5cec475489b4c  uvicorn-0.30.1.tar.gz
-sha256  d46cd8e0fd80240baffbcd9ec1012a712938754afcf81bce56c024c1656aece8  uvicorn-0.30.1.tar.gz
+md5  433c22f6ac3bbc2e7011a5623b772e25  uvicorn-0.30.3.tar.gz
+sha256  0d114d0831ff1adbf231d358cbf42f17333413042552a624ea6a9b4c33dcfd81  uvicorn-0.30.3.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 092c640abd..00c3b953a3 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.30.1
+PYTHON_UVICORN_VERSION = 0.30.3
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/37/16/9f5ccaa1a76e5bfbaa0c67640e2db8a5214ca08d92a1b427fa1677b3da88
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/77/40/b650be95700dc83d14c5f2b9eac9deb23cbca757a12ee20e473b5ef1ac48
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
