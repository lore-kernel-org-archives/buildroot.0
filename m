Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE97C54E58
	for <buildroot@archiver.kernel.org>; Mon, 11 Mar 2024 13:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F22D403C9;
	Mon, 11 Mar 2024 13:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyNb3Z__USrg; Mon, 11 Mar 2024 13:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B7564042D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B7564042D;
	Mon, 11 Mar 2024 13:02:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB79D1BF284
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 13:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C82248176A
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 13:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PPJud2PSAxFc for <buildroot@lists.busybox.net>;
 Mon, 11 Mar 2024 13:02:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5EC9581063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EC9581063
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EC9581063
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 13:02:49 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 34D562C8382F;
 Mon, 11 Mar 2024 14:02:47 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 14:02:32 +0100
Message-ID: <20240311130234.67746-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1710162167; bh=hcdHmvkVL3jhqgQoZ6caSOzUPzP9LB8HZC6obemp3vA=;
 h=From:To:Cc:Subject:Date;
 b=UExmoAXTTnwE2Hvfvq8vsjZ3cxtGLn1vdurcb6XG0htdE1d2PTgNF2r9WxNQziYec
 QEHEsADh01y3inJdvJxw1vXKeKQWmqf4qfTtsQ8+Kx8/3j51SscI/N11Sk3+wCOhgI
 9BBW1FWimB8N3/FO5Z36w5uVR8WjwpzQrvYk97AtCBn76aiGcsOLjcu9GrNbEWvGtR
 t43PfxOCIuvjWl2/ngRk6NwPXBjzbOJx2ll7JfnwXrzWWRy6xcOkhTdlT55I5uuPiZ
 dbSyf4jL5fGZ4E5UyIWc3Yc9HMEDKtoL29oNFaNd3WGGH9LWkgM1udvMUmEQvrXKxx
 CiryR/9SaSYYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=UExmoAXT
Subject: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.28.0
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

https://github.com/encode/uvicorn/blob/master/CHANGELOG.md#0280---2024-03-09

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index 773995ab9d..6d3c6141e8 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  98f40515e34fb49e9d2842b6a147acec  uvicorn-0.27.1.tar.gz
-sha256  3d9a267296243532db80c83a959a3400502165ade2c1338dea4e67915fd4745a  uvicorn-0.27.1.tar.gz
+md5  00c91cfc364d85580a35e11a5f67ee84  uvicorn-0.28.0.tar.gz
+sha256  cab4473b5d1eaeb5a0f6375ac4bc85007ffc75c3cc1768816d9e5d589857b067  uvicorn-0.28.0.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 899b9660f6..5b54c95327 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.27.1
+PYTHON_UVICORN_VERSION = 0.28.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/09/d8/8aa69c76585035ca81851d99c3b00fd6be050aefd478a5376ff9fc5feb69
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/3b/45/42cc810a7e6e1b7894b53f37c265614fbae1b76a6bede36bfe629736c8e2
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
