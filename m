Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C428F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 502BA61310;
	Sun, 15 Mar 2026 22:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48I-xaB_K8t0; Sun, 15 Mar 2026 22:19:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE7B861195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613144;
	bh=am5KWlOs/QhRwG+K3ydD+UBgwqoUOtlasADmu7NSWpY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Luf5m8VEFBXAo9OmdMofgnaFF5MT+sc3WdhtSIQUOa9T4/vCLtAhzs7KwK57kjd7D
	 yQEi3NLHnGUffhFfynvQD3sEFubDSKzn0EA74t+1L/Z1HFdR5eBffCCkN4LbkPIWi2
	 h+ydLqkTmei/r3kX+41DvT5D4tLyuJSZ2ZGf0fl8iys0gFuYR1r/3nPbyvgeKjTdUP
	 GhegUr800OV5Lk/1FIyaFVCctIKRqQzKS0YY49EYLLno/buqpxC09C897zrOj5owcP
	 x3gjt2hKmMrZJ4qFYs7tW3ql3Rew1aGZh2dRLR/f8RvnhOs6R4ClpCkQXx+ccckirR
	 A9m5A846qLqPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE7B861195;
	Sun, 15 Mar 2026 22:19:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E52D1B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D923861165
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5oPzsYeNvkj for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66D31610A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66D31610A5
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A91F185C3A; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e212fc12c60f734f958b850b6d9a8db6bdb9d066
X-Git-Newrev: 8c7c777de057215e3ff8e4bcfa4360c35dcdee46
X-Patchwork-Hint: ignore
Message-Id: <20260315221802.A91F185C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-poetry-core: bump version
 to 2.3.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c7c777de057215e3ff8e4bcfa4360c35dcdee46
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/python-poetry/poetry-core/blob/2.3.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-poetry-core/python-poetry-core.hash | 4 ++--
 package/python-poetry-core/python-poetry-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
index 9defacc37f..915a8900ce 100644
--- a/package/python-poetry-core/python-poetry-core.hash
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-core/json
-md5  a025abe2dd8d096480a87941f30d95ec  poetry_core-2.2.1.tar.gz
-sha256  97e50d8593c8729d3f49364b428583e044087ee3def1e010c6496db76bd65ac5  poetry_core-2.2.1.tar.gz
+md5  c2595d34582ba92b5c90df411f3ecddb  poetry_core-2.3.1.tar.gz
+sha256  96f791d5d7d4e040f3983d76779425cf9532690e2756a24fd5ca0f86af19ef82  poetry_core-2.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
index d3f39706dc..0354c44822 100644
--- a/package/python-poetry-core/python-poetry-core.mk
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_CORE_VERSION = 2.2.1
+PYTHON_POETRY_CORE_VERSION = 2.3.1
 PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
-PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/54/ef/a16c11de95b638341961765e072dfdd4c9a0be51d6b22d594c5f3255e4bb
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/39/46/7cc89b6ef47803528673585bfa40fa729a7050d9eaedeb7e7f5816300c88
 PYTHON_POETRY_CORE_SETUP_TYPE = pep517
 PYTHON_POETRY_CORE_LICENSE = MIT
 PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
