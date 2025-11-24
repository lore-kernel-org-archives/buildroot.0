Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D1ECFD313
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 17:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F80E605E6;
	Mon, 24 Nov 2025 17:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CB_WBho7ujw; Mon, 24 Nov 2025 17:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D0F86075F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D0F86075F;
	Mon, 24 Nov 2025 17:25:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6895834E
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5672B6075F
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fo6dzI_LDRdA for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 17:25:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D15A0605E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D15A0605E6
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D15A0605E6
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:25:21 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 627032C80043;
 Mon, 24 Nov 2025 18:25:19 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 18:25:18 +0100
Message-ID: <20251124172519.3135368-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764005119; bh=mJhgKGY3IziDyHq/1QkVz2zYbafac0Awj8GgANJzGMM=;
 h=From:To:Cc:Subject:Date;
 b=HhSUN7p5NIel/wyoU8oTYAMXy5dNr4DNoFHnsJQHKCi7A9jCSRFgGkEGA3S1hOZpU
 WvF11RoSkfb12VrUyJUyObA9wivuZ9Q/lLMR7F4OxFYbNO1f5i/CBubMndnVWABzIu
 6szd7paoTqzSKifodw5L9Jnef7Q702JuA5pzQ6m/NIA0U0ziIyQZHgoNh/ecXQqG8k
 R0hZVejUtj/xFRddFvddfCSWFXgmS8qHjvFdVu3PGpLFlP+mZeLLrpBArY9PCNxR00
 VZzZpYaua4AK+VIfeHKOvAb37hpou3yiNnv0MbBDLQP4ofmZBXuNpCsFRyXlWEo3bQ
 DAHYdcEV0/5wQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=HhSUN7p5
Subject: [Buildroot] [PATCH] package/python-idna: bump to 3.11
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

Changes: https://github.com/kjd/idna/blob/v3.11/HISTORY.rst

LICENSE.md hash changes due to copyright year update in:
https://github.com/kjd/idna/commit/17f30a644563860262436a552d99e3ab0c505da4

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-idna/python-idna.hash | 6 +++---
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index fbf571f806..188f290f41 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  28448b00665099117b6daa9887812cc4  idna-3.10.tar.gz
-sha256  12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9  idna-3.10.tar.gz
+md5  9a9c33db960e0d35cc5b257c37dabeff  idna-3.11.tar.gz
+sha256  795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902  idna-3.11.tar.gz
 # Locally computed sha256 checksums
-sha256  a59f0b0ef3635874109a4461ca44ff7a70d50696e814767bfaf721d4c9b0db0f  LICENSE.md
+sha256  b7a336abf3b04e180ec065cdd16e705d079e1cc7a14f910aa6e9187f36b9cd87  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index c7b7f6ad00..2b654a480c 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.10
+PYTHON_IDNA_VERSION = 3.11
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = flit
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
