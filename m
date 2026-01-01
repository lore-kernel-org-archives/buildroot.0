Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7957DEEB57D
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE59881447;
	Thu,  1 Jan 2026 09:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHzx9SUe5qT6; Thu,  1 Jan 2026 09:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36B5D814EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260560;
	bh=t0wHM2IO7NR0TOLr9XQn1pkW7VGjMpj0rq06ALi7uqA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i2046TTYZYJRau6RbRXi0a+6mZR6v26cQQ3ZEL3F+8mC4Bi8sf7/hDjYurQZ4wgk8
	 MIIbNB8UozJyImvOtJKATlw/85DfblIqs07QsdqxmLZTqGnnIrTlavikx8VWmSCxOE
	 LiM7N7XU+VPNQgk16pFf+SW75zoxjIbfOdf7MvL/Looz9EQazKFduvTTlhryhCkH9j
	 ozKdJ7b4vMl+3gKpGz1vKZWFIwSuHs+ke14UdbIsSF+9NknC3sLvgIfsY3UOVr1eSC
	 h27Phx1hsb+QcQBcj+jpgzYKawrTZYdvbNh0+VTvXrz0Vmul6/a88z7BO7HdhKNQ8S
	 Abq03F8kXTqyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36B5D814EA;
	Thu,  1 Jan 2026 09:42:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CEFC206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23F3940168
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyp4WivscBXs for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A090400A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A090400A5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6827D87CDE; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:33:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a67722fc84151f70432f946aaeda7cebd96f56c
X-Git-Newrev: 02e6d7b60ff3db0461552c3cb51ef69010f6c2f2
X-Patchwork-Hint: ignore
Message-Id: <20260101094233.6827D87CDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-poetry-core: bump to
 version 2.2.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02e6d7b60ff3db0461552c3cb51ef69010f6c2f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-poetry-core/python-poetry-core.hash | 4 ++--
 package/python-poetry-core/python-poetry-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
index 888f220e96..9defacc37f 100644
--- a/package/python-poetry-core/python-poetry-core.hash
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-core/json
-md5  dd09886c53c482680536e8ce8ffd483e  poetry_core-2.2.0.tar.gz
-sha256  b4033b71b99717a942030e074fec7e3082e5fde7a8ed10f02cd2413bdf940b1f  poetry_core-2.2.0.tar.gz
+md5  a025abe2dd8d096480a87941f30d95ec  poetry_core-2.2.1.tar.gz
+sha256  97e50d8593c8729d3f49364b428583e044087ee3def1e010c6496db76bd65ac5  poetry_core-2.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
index eac7f75a9f..d3f39706dc 100644
--- a/package/python-poetry-core/python-poetry-core.mk
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_CORE_VERSION = 2.2.0
+PYTHON_POETRY_CORE_VERSION = 2.2.1
 PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
-PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/6c/73/8cc4cdc3992d9e03a749dd0ef7438093042a1ed197df8fcfc9dc9502ef0b
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/54/ef/a16c11de95b638341961765e072dfdd4c9a0be51d6b22d594c5f3255e4bb
 PYTHON_POETRY_CORE_SETUP_TYPE = pep517
 PYTHON_POETRY_CORE_LICENSE = MIT
 PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
