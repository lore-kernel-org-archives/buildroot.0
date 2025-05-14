Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21494C3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 15:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9079483A3C;
	Wed, 14 May 2025 15:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGLch7FhrkSd; Wed, 14 May 2025 15:13:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 957E6835B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 957E6835B1;
	Wed, 14 May 2025 15:13:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBF1112A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B27F782F98
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHj0VNgystf6 for <buildroot@buildroot.org>;
 Wed, 14 May 2025 15:13:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 65C9A81007
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65C9A81007
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65C9A81007
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:06 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id EA1DA2C845CE;
 Wed, 14 May 2025 17:13:03 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 17:12:43 +0200
Message-ID: <20250514151255.2316205-9-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514151255.2316205-1-buildroot@bubu1.eu>
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747235584; bh=Mxm6PNSKkyXRZU9DDrEQ2FCJNTtZuA35vilT44V7tM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TZFOQhjZ+bBJNUcH9CbUiJqRyWNGAXkcr+9f5ZdvK9I5Btcq8SMq/r2tdwFKXRkaH
 umOC4sqIMObWLth9cm87lCcNp+s0ae1ix16bak2mhZj7sTwg43oyBr3tFq8nAwM7dx
 yWJc3HyculcxlK7hDuMjcpqTnyB2ea6RWf5nsU2hxXP2JB7hpFpir59h/Ln9XaLeIg
 fr+dq9G9ZcebOy8Yfnax2CeoM2YS7lF0XXI+zRnwkazq5UOGTIImoL/fyBFZhGys5U
 rq6hrltHpLobjWVaLfsDWm8NSxU1zHdBpy44kwB9g9OwgETrXiHuEhzHBRL33y9XNU
 XIdx5epCvCjVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=TZFOQhjZ
Subject: [Buildroot] [PATCH v2 09/12] package/python-typing-extensions: bump
 to 4.13.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/python/typing_extensions/blob/main/CHANGELOG.md#release-4132-april-10-2025

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
added in v2
---
 .../python-typing-extensions/python-typing-extensions.hash    | 4 ++--
 package/python-typing-extensions/python-typing-extensions.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index 8e2c405929..bd75b95e8a 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-extensions/json
-md5  cf64c2313f5fa5eb04c1deb3fc93abe9  typing_extensions-4.12.2.tar.gz
-sha256  1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8  typing_extensions-4.12.2.tar.gz
+md5  58226788d248cee8d6283ee616543975  typing_extensions-4.13.2.tar.gz
+sha256  e6c81219bd689f51865d9e372991c540bda33a0379d5573cddb9a3a23f7caaef  typing_extensions-4.13.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index 66f8872bf5..f248b13d53 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 4.12.2
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.13.2
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/df/db/f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/f6/37/23083fcd6e35492953e8d2aaaa68b860eb422b34627b13f2ce3eb6106061
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
