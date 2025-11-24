Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B94CFD313
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 14:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B6E560DCB;
	Mon, 24 Nov 2025 14:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQodmkgTqWIX; Mon, 24 Nov 2025 14:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6306160BDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6306160BDD;
	Mon, 24 Nov 2025 14:49:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F84F359
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46C7B403B6
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lqAzxDLWIQh for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 14:49:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2601E403AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2601E403AD
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2601E403AD
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:49:24 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B5D552C80043;
 Mon, 24 Nov 2025 15:49:21 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 15:49:22 +0100
Message-ID: <20251124144922.2851295-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763995761; bh=Fvyufv2ShNT7wmKIwVDub6/m8ICY9QHtf3oWJAs7SSw=;
 h=From:To:Cc:Subject:Date;
 b=P2jo8Y8MmWQgq6ReqYt+IYRY6wiLv/PvXIRdWFxShvvxrC39Py9j7OxL3eHnQSkdp
 bdL8JqmY9aUpkMKjDhGmOOuChFcUH/CG0/e0p+hLDxjyNF3XFi7Wo59PQ3t+OlXpQD
 pWbyJPH5/Vkbyl5lCReuWeO1c2ikHbFmLmH2VW39edIFVFEi45MN62W0WKxj7J2nMF
 CVBqqU/HXKx688Z+mv1ddvKiQUzqOuJcZ1ImBO4Nl3mtyzMg11gOjgQMkAv+N1BkQI
 719UsFQv+QkuwAvpLICAgCVEXWz2lUiPReQXt33EbsKrpzAPx+d1++TE71EYL548kx
 uAxfY5TJWy4rQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=P2jo8Y8M
Subject: [Buildroot] [PATCH] package/python-dotenv: bump to 1.2.1
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

Changes:
* https://github.com/theskumar/python-dotenv/releases/tag/v1.2.0
* https://github.com/theskumar/python-dotenv/releases/tag/v1.2.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-dotenv/python-dotenv.hash | 4 ++--
 package/python-dotenv/python-dotenv.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dotenv/python-dotenv.hash b/package/python-dotenv/python-dotenv.hash
index 5b4be41206..53ab12e11c 100644
--- a/package/python-dotenv/python-dotenv.hash
+++ b/package/python-dotenv/python-dotenv.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dotenv/json
-md5  b3e9652d1974f8c7574c43f719799f3a  python_dotenv-1.1.1.tar.gz
-sha256  a8a6399716257f45be6a007360200409fce5cda2661e3dec71d23dc15f6189ab  python_dotenv-1.1.1.tar.gz
+md5  72b43685c14b492ced7ed6fb1e3f1d63  python_dotenv-1.2.1.tar.gz
+sha256  42667e897e16ab0d66954af0e60a9caa94f0fd4ecf3aaf6d2d260eec1aa36ad6  python_dotenv-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  80619b7049f08c81683ad0e01f08f257a840652dd71ee83146d36658c7d2c2b9  LICENSE
diff --git a/package/python-dotenv/python-dotenv.mk b/package/python-dotenv/python-dotenv.mk
index 8f11c5de8d..6ebc4f6c8c 100644
--- a/package/python-dotenv/python-dotenv.mk
+++ b/package/python-dotenv/python-dotenv.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOTENV_VERSION = 1.1.1
+PYTHON_DOTENV_VERSION = 1.2.1
 PYTHON_DOTENV_SOURCE = python_dotenv-$(PYTHON_DOTENV_VERSION).tar.gz
-PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/f6/b0/4bc07ccd3572a2f9df7e6782f52b0c6c90dcbb803ac4a167702d7d0dfe1e
+PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/f0/26/19cadc79a718c5edbec86fd4919a6b6d3f681039a2f6d66d14be94e75fb9
 PYTHON_DOTENV_SETUP_TYPE = setuptools
 PYTHON_DOTENV_LICENSE = BSD-3-Clause
 PYTHON_DOTENV_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
