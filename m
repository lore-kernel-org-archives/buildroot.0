Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DEAE8FDB4
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DEDD80F12;
	Fri, 26 Dec 2025 20:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSQ6AeZns8od; Fri, 26 Dec 2025 20:29:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 566AF810FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766780974;
	bh=fLefp/30XMuFLC8icp25gARKUC76G+txJLsEQ2ODkfk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bddNIwRiwmnzS1X4SwWdiDNnyjNLN7vJS3QaV+IXkPvZa0samwYQ1X8LlihpF7fmg
	 ttDfO/nEJQZpnKXGRPQs3A0w7tD5ttLbzhdFSEWViqc3ejr1wAwHW8cZcu+fU7Z6wf
	 9Ixvya3y4gCkQ9h+x/7XdCoV00g3Kk+tWKFkkxmBlPzeuEzE61ehWdIAGRnr49C33y
	 m3mPlqmCs7dizJmiuFuuDRo+CjSeC+NFiY6GR5ZIJvwXC5ZFkvVlZAuZV9mykeWXpH
	 Gjs/t7OQHXeHUjoLbHyqZzw/kPkIJWS9UwqPjrYWmE8+axxb2NVTgbQZ+9E5rqU5hd
	 VXSAAUdK5Y13g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 566AF810FC;
	Fri, 26 Dec 2025 20:29:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E7D2B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82E91406DF
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-SAl4c2vgGd for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE81406D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBE81406D3
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:29:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB3AF87707; Fri, 26 Dec 2025 20:29:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 21:12:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b31541a840cdcd6d44b8243d535e5d4c93a0c27
X-Git-Newrev: 08aeacbce5fa215905b8ff67a218e2290031837b
X-Patchwork-Hint: ignore
Message-Id: <20251226202932.AB3AF87707@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to 0.127.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=08aeacbce5fa215905b8ff67a218e2290031837b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/fastapi/fastapi/releases/tag/0.127.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 6814876e50..a514fe09e7 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  bbc8c95d2b4566f55b8628f4ed4bd673  fastapi-0.126.0.tar.gz
-sha256  f099fceb2a6d56dd21c59c4543d00be123dedacff869e76ae31ba3c0f963e2cd  fastapi-0.126.0.tar.gz
+md5  b2126a9a8e4645e94cf07190d9a37bdd  fastapi-0.127.0.tar.gz
+sha256  5a9246e03dcd1fdb19f1396db30894867c1d630f5107dc167dcbc5ed1ea7d259  fastapi-0.127.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index aa076779af..36b892c060 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.126.0
+PYTHON_FASTAPI_VERSION = 0.127.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/03/6c/28773e19bc203a2f3cf1d54a8e96ca7d05b58157a350aa4d8d37f2a5ba07
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0c/02/2cbbecf6551e0c1a06f9b9765eb8f7ae126362fbba43babbb11b0e3b7db3
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
