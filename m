Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33B5C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 21:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 313BF81E9E;
	Mon, 12 May 2025 21:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4fUzIFCdV90b; Mon, 12 May 2025 21:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5718481987
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5718481987;
	Mon, 12 May 2025 21:13:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC8FE154
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5B5C4108C
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whm_YcErauoh for <buildroot@buildroot.org>;
 Mon, 12 May 2025 21:13:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CFB45400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFB45400FB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFB45400FB
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:13:47 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 696922C84448;
 Mon, 12 May 2025 23:13:45 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 23:13:32 +0200
Message-ID: <20250512211344.721883-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747084425; bh=8i+F+48XSNosNsjVdTszA2nu7OfUBCaHrt8a98K3q0U=;
 h=From:To:Cc:Subject:Date;
 b=DVK+LrMHKoE0GdZQ6uqbZ7XYCzx4LufytMdbIqlDdS5/aPviPYPBQlThfV+R8KA48
 XWalnGr2Ves9XJwRkVIHCJQaFfGhZEXaKq0sOxJP6o2v7TwDSfLik2kpwvT891yOmc
 /4yN4p7/cgCcprOzaqZ8yMqkkRgUVX2dEty45ri8TTZVPyUlju8B46Zd6jPn/RajQB
 UgT+6QsJtCPuE44DdTM+lDbeEg0Qiy2g/m8DG/QPC8Xfjv6KB/21A9O7GZVquyfgHi
 8C3atvmtF45hujmKk0ad7KGS0eCnItTGdSQV8z9tHNS8XItFHEeh91TvGaDs9Xmih6
 Z38ThzchgtUlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=DVK+LrMH
Subject: [Buildroot] [PATCH 1/7] package/python-fastapi: bump to 0.115.8
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
 package/python-fastapi/Config.in           | 2 +-
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
index d4a527c601..21997daf9a 100644
--- a/package/python-fastapi/Config.in
+++ b/package/python-fastapi/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_PYTHON_FASTAPI
 	  FastAPI framework, high performance, easy to learn, fast to
 	  code, ready for production.
 
-	  https://github.com/tiangolo/fastapi
+	  https://github.com/fastapi/fastapi
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index a241937ce5..41b208a8a7 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  38428aff025530f61cd5b10efd764229  fastapi-0.115.8.tar.gz
-sha256  0ce9111231720190473e222cdf0f07f7206ad7e53ea02beb1d2dc36e2f0741e9  fastapi-0.115.8.tar.gz
+md5  af68daf64073e04653b314a895aee297  fastapi-0.115.12.tar.gz
+sha256  1e2c2a2646905f9e83d32f04a3f86aff4a286669c6c950ca95b5fd68c2602681  fastapi-0.115.12.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 2662f3ddaf..95961972fe 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.115.8
+PYTHON_FASTAPI_VERSION = 0.115.12
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a2/b2/5a5dc4affdb6661dea100324e19a7721d5dc524b464fe8e366c093fd7d87
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/f4/55/ae499352d82338331ca1e28c7f4a63bfd09479b16395dce38cf50a39e2c2
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
