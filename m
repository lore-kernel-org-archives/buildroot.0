Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2513CFD318
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 17:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC82783DDE;
	Mon, 24 Nov 2025 17:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlXZpXjBUVqE; Mon, 24 Nov 2025 17:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6C2583DE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6C2583DE7;
	Mon, 24 Nov 2025 17:20:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DBEC34E
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F951409B0
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWKAwUrn7S_h for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 17:20:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 513FB4008D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 513FB4008D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 513FB4008D
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:20:09 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B38872C80043;
 Mon, 24 Nov 2025 18:20:05 +0100 (CET)
From: Marcus Hoffmann <buildroot@bubu1.eu>
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 18:20:05 +0100
Message-ID: <20251124172005.3133876-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764004805; bh=fVT9NUED+8QxUnrIc07Y+Vx14GOR6vCynmIVeNt9S2o=;
 h=From:To:Cc:Subject:Date;
 b=CV1N9sGrdu+HxZClXTpllQ/Ua8aVqKbmTx5p8Dr1CKgaFARltW1IKt+Hsip2Pv1/y
 GgnjBuDTY4kXmwNJNRex9GTIoU8VAaCrseCzHsJnoBGhtxLlwHBLcm9Xm5vcf9s061
 DcJMt+ZUauU50n1kCMSaz8ETXr/s5rgA0VT1+9IbXhus4QT416k+LwvTEszlAn37Cg
 c0k9HrKHJG2Ikd7vMEIXMoWBCjRWwUsRnKEW9ehG93t+CL7yO4Bd8lwV7+f/XnkK+I
 JxmBVdyMoWK4NTZ/Nzr2ciOxFAzFg9J3zAVi1987hWztjdLQ5qOqKqDnOsU4Mbaw1m
 pcnH3/RMx5Ozg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=CV1N9sGr
Subject: [Buildroot] [PATCH] package/python-msgpack: bump to 1.1.2
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
Cc: "Wojciech M. Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://wrapt.readthedocs.io/en/latest/changes.html#version-2-0-1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 6cc5bb14c6..d17cd026b1 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  abcd18fded80a89c486c0446f112eb06  msgpack-1.1.1.tar.gz
-sha256  77b79ce34a2bdab2594f490c8e80dd62a02d650b91a75159a63ec413b8d104cd  msgpack-1.1.1.tar.gz
+md5  b69973fa3325abdced4051f5ef3847d3  msgpack-1.1.2.tar.gz
+sha256  3b60763c1373dd60f398488069bcdc703cd08a711477b5d480eecc9f9626f47e  msgpack-1.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index d61e0963a1..76606268ae 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.1.1
+PYTHON_MSGPACK_VERSION = 1.1.2
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/45/b1/ea4f68038a18c77c9467400d166d74c4ffa536f34761f7983a104357e614
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/4d/f2/bfb55a6236ed8725a96b0aa3acbd0ec17588e6a2c3b62a93eb513ed8783f
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
