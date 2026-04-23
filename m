Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8B4FDEE47
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 20:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D177A83DBB;
	Thu, 23 Apr 2026 20:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1SkCHZo6zXv; Thu, 23 Apr 2026 20:03:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE3AE83DBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776974617;
	bh=YEN5/pt9/lobG9cCs1tnhivThf9r8T+JHMW3PM+YPZk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=joYxE2afBway7rozslmHxywpBbRl5YeR2OFjqGCjgR9M0zaOfL26JHrt0mQSmZMPd
	 t8zO05dt/0lRlfjILlIGSvbdKTNYDTxJo20xlyxQQ3qQwd8k7TOt1a65qZc+JZVYiC
	 sN48d2SfbAWvaS9OlNQQ5xN+nVTdVNrX4wjtozTSXYimr9aaCfSZrmakV5fvExf6ef
	 703eKGD9dzCoWLJh5z50oGHvZ5IPVbB8Uh/YA9qaS/vtiKJePPMnQZGuVJLdALd23Y
	 8mpkp1xVZUsZfyDarROGEk1xt3WpEf10Svi5T81D0hmL5c4729aFJiAfk+kgTcRMjn
	 2pu3hj0O95IMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE3AE83DBC;
	Thu, 23 Apr 2026 20:03:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25F3F206
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 116EF83DBC
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xy0HuNMzUt2 for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 20:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F31A183DBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F31A183DBB
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:03:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A43FD8285C; Thu, 23 Apr 2026 20:03:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 21:55:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7dcf9e5af0cc0c7afd3e887f7731d855aa39094
X-Git-Newrev: 757bf45a57eb4662d0a9b6d3e0cb38198d118149
X-Patchwork-Hint: ignore
Message-Id: <20260423200335.A43FD8285C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to version
 0.136.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/757bf45a57eb4662d0a9b6d3e0cb38198d118149
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This includes the following releases with the release-notes:
- 0.135.2: https://fastapi.tiangolo.com/release-notes/#01352-2026-03-01
- 0.135.3: https://fastapi.tiangolo.com/release-notes/#01353-2026-04-01
- 0.135.4: https://fastapi.tiangolo.com/release-notes/#01354-2026-04-16
- 0.136.0: https://fastapi.tiangolo.com/release-notes/#01360-2026-04-16

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 1a2305db5b..30be9955fa 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  2715eac2931aa6e53a0507d8574c1901  fastapi-0.135.1.tar.gz
-sha256  d04115b508d936d254cea545b7312ecaa58a7b3a0f84952535b4c9afae7668cd  fastapi-0.135.1.tar.gz
+md5  470ab99de13de14ea88d7071257944f5  fastapi-0.136.0.tar.gz
+sha256  cf08e067cc66e106e102d9ba659463abfac245200752f8a5b7b1e813de4ff73e  fastapi-0.136.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 6aa70f2f2a..b1775eff88 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.135.1
+PYTHON_FASTAPI_VERSION = 0.136.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/e7/7b/f8e0211e9380f7195ba3f3d40c292594fd81ba8ec4629e3854c353aaca45
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/4e/d9/e66315807e41e69e7f6a1b42a162dada2f249c5f06ad3f1a95f84ab336ef
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
