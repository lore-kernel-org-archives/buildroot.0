Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37FBE9A04A
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 14:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 633BF81DD8;
	Thu, 19 Feb 2026 14:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toxTHziGKr-T; Thu, 19 Feb 2026 14:43:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 829FC82684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771512207;
	bh=UTTHlMDYFBOpK6rCy8Xb64NLpSMFRtnJFc7cCTeWy74=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bkJyM93pXmqCzuJckwmb6ecuf9uVsrzG4RyMqwMptOgLFNosXXDS46gnoAbvFOEgR
	 PCfKcfoc0Oy943zVbncNjt/q0AAfnfGZhHOhw12V7wla5b9D+6DRELYIaQ5J04fLaO
	 8HAD39hDpLU2kS12xyhSAhb5SyZtcJbZclJ59SL/Y96vbh81oCL5hDJBbWZmeaUWxy
	 9P/+q3+DGMGIBj2ZkM2dtGyip1PCOaE1V1p3mwJTdyd/YRDl035SnAUhFP1ozGEbQd
	 wzCo4WrHMf52iGnw7BKrse/KbpIgV3vArbpZWh/tfdzxyf/dSJEkkOXbAaojG1BL0r
	 saO3ugb6YEehA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 829FC82684;
	Thu, 19 Feb 2026 14:43:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A40F2183
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 14:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 898244070E
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 14:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKiweJm1dB9q for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 14:43:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 884C84070B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 884C84070B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 14:43:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83B438703C; Thu, 19 Feb 2026 14:43:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 15:31:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7dfa4d3a25076361fbe8ec1ba7d4029830e93103
X-Git-Newrev: 07006bb7350b28403f59fba4e8ac0338d97698ad
X-Patchwork-Hint: ignore
Message-Id: <20260219144324.83B438703C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to version
 0.129.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07006bb7350b28403f59fba4e8ac0338d97698ad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes here: https://fastapi.tiangolo.com/release-notes//\#01290

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 4c87c1a909..9181706180 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  eb8cc0ba48ade2ac08bf55c880a69fdd  fastapi-0.128.0.tar.gz
-sha256  1cc179e1cef10a6be60ffe429f79b829dce99d8de32d7acb7e6c8dfdf7f2645a  fastapi-0.128.0.tar.gz
+md5  62d857497f46ee023ca1b7c5eb27f629  fastapi-0.129.0.tar.gz
+sha256  61315cebd2e65df5f97ec298c888f9de30430dd0612d59d6480beafbc10655af  fastapi-0.129.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 7f2ee7dd64..afb027f383 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.128.0
+PYTHON_FASTAPI_VERSION = 0.129.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/52/08/8c8508db6c7b9aae8f7175046af41baad690771c9bcde676419965e338c7
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/48/47/75f6bea02e797abff1bca968d5997793898032d9923c1935ae2efdece642
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
