Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EBEC83F1A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 14:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A12B881E46;
	Mon, 14 Jul 2025 14:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ji6l4N6aXf6P; Mon, 14 Jul 2025 14:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC126814C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC126814C6;
	Mon, 14 Jul 2025 14:46:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D76CCDF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 14:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDEC9404BC
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 14:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFCU7z-5AyLL for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 14:46:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F168D404C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F168D404C2
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F168D404C2
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 14:46:20 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9E5902C84ABF;
 Mon, 14 Jul 2025 16:46:18 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 16:46:15 +0200
Message-ID: <20250714144618.65723-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752504378; bh=TpbXRaJbYrKz+SIdsPATaqxMGGlOWE0hcKJTKik6zg4=;
 h=From:To:Cc:Subject:Date;
 b=DE/xmrvIv9BcIzr6sE7ZZktdEn6pZfeuA1ya58x0DqJ9KIXY712GJoSKrcpAGkHDV
 YwvHg6bjnKBIm+4n856Pxr/8v3hvOlal9uiL37bSqTgZQ0T+FSkqlBxjfqYPYxaDEP
 wWqPTJF7AwjwLPaiggWnx8OSzT94klzQt+MZS5lsXW2M64E4/gnRh3WqwIjNTHv0eZ
 En5hJM0aZIEy7QG6yAmgDpmu4giBgdcOMae7H4EI8C7/xAhMxZ0pnwQe9E8KinWIso
 xjruLXytVxSEheDBq4bzfjpYz8Xz8/KAQp5bjpFrQwNe6ANLptJTOtHUORzPcMgOln
 qidcaB9sdLBcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=DE/xmrvI
Subject: [Buildroot] [PATCH 1/2] package/python-fastapi: bump to 0.116.1
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

Release notes:
* https://github.com/fastapi/fastapi/releases/tag/0.116.0
* https://github.com/fastapi/fastapi/releases/tag/0.116.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 3d0cead179..1810e81e75 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  bdb2a56a2a464ff29736d4b1c55d547c  fastapi-0.115.14.tar.gz
-sha256  b1de15cdc1c499a4da47914db35d0e4ef8f1ce62b624e94e0e5824421df99739  fastapi-0.115.14.tar.gz
+md5  6de51bff13da558df5f6249d7a33b888  fastapi-0.116.1.tar.gz
+sha256  ed52cbf946abfd70c5a0dccb24673f0670deeb517a88b3544d03c2a6bf283143  fastapi-0.116.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index ab39fa29ab..745147dde8 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.115.14
+PYTHON_FASTAPI_VERSION = 0.116.1
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/ca/53/8c38a874844a8b0fa10dd8adf3836ac154082cf88d3f22b544e9ceea0a15
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/78/d7/6c8b3bfe33eeffa208183ec037fee0cce9f7f024089ab1c5d12ef04bd27c
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
