Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429A8C54FB3
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 12:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04D2640A5A;
	Mon,  2 Jun 2025 12:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 40b3x0uh4kD1; Mon,  2 Jun 2025 12:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14C53409BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14C53409BE;
	Mon,  2 Jun 2025 12:52:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E7AF1F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 12:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7441360E41
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 12:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFqH2y3aUuaA for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 12:52:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9025D60DE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9025D60DE6
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9025D60DE6
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 12:52:50 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 666872C8318B;
 Mon, 02 Jun 2025 14:52:47 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon,  2 Jun 2025 14:52:45 +0200
Message-ID: <20250602125246.774682-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1748868767; bh=B6lypHx5fibwuRBBOCfOu2gDm8GoDbPSm23VzH6n3W8=;
 h=From:To:Cc:Subject:Date;
 b=W4y/zwydfQ3OPd6n/FFkmF61hN9QFEXtxO9klGermBbRCUSHndOjTHu3z89IqMCrr
 CXecmHiTKxWBMwJEOeVD6wmZTMBjicou9LhiWEGcRhA/DBPYHVDbViNf6KnUkqID96
 8bI8T4aHQQW8shdwytphDc0weIJXo4GI5Z7lxCXqzj2i/S742Juk2su7+Hdvzv4zWj
 SsiA0zg/q/l5ApZr65Ot8T0rOwP17ay3GyuAmPC01KGlG5vPhkbhbf9NyxTtYZLBJ4
 gKnHB6sYf1snRdL2mV8s6z5RsjCFI5f5OauzCFnhsxqy3N9XKXo7zY+ivRU9iUzy3U
 EOIc6Ko7knibA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=W4y/zwyd
Subject: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.34.3
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

Minor bugfix release: https://www.uvicorn.org/release-notes/#0343-june-1-2025

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index 7040ffa37c..4d124b6c44 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  4a741214532ec25c04dbb1e926e085f9  uvicorn-0.34.2.tar.gz
-sha256  0e929828f6186353a80b58ea719861d2629d766293b6d19baf086ba31d4f3328  uvicorn-0.34.2.tar.gz
+md5  b9a94b805ea002f0c81b16a89df5e5f6  uvicorn-0.34.3.tar.gz
+sha256  35919a9a979d7a59334b6b10e05d77c1d0d574c50e0fc98b8b1a0f165708b55a  uvicorn-0.34.3.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 944f683bab..345fabe2ed 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.34.2
+PYTHON_UVICORN_VERSION = 0.34.3
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/a6/ae/9bbb19b9e1c450cf9ecaef06463e40234d98d95bf572fab11b4f19ae5ded
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/de/ad/713be230bcda622eaa35c28f0d328c3675c371238470abdea52417f17a8e
 PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
