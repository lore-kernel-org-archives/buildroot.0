Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CABC531DC
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 15:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBE486063D;
	Fri, 16 Aug 2024 15:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVcGwWJF2c5U; Fri, 16 Aug 2024 15:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8B1560641
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8B1560641;
	Fri, 16 Aug 2024 15:38:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0AEA1BF5A2
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 15:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE8AB8415F
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 15:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLYIVxazbu-V for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 15:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD31C84151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD31C84151
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD31C84151
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 15:38:28 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E8F9B2C800D1;
 Fri, 16 Aug 2024 17:38:25 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 16 Aug 2024 17:38:23 +0200
Message-Id: <20240816153825.43499-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1723822706; bh=+j7aIoN3X+glKwC2kRsksKIrPdNyGM4hF0cCi3GqaLA=;
 h=From:To:Cc:Subject:Date;
 b=Gn+UdAR7F2R8gZeXhbF9JbLMw0/k3w+hStvi1820lx4dU2aWUr/bpJylyjQwp+Yrw
 KZrraEpcVkjVTUld5ulla+i63KtiKhwUA+Dak2pKNZIvIZnVgNISKRozGhjKZHtucc
 2NVDbGmJWCN1K6N4VO9TVce5sXiGFi70BfnM22SLLQcBQimD8ujLyuSUU4UGTDEaCm
 x1/tD1ZxwctWm/tBBhPeJjlX+IeqxnwqyunztVKkZ2ikBHhudFjDtMNNVmA6xwwUoT
 fCWj7H+1NQP8PcFGT+cKDl86fYyNFvFDzrQU5wKzfS6Xqd1afCb9S0zDwJFVsLRQsx
 Qjr+01gl7fdUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Gn+UdAR7
Subject: [Buildroot] [PATCH 1/2] package/python-starlette: bump to 0.38.2
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
* https://github.com/encode/starlette/releases/tag/0.38.0
* https://github.com/encode/starlette/releases/tag/0.38.1
* https://github.com/encode/starlette/releases/tag/0.38.2

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index f04aaea7c0..eca8cb8fd1 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  b0ba8178dd4bf2cdff53c8702212be52  starlette-0.37.2.tar.gz
-sha256  9af890290133b79fc3db55474ade20f6220a364a0402e0b556e7cd5e1e093823  starlette-0.37.2.tar.gz
+md5  c56bd58a7ed1320677cff4b1055dff18  starlette-0.38.2.tar.gz
+sha256  c7c0441065252160993a1a37cf2a73bb64d271b17303e0b0c1eb7191cfb12d75  starlette-0.38.2.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index af2c2d4ac7..bf38b1375b 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.37.2
+PYTHON_STARLETTE_VERSION = 0.38.2
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/61/b5/6bceb93ff20bd7ca36e6f7c540581abb18f53130fabb30ba526e26fd819b
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/43/e2/d49a94ecb665b3a1c34b40c78165a737abc384fcabc843ccb14a3bd3dc37
 PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
