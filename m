Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C48CC3DA6D
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 10:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 110EE80DBE;
	Fri, 23 May 2025 10:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrKdPeIXU9Q1; Fri, 23 May 2025 10:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 428F580E0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 428F580E0E;
	Fri, 23 May 2025 10:47:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6970B119
 for <buildroot@buildroot.org>; Fri, 23 May 2025 10:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B7E540B1E
 for <buildroot@buildroot.org>; Fri, 23 May 2025 10:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIGGTk0asSZf for <buildroot@buildroot.org>;
 Fri, 23 May 2025 10:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3424F40E20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3424F40E20
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3424F40E20
 for <buildroot@buildroot.org>; Fri, 23 May 2025 10:47:45 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 85A062C830CB;
 Fri, 23 May 2025 12:47:43 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 23 May 2025 12:47:39 +0200
Message-ID: <20250523104742.328850-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747997263; bh=862Ff8V8GYM8YmAbKMCbo930JlW6N2ws/JbRqMWK5Fg=;
 h=From:To:Cc:Subject:Date;
 b=USbFa9Aw1PGx6LzN6F0iBrmejY8C4GfOQgi1AQ3lj6DSNQRrxFOjHjR9nGeYiw9XN
 iRTDyciJycIdiF6Qoz9TDaVjLYRX5rjZheP5OeMps1skWa41OtnHUtoJGjHwerQ3rs
 f0TLZIYzmItIswADaDfJ/eM4A4lhkLL08ed4siNV57p4cOUnMUpR2tHJPlVlUIT5Ma
 QzGdYY4yFRg8fqxJhWm+FuHs1cQRvhX5X1VE8sGb0gkEtSNFdZipteQHHoptzcNLyC
 t/0jj3vj17zlmhanfH6dlT3bGRfNe/gZlfvUzpNnvSzVZturEWI3rSZSZvBnhLYFsx
 5ZgUxpiAv+knw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=USbFa9Aw
Subject: [Buildroot] [PATCH 1/2] package/python-pydantic-core: downgrade to
 2.33.2 to sync with pydantic
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

pydantic pins an exact version of pydantic-core in it's pyproject.toml
[1]. This was missed during the last pydantic bump where pydantic-core
was erroneously updated to the latest release instead.

Modify the pydantic runtime test to catch this error in the future.

[1] https://github.com/pydantic/pydantic/blob/v2.11.4/pyproject.toml#L49

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pydantic-core/python-pydantic-core.hash  | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk    | 6 ++++--
 support/testing/tests/package/sample_python_pydantic.py | 5 +++++
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index ebfc50e508..735abcb4c6 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  34e84faa734d981ca1f383844ac057434108e657667f115363abd93ac65486a6  python-pydantic-core-2.34.1-cargo4.tar.gz
+sha256  d075c06f299090879748db99ab202a253e9a2b22ee4140b96c0257257b9351c8  python-pydantic-core-2.33.2-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 48fd4960af..5085b906d5 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.34.1
+# python-pydantic pins an exact version of pydantic-core in pyproject.toml,
+# make sure to sync pydantic-core to this version when updating pydantic
+PYTHON_PYDANTIC_CORE_VERSION = 2.33.2
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/42/fa/5f682f3db14e14f7b5b7f5008ac24594b93943d1da4facbacff5876624cf
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/ad/88/5f2260bdfae97aabf98f1778d43f69574390ad787afb646292a638c923d4
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
diff --git a/support/testing/tests/package/sample_python_pydantic.py b/support/testing/tests/package/sample_python_pydantic.py
index 4c22f5ede4..1c6e949211 100644
--- a/support/testing/tests/package/sample_python_pydantic.py
+++ b/support/testing/tests/package/sample_python_pydantic.py
@@ -1,6 +1,11 @@
 from datetime import datetime
 
 from pydantic import BaseModel, PositiveInt
+from pydantic.version import check_pydantic_core_version
+
+# pydantic pins an exact version of pydantic core
+# verify these are in sync in buildroots packaging
+assert check_pydantic_core_version()
 
 
 class User(BaseModel):
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
