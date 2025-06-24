Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8DDC77B7C
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 11:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A87960A7B;
	Tue, 24 Jun 2025 11:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OleApWVMwrxF; Tue, 24 Jun 2025 11:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6261560AEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6261560AEA;
	Tue, 24 Jun 2025 11:41:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DB4212C
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 11:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E812582F06
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 11:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDNmGyC3fW98 for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 11:41:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B12E982EA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B12E982EA5
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B12E982EA5
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 11:41:02 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 283C22C80D48;
 Tue, 24 Jun 2025 13:41:00 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 13:40:57 +0200
Message-ID: <20250624114059.1931308-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1750765260; bh=rfWHIh83TBtT8y6LAJHLUlzYvtb3cQgaHz3HBvOHa94=;
 h=From:To:Cc:Subject:Date;
 b=FW+Rv2K+1Bj5NSCjDXXdd8gOgmxf6Uru+83GcoMnD6yj3APWARNUox+42cK0HTrO9
 tY8BawLh7qYwlDEQT0Ps0SfqZyW3cSK0iKgjUEL+8g9j9JbYiPPUDHeTVn4vwHVuwF
 BOiCGqgqlfD+mxwldkjN7gPL6A8I1VDpPy7ENRb7ro28GsCspLxS7qTiZR97VouH/2
 NG5rvAncLAn1OZxRPkVzhX9zqMfVA0/N3e8NeyvR91doY/aFQ05eywCeSTjvBXW+FK
 ddyBSH51wGXsFBfIdZL3X2h3hNT0kZ9UI43F9yJd7arb1f/ulnVSQtq52TPNxLUwc+
 SnuCFjqq2vw0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=FW+Rv2K+
Subject: [Buildroot] [PATCH] package/python-dotenv: bump to 1.1.1
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
https://github.com/theskumar/python-dotenv/releases/tag/v1.1.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-dotenv/python-dotenv.hash | 4 ++--
 package/python-dotenv/python-dotenv.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dotenv/python-dotenv.hash b/package/python-dotenv/python-dotenv.hash
index c591dcf9b9..5b4be41206 100644
--- a/package/python-dotenv/python-dotenv.hash
+++ b/package/python-dotenv/python-dotenv.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dotenv/json
-md5  9bdf50416b1c59832d2f77ad6afdf0d8  python_dotenv-1.1.0.tar.gz
-sha256  41f90bc6f5f177fb41f53e87666db362025010eb28f60a01c9143bfa33a2b2d5  python_dotenv-1.1.0.tar.gz
+md5  b3e9652d1974f8c7574c43f719799f3a  python_dotenv-1.1.1.tar.gz
+sha256  a8a6399716257f45be6a007360200409fce5cda2661e3dec71d23dc15f6189ab  python_dotenv-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  80619b7049f08c81683ad0e01f08f257a840652dd71ee83146d36658c7d2c2b9  LICENSE
diff --git a/package/python-dotenv/python-dotenv.mk b/package/python-dotenv/python-dotenv.mk
index c565a3e681..8f11c5de8d 100644
--- a/package/python-dotenv/python-dotenv.mk
+++ b/package/python-dotenv/python-dotenv.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOTENV_VERSION = 1.1.0
+PYTHON_DOTENV_VERSION = 1.1.1
 PYTHON_DOTENV_SOURCE = python_dotenv-$(PYTHON_DOTENV_VERSION).tar.gz
-PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/88/2c/7bb1416c5620485aa793f2de31d3df393d3686aa8a8506d11e10e13c5baf
+PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/f6/b0/4bc07ccd3572a2f9df7e6782f52b0c6c90dcbb803ac4a167702d7d0dfe1e
 PYTHON_DOTENV_SETUP_TYPE = setuptools
 PYTHON_DOTENV_LICENSE = BSD-3-Clause
 PYTHON_DOTENV_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
