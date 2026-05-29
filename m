Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D67CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D09DD80E67;
	Fri, 29 May 2026 18:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuy3CvulMkCh; Fri, 29 May 2026 18:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F02768457A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780078991;
	bh=uzAm38BSsW2gGDafulAh0xpY+JtRgjPiVl/lYjCT17g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Jodga0MvKj10/mN8w97Kqh4XZ8/77tbCE0Ja6v32QK5c9shYsg7IvearIJvcbrVNA
	 8rqe8NLYCuu6ap/pzixj4arhimM05OWh1WfVde0EuM+qYJe0t9Us3iNl0qskuZqgCw
	 +65tlpdbGkZYxViMZUYNfzirWLUyv7HJGaZUhgEaygMEHKqrpnB/Zr4vuX8sz/J93c
	 OB3D9+NpuGLiQjoACenOOCgLNum84ugl9PtuszJDH0H0VtcOmjtPzavyGAJuUndoaX
	 7X5LpvKcgJiMEajEgY/SsAPrFy1hWxIAfTCOlASAlXVjzDYStxscWJwkO5VVldKw5b
	 61QfTJf/752SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F02768457A;
	Fri, 29 May 2026 18:23:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AD591288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BAF94240B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywFz3IdiL-Kc for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:23:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D7B74240A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D7B74240A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:23:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D11E987413; Fri, 29 May 2026 18:22:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:18:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0c2e0f1e9821c2e96b5060d003e773464ded62c2
X-Git-Newrev: f0b43038a3a743156e4cbe447e54199c765d2ad8
X-Patchwork-Hint: ignore
Message-Id: <20260529182254.D11E987413@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-fastapi: bump
 to version 0.136.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f0b43038a3a743156e4cbe447e54199c765d2ad8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Add python-typing-inspection runtime dependency. This was added to
fastapi as a dependency in 0.128.2[1] but in practice this doesn't break
anything as fastapi depends on pydantic which already has a dependency
on typing-inspection.

Release Notes:
* https://fastapi.tiangolo.com/release-notes/#01362-2026-05-23
* https://fastapi.tiangolo.com/release-notes/#01363-2026-05-23

[1] https://github.com/fastapi/fastapi/commit/97145588f5442aa7c3830173813d5d1a2c893521

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Marcus: clarify when the dependency was added to fastapi, add release
         notes]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-fastapi/Config.in           | 1 +
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
index 0dd4499a3f..01163c60f5 100644
--- a/package/python-fastapi/Config.in
+++ b/package/python-fastapi/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_FASTAPI
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
 	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_INSPECTION # runtime
 	help
 	  FastAPI framework, high performance, easy to learn, fast to
 	  code, ready for production.
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 35988ef77c..3882212eed 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  ce568586b56db35b344df5c23d130ada  fastapi-0.136.1.tar.gz
-sha256  7af665ad7acfa0a3baf8983d393b6b471b9da10ede59c60045f49fbc89a0fa7f  fastapi-0.136.1.tar.gz
+md5  5e22f728ab9ea5c99a29a0137b4b8b55  fastapi-0.136.3.tar.gz
+sha256  e487fae93ad408e6f47641ee4dfe389864fd7bec92e547ea8498fc13f43e83ab  fastapi-0.136.3.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index d99a55c754..60e0a83369 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.136.1
+PYTHON_FASTAPI_VERSION = 0.136.3
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/5d/45/c130091c2dfa061bbfe3150f2a5091ef1adf149f2a8d2ae769ecaf6e99a2
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/81/2d/ff8d91d7b564d464629a0fd50a4489c97fcb836ac230bf3a7269232a9b1f
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
