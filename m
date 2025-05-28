Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14F0C3ABB2
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 19:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7840D407A2;
	Wed, 28 May 2025 19:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sh9rEUWOyI94; Wed, 28 May 2025 19:59:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AACA402DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AACA402DB;
	Wed, 28 May 2025 19:59:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45866127
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B36781BCF
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFIFYzYUILQ4 for <buildroot@buildroot.org>;
 Wed, 28 May 2025 19:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CF9481BA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CF9481BA9
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:59:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66D51876E6; Wed, 28 May 2025 19:59:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 May 2025 21:57:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0839545a9bc51792f40c46b52dac50c543a5cf4f
X-Git-Newrev: e05648d133500e57bea85092d4d08b7116df9ea6
X-Patchwork-Hint: ignore
Message-Id: <20250528195903.66D51876E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic-core: downgrade to
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e05648d133500e57bea85092d4d08b7116df9ea6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pydantic pins an exact version of pydantic-core in it's pyproject.toml
[1]. This was missed during the last pydantic bump where pydantic-core
was erroneously updated to the latest release instead, in commit [2]
and [3].

Modify the pydantic runtime test to catch this error in the future.

[1] https://github.com/pydantic/pydantic/blob/v2.11.4/pyproject.toml#L49
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/e1c939e4269130fd0ef857c63a0f752f9e5c13ec
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/e42de820cd598d6ed7045fd4f06aa1429a359e05

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Julien: add reference to commits introducing the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
