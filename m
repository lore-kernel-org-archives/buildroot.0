Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1059CCD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB22961302;
	Sun,  3 May 2026 14:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwEslKVg_kTx; Sun,  3 May 2026 14:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 556EF61293
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819846;
	bh=tmj83RyPoL6v2gfNOdTBJTZ+HkSQqfsZHCalvbgGtmk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BoRBpBkc5NTcPHaydOHph8D2Nzi651506b/rJJoko+a24oNsrmSIKeU7E2wiFoxKV
	 zGw3AGRhjr302qqVE91o1i45Fq+fK/+5SXnmtsRRA+zN9AIs2kPj6nfgHMHEgVu/Ts
	 aHA0EsOwYwf/f1+F96DkFOqsEqsHgztQKJJu/KeCQ3oYx1Twu9Sgzcs0cFT/cf4S9Y
	 QRBsZuDANa8Il4vsYzE1Uzf3mibDYI0x2RdIf3Kl6P1kYofF3tluA247GZvwwg1W/m
	 G+E1YoM3JjnP6kGMcvrxlBdyKFNNwZ6oEV/TDdZzxiceE6/VhpqzcnRHDgOQQwqLGY
	 g3Qn8Mktt55BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 556EF61293;
	Sun,  3 May 2026 14:50:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F8A9392
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CEC14152C
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kinfmRPgtCB1 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A75940C85
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A75940C85
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1435083E54; Sun,  3 May 2026 14:50:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2a90f9621d7350bc1f457d40c097ea5e27b46a8
X-Git-Newrev: 536875e989dcff0856b336035354210285210462
X-Patchwork-Hint: ignore
Message-Id: <20260503145025.1435083E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to version
 0.136.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/536875e989dcff0856b336035354210285210462
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://fastapi.tiangolo.com/release-notes/#01361-2026-04-23

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 30be9955fa..35988ef77c 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  470ab99de13de14ea88d7071257944f5  fastapi-0.136.0.tar.gz
-sha256  cf08e067cc66e106e102d9ba659463abfac245200752f8a5b7b1e813de4ff73e  fastapi-0.136.0.tar.gz
+md5  ce568586b56db35b344df5c23d130ada  fastapi-0.136.1.tar.gz
+sha256  7af665ad7acfa0a3baf8983d393b6b471b9da10ede59c60045f49fbc89a0fa7f  fastapi-0.136.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index b1775eff88..d99a55c754 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.136.0
+PYTHON_FASTAPI_VERSION = 0.136.1
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/4e/d9/e66315807e41e69e7f6a1b42a162dada2f249c5f06ad3f1a95f84ab336ef
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/5d/45/c130091c2dfa061bbfe3150f2a5091ef1adf149f2a8d2ae769ecaf6e99a2
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
