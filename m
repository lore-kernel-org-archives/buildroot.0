Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9395E67497
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD36D407C5;
	Sun, 21 Dec 2025 22:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hyALb8F0l1g; Sun, 21 Dec 2025 22:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6B12407BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355155;
	bh=TbHu3VJdzoZPg4OqLkUYllHrFZzaaOZ0w4Em80gMN5w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dYBQY0KEceobAJsuB9S28D9Z7ZGbxIxmfbF8h9ghsOwJtSx8qr5tNCcjp3efC1eYu
	 WoCnwWgJVUQmP9Ne094vLnsvPQsmoDklf8naZijRw6wTRNJr+CoFr/NnbEWaeioPBD
	 CvpFXZviUxvDrHylrc+xYsGvWMe82UjPpUyz4m9yayk3Sv+31RyBjsEzxtngT3zu3i
	 biPkpzFwxEwXJSH4nfbsW0ElgJfDuYRhhLJZmEgPLQp92NGZXIZyagBd3SfjYvWVGf
	 kB70IMwJk8S/mXXGHGKstd2xc5QpXqRTCXFQx/leQvO15kygEzP5s47Kcg2KCTGRKC
	 bORJ39JAKs+bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6B12407BC;
	Sun, 21 Dec 2025 22:12:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17F491A6
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48E4940778
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6X_0Ho4FMjQ for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6630C4077F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6630C4077F
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 577BB870BB; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 22:58:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b7e86bd688eb1603fd99432ed857c473ab850b7
X-Git-Newrev: a058361bb48f60199fc431004986cdd7cb2189d1
X-Patchwork-Hint: ignore
Message-Id: <20251221221227.577BB870BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump version to
 0.126.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a058361bb48f60199fc431004986cdd7cb2189d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/fastapi/fastapi/blob/0.126.0/docs/en/docs/release-notes.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 14f14a411f..6814876e50 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  8deab8ab1b623e1428e4753110295297  fastapi-0.124.4.tar.gz
-sha256  0e9422e8d6b797515f33f500309f6e1c98ee4e85563ba0f2debb282df6343763  fastapi-0.124.4.tar.gz
+md5  bbc8c95d2b4566f55b8628f4ed4bd673  fastapi-0.126.0.tar.gz
+sha256  f099fceb2a6d56dd21c59c4543d00be123dedacff869e76ae31ba3c0f963e2cd  fastapi-0.126.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 36954f8b0e..aa076779af 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.124.4
+PYTHON_FASTAPI_VERSION = 0.126.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/cd/21/ade3ff6745a82ea8ad88552b4139d27941549e4f19125879f848ac8f3c3d
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/03/6c/28773e19bc203a2f3cf1d54a8e96ca7d05b58157a350aa4d8d37f2a5ba07
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
