Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A16C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 12:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BD49403C1;
	Mon, 16 Sep 2024 12:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Br2hECgLWhD2; Mon, 16 Sep 2024 12:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE446404C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE446404C8;
	Mon, 16 Sep 2024 12:50:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E9421BF21A
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 12:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A6B060A6E
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 12:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKUpwBfW92Sd for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 12:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3874860A41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3874860A41
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3874860A41
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 12:50:36 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id F0E982C8007F;
 Mon, 16 Sep 2024 14:50:33 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 14:50:32 +0200
Message-Id: <20240916125033.320605-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1726491034; bh=ttqrkt607y4QPuQWaRUKNoMcOgB/raJ8kd0uEQ9zT4s=;
 h=From:To:Cc:Subject:Date;
 b=rFfVHfjhfDZ1jUB6IVLdVMEYcUtO00kdirdkvU5yrWYcp0V+Br/1N8ny6irGExibR
 VmRWaLCflLDuaHW4oItSDcGFrhlBbRCTuOSwgJ8hM6VksIvoDdGk9bSvixffCi7TR6
 B7StC+EuMzv+hv2evyTJ7ES0iwCrNNx3J1smTvsE1LPChqRRUzekNH4hewsAymmKfZ
 +kkuRSJkrTXWAiF97IPvV/GgzcmFZRlvS5NaMSYcw7c2rjkFS+P/M/AHFo+n6ZOxTG
 GU/qU2GlsJhYQgJWlmdPxHKNQHPGJPfrHa7nYCi86CnVQbFNOHqwWTs36AM96vuR9m
 c7cfAmampbUhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=rFfVHfjh
Subject: [Buildroot] [PATCH] package/python-idna: bump to version 3.10
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

Changelog: https://github.com/kjd/idna/blob/master/HISTORY.rst#310-2024-09-15

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-idna/python-idna.hash | 4 ++--
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index bf6a65a097..fbf571f806 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  3310aa9831d5ee7a33f3cf4bba993558  idna-3.9.tar.gz
-sha256  e5c5dafde284f26e9e0f28f6ea2d6400abd5ca099864a67f576f3981c6476124  idna-3.9.tar.gz
+md5  28448b00665099117b6daa9887812cc4  idna-3.10.tar.gz
+sha256  12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9  idna-3.10.tar.gz
 # Locally computed sha256 checksums
 sha256  a59f0b0ef3635874109a4461ca44ff7a70d50696e814767bfaf721d4c9b0db0f  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index a89427e42d..c7b7f6ad00 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.9
+PYTHON_IDNA_VERSION = 3.10
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/00/6f/93e724eafe34e860d15d37a4f72a1511dd37c43a76a8671b22a15029d545
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
