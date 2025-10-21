Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9ACCCD1A5
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 09:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBC624047D;
	Tue, 21 Oct 2025 09:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZXlpMLf-e-d; Tue, 21 Oct 2025 09:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F52405C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0F52405C8;
	Tue, 21 Oct 2025 09:04:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5464470A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39B78608AE
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N74aEHaDb--5 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 09:04:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E1AC60879
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E1AC60879
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E1AC60879
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:04:23 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id F14F32C80CE3;
 Tue, 21 Oct 2025 11:04:20 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 11:04:21 +0200
Message-ID: <20251021090422.736371-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1761037461; bh=TsHGfRVBI+30BseHR+3lH9dAQEmYRhoUyJ58xNdkPf4=;
 h=From:To:Cc:Subject:Date;
 b=fim6utQ87QdLWnUfdbJ8pPGSqUVKCkFxd07bXM6EWM2LYYl9tvHU6Pb9wxQGwQWwl
 4TnT2zLxJlu8cWSNM9BDSwzUGDqe9I88O+KMci22eCcFVkBLMNctRTMGa7/xIv0tb8
 sTPiWf2o/ezDPZED1deZMsxoc2UC7E2LTmPJ5Laq/BvTRJuoXybTvhgyUcoAqUkYh5
 qWijZ0gG2FIjmMcXGtkg/4NlhGj5bdUyvGFhT1PAo4me0ECbAjLMFG8ZaIkdmrHc41
 M9QwtXYJzezeA7kZCSv7rWns80aYbQrZHdH1uEXQSK5P2YTj4NOgMocSV7Ic80v6Tj
 6isjFAtJ4t/ww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=fim6utQ8
Subject: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.38.0
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

Officially supports python 3.14 now:
https://uvicorn.dev/release-notes/#0380-october-18-2025

LICENSE.md file changed due revert of copyright holder name:
https://github.com/Kludex/uvicorn/commit/ce79f95d065c053b36449f67b3b2cefee5ecf167

Both uvicorn and starlette are currently undergoing some discussions
around the copyright holder (but not the license):
https://github.com/Kludex/starlette/issues/3042

The LICENSE.md file will very likely be updated again soon.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-uvicorn/python-uvicorn.hash | 6 +++---
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index 0200c61321..dd8c2bbabe 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  21c0c2aa9aa90950e4bdda1ab365f0b9  uvicorn-0.37.0.tar.gz
-sha256  4115c8add6d3fd536c8ee77f0e14a7fd2ebba939fed9b02583a97f80648f9e13  uvicorn-0.37.0.tar.gz
+md5  ee4fbbe43a1e58e6624adb2763161bee  uvicorn-0.38.0.tar.gz
+sha256  fd97093bdd120a2609fc0d3afe931d4d4ad688b6e75f0f929fde1bc36fe0e91d  uvicorn-0.38.0.tar.gz
 # Locally computed sha256 checksums
-sha256  6e40f231fbf861db5bb27f728c47340c69eea8bb864f624f49df892fa02adfaf  LICENSE.md
+sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index dfb80cafae..ba27cd8052 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.37.0
+PYTHON_UVICORN_VERSION = 0.38.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/71/57/1616c8274c3442d802621abf5deb230771c7a0fec9414cb6763900eb3868
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/cb/ce/f06b84e2697fef4688ca63bdb2fdf113ca0a3be33f94488f2cadb690b0cf
 PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.51.1.dirty

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
