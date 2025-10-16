Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D95CCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 17:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3F2240551;
	Thu, 16 Oct 2025 17:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQi0zEU6S3sz; Thu, 16 Oct 2025 17:40:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B424440546
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B424440546;
	Thu, 16 Oct 2025 17:40:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27DAFD8
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A2B360625
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLwtIRB9ytAd for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 17:40:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D168605E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D168605E4
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D168605E4
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:39:59 +0000 (UTC)
Received: from framework-OT (unknown [93.240.174.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B78DA2C89304;
 Thu, 16 Oct 2025 19:39:57 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 19:39:55 +0200
Message-ID: <20251016173957.246866-3-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016173957.246866-1-buildroot@bubu1.eu>
References: <20251016173957.246866-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760636397; bh=GJr0qOBWX8BIafJbM5CtT2C4OfqkfH3e4roAOIeb3yw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HAETP0rA8e1+Ynq6d/SEIfkG5jwPPa6BgWsQGLPyVV60a3+XWweHUa2ex/xZWWToo
 rGPp763AJqIWdNmA/IjodAdtB7dGi/0CU6DBhiPdVqQiV/W9LWFlLNzJ7iUA+iPPI1
 VERsLHUpnfwie/bGsy5WJN58sNrH+bwK2g4TXvokN3O+pKD11KS+QAUevAKqaScOjK
 yIgHtrwCoTcUTSh2jzpVEkcHUab2e6EmD9zkdBrhxsFz875Zcz/DWj0OaWm6X50hk2
 ChIbSCSxejbAR695P6wuPWghb0IsmDnL1/pcaVjw54NimrxVwYSzYmYDEVZGvJ8WU6
 IPAAHmIV5fX+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=HAETP0rA
Subject: [Buildroot] [PATCH 3/3] package/python-pydantic: bump to 2.12.2
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

Bumping pydantic requires also bumping pydantic-core (and vice versa),
so we do that in the same commit.

Release announcement for pydantic 2.12:
https://pydantic.dev/articles/pydantic-v2-12-release

pydantic-core had a build-time dependency on host-python-typing-extensions,
but that is no required, it builds fine without.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 5 ++---
 package/python-pydantic/python-pydantic.hash           | 4 ++--
 package/python-pydantic/python-pydantic.mk             | 4 ++--
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 735abcb4c6..f61ab7a8e4 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  d075c06f299090879748db99ab202a253e9a2b22ee4140b96c0257257b9351c8  python-pydantic-core-2.33.2-cargo4.tar.gz
+sha256  8c31786f387bc0ce4a0fdfb500dbee7b102358616633b37159b389d5c53efa64  python-pydantic-core-2.41.4-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 5085b906d5..9eb0510278 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -6,13 +6,12 @@
 
 # python-pydantic pins an exact version of pydantic-core in pyproject.toml,
 # make sure to sync pydantic-core to this version when updating pydantic
-PYTHON_PYDANTIC_CORE_VERSION = 2.33.2
+PYTHON_PYDANTIC_CORE_VERSION = 2.41.4
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/ad/88/5f2260bdfae97aabf98f1778d43f69574390ad787afb646292a638c923d4
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/df/18/d0944e8eaaa3efd0a91b0f1fc537d3be55ad35091b6a87638211ba691964
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-PYTHON_PYDANTIC_CORE_DEPENDENCIES = host-python-typing-extensions
 
 $(eval $(python-package))
diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index ae1a479991..4148804302 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  40710323d4273536c49c73ca0fa6b1fc  pydantic-2.11.9.tar.gz
-sha256  6b8ffda597a14812a7975c90b82a8a2e777d9257aba3453f973acd3c032a18e2  pydantic-2.11.9.tar.gz
+md5  a3ade0862560d0f85951374e1004578c  pydantic-2.12.2.tar.gz
+sha256  7b8fa15b831a4bbde9d5b84028641ac3080a4ca2cbd4a621a661687e741624fd  pydantic-2.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index fae4822a56..19f4f7f420 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.11.9
+PYTHON_PYDANTIC_VERSION = 2.12.2
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/ff/5d/09a551ba512d7ca404d785072700d3f6727a02f6f3c24ecfd081c7cf0aa8
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/8d/35/d319ed522433215526689bad428a94058b6dd12190ce7ddd78618ac14b28
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
