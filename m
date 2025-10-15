Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A3ECCD193
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 10:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AFFD61462;
	Wed, 15 Oct 2025 10:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oldt2Cd7bLG0; Wed, 15 Oct 2025 10:27:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1454C61474
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1454C61474;
	Wed, 15 Oct 2025 10:27:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A76A1BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 10:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E56E340906
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 10:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4yNqSRArEOC for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 10:27:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E65054005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E65054005B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E65054005B
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 10:27:20 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 730BE2C80CE5;
 Wed, 15 Oct 2025 12:27:18 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 12:27:18 +0200
Message-ID: <20251015102719.2727330-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760524038; bh=i8sdT5XNZJOsGvadwRcnuZj44aBfVZHMpJyO7UU4Ito=;
 h=From:To:Cc:Subject:Date;
 b=hpsyUfHIMW6AArQSfUin0Da39/h9skZIREHKtcQg/T5QUOI6uUKetba9YP6AlycUT
 FATAUOCZ12PuTSVuRo6JL0W5qdCgV4aXCYK+J5wLA42uMHI3zJ/crgSOsKc5YXqMFf
 /e0LPBKvJqcHtI7IH65zPVL/auGryZlbyMzXsxxlhwspKpCWJBn5NovQasC04N2yS4
 nn6nxWyl3DSP72VKCCfbWkdaQuGqhx7xTbABt0X3Hz4NdA24/TWZThH4WFKhSdK9tc
 KUZSAJ189wYeWwgFLhK0fG675y8Sm2QwCx56Pe4m5p8nwGBcx5zMw/mPH/epuH1P5r
 Qgx9le+4R5LpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=hpsyUfHI
Subject: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.37.0
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

License hash changed due to adding new author name in [1].
Website changed to https://uvicorn.dev/.

Release Notes: https://github.com/Kludex/uvicorn/blob/main/docs/release-notes.md#0370-september-23-2025

[1] https://github.com/Kludex/uvicorn/commit/fe50e5d9933fc09c347b991d6376c02ada3f0f21

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-uvicorn/Config.in           | 2 +-
 package/python-uvicorn/python-uvicorn.hash | 6 +++---
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-uvicorn/Config.in b/package/python-uvicorn/Config.in
index c84f54781f..f4ac466227 100644
--- a/package/python-uvicorn/Config.in
+++ b/package/python-uvicorn/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PYTHON_UVICORN
 	help
 	  The lightning-fast ASGI server.
 
-	  https://www.uvicorn.org/
+	  https://uvicorn.dev/
diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index ef5e157433..0200c61321 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  22172516b080e47aa8c8c3936f16e18b  uvicorn-0.35.0.tar.gz
-sha256  bc662f087f7cf2ce11a1d7fd70b90c9f98ef2e2831556dd078d131b96cc94a01  uvicorn-0.35.0.tar.gz
+md5  21c0c2aa9aa90950e4bdda1ab365f0b9  uvicorn-0.37.0.tar.gz
+sha256  4115c8add6d3fd536c8ee77f0e14a7fd2ebba939fed9b02583a97f80648f9e13  uvicorn-0.37.0.tar.gz
 # Locally computed sha256 checksums
-sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
+sha256  6e40f231fbf861db5bb27f728c47340c69eea8bb864f624f49df892fa02adfaf  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 0cb0077200..dfb80cafae 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.35.0
+PYTHON_UVICORN_VERSION = 0.37.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/5e/42/e0e305207bb88c6b8d3061399c6a961ffe5fbb7e2aa63c9234df7259e9cd
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/71/57/1616c8274c3442d802621abf5deb230771c7a0fec9414cb6763900eb3868
 PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
