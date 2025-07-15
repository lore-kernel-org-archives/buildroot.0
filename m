Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDE1C83F1D
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 09:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC97560ECD;
	Tue, 15 Jul 2025 09:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VN4kcKkoV5s; Tue, 15 Jul 2025 09:37:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6DFF6143B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6DFF6143B;
	Tue, 15 Jul 2025 09:37:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE134DCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 09:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9442F80D38
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 09:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvZ5CHpS0pKX for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 09:37:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 662B680D0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 662B680D0F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 662B680D0F
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 09:37:40 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 8BAF42C83425;
 Tue, 15 Jul 2025 11:37:38 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 11:37:36 +0200
Message-ID: <20250715093737.22493-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752572258; bh=TUzOuytQCg9r0HLW7/zdKUo+ZVw9RoxMLeCV4TqUQS4=;
 h=From:To:Cc:Subject:Date;
 b=PF+fgXZOOns88M1HTQcyehUYnmMResGLRI6SJJOO347zIz6+YaTlpKJPmCQPmX5Ll
 dr4vXu0YNUJv2S9dexO5Ve5naobW4p3apHz6q0npE8rOhQgC0sHUMMgIjkG3Tq7JuK
 Brc8gKyNOHth3vVKjzFFGdHiLmRWV2Iw5UWhNKng+/VwLGL3wjBuooTz76Shyf2Ipt
 Wiy9uGXwQpiojtW1P+/528d9BHlwxI7hwMHSa+g4MZEMhUrLbgLvnsd/MHihGec++0
 EpG8yyirb8ehlhwTg6esuMPLEU4HHlHTm+psNr596/mir6EzsjdX3TlmTAKn2NCLiZ
 mZQQOtnvrhgeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=PF+fgXZO
Subject: [Buildroot] [PATCH] package/python-typing-inspection: bump to 0.4.1
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

Release notes:
https://github.com/pydantic/typing-inspection/releases/tag/v0.4.1

LICENSE hash changed due to copyright holder line change in:
https://github.com/pydantic/typing-inspection/commit/f3a49c37707cb0b9ddcbc16c19caa75413247319

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../python-typing-inspection/python-typing-inspection.hash  | 6 +++---
 .../python-typing-inspection/python-typing-inspection.mk    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-typing-inspection/python-typing-inspection.hash b/package/python-typing-inspection/python-typing-inspection.hash
index 2ed08c1d35..4337913725 100644
--- a/package/python-typing-inspection/python-typing-inspection.hash
+++ b/package/python-typing-inspection/python-typing-inspection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-inspection/json
-md5  694cee9b0518959cd4b2b7ce2dc5cf2e  typing_inspection-0.4.0.tar.gz
-sha256  9765c87de36671694a67904bf2c96e395be9c6439bb6c87b5142569dcdd65122  typing_inspection-0.4.0.tar.gz
+md5  d451e03d8eac368f7af674f95db586f0  typing_inspection-0.4.1.tar.gz
+sha256  6ae134cc0203c33377d43188d4064e9b357dba58cff3185f22924610e70a9d28  typing_inspection-0.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256  4e40cba793a388dd456577b8657175bbe95e4ded2970534b3c59cccc2661a708  LICENSE
+sha256  804b59b25f2c31bd278f9202a19ae49a3945aa2664387e2d0a128c7cacc61ec3  LICENSE
diff --git a/package/python-typing-inspection/python-typing-inspection.mk b/package/python-typing-inspection/python-typing-inspection.mk
index 043ee12090..e7f1839525 100644
--- a/package/python-typing-inspection/python-typing-inspection.mk
+++ b/package/python-typing-inspection/python-typing-inspection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_INSPECTION_VERSION = 0.4.0
+PYTHON_TYPING_INSPECTION_VERSION = 0.4.1
 PYTHON_TYPING_INSPECTION_SOURCE = typing_inspection-$(PYTHON_TYPING_INSPECTION_VERSION).tar.gz
-PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/82/5c/e6082df02e215b846b4b8c0b887a64d7d08ffaba30605502639d44c06b82
+PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/f8/b1/0c11f5058406b3af7609f121aaa6b609744687f1d158b3c3a5bf4cc94238
 PYTHON_TYPING_INSPECTION_SETUP_TYPE = hatch
 PYTHON_TYPING_INSPECTION_LICENSE = MIT
 PYTHON_TYPING_INSPECTION_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
