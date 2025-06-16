Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61512C71135
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 10:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2018360750;
	Mon, 16 Jun 2025 10:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55UEtuNicYZk; Mon, 16 Jun 2025 10:11:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B42F6071F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B42F6071F;
	Mon, 16 Jun 2025 10:11:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ECF0151
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 10:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 308EC404D4
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 10:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LUol9uTPgyMS for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 10:11:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7431404BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7431404BB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7431404BB
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 10:11:15 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 94FDF2C84428;
 Mon, 16 Jun 2025 12:11:12 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 16 Jun 2025 12:11:10 +0200
Message-ID: <20250616101112.12339-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1750068672; bh=BqVXEvwNMtWxsg2tgI/kwmPSj/VBqvUZKmkOE4m6x+k=;
 h=From:To:Cc:Subject:Date;
 b=qGj4LgaYrYedRTVSjgIujP+nyjC9I6Y2CESY9urm3nwPyGtRs+eAWUKl+gz+KdAJH
 GyNE+TYl09auamZHmQdaZXYYwqpPg11gLmFs+FyXNJBcQqJm2nJfgiIGx/8cfNry9v
 lhPITXwN0w8c45Wl2pN7rVBPwCw0eQvY4th7Mz0zyl0a24aDH4eUnEt3EkFN7sk6HR
 0zMs/W87+lNB/2DdcZTMk1MFbDhuAFyQ8TmsuZySxujI32oZQ1uODbD9Or/P/p6EUa
 15f9316kUBvDA85WCFUUzrTMb0hI5xf6PYlDvGwUDo+rU7Z+CfvCZTFzPKVug00zgZ
 CPD3f+1ytKBgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=qGj4LgaY
Subject: [Buildroot] [PATCH] package/python-pydantic: bump to 2.11.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://docs.pydantic.dev/latest/changelog/#v2117-2025-06-14

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index a97062dd96..8ec2a7789d 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  0b701b2a411c2747bf976d04f27f695b  pydantic-2.11.6.tar.gz
-sha256  12b45cfb4af17e555d3c6283d0b55271865fb0b43cc16dd0d52749dc7abf70e7  pydantic-2.11.6.tar.gz
+md5  0d1c309b8fdead08922e1ed9d86517b0  pydantic-2.11.7.tar.gz
+sha256  d989c3c6cb79469287b1569f7447a17848c998458d49ebe294e975b9baf0f0db  pydantic-2.11.7.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 7b0d96bdf3..e614df6f07 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.11.6
+PYTHON_PYDANTIC_VERSION = 2.11.7
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/ef/8f/9af0f46acc943b8c4592d06523f26a150acf6e6e37e8bd5f0ace925e996d
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/00/dd/4325abf92c39ba8623b5af936ddb36ffcfe0beae70405d456ab1fb2f5b8c
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
