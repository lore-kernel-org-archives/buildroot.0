Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B59CD342F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAA6E6124C;
	Sun,  3 May 2026 14:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKpMwi9hX6Gc; Sun,  3 May 2026 14:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A2876124D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819823;
	bh=aJBNb6nx8pm7i9HVL+iVsBYZcUJCvhin0cZR2LQOGR0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YNXaP4jECeY3lK3y9fZmN17hRfdy9FIP2hCIhzIjth1+HPE1ctqP1A49TltY5H2Xe
	 36+XsrdO7hNlynxrn4t4u15wvPZq/v6PHXJXMMCHYGNTpoJAptbbOXUMNXBQb3iiX5
	 Qys52kG4Fmewowk8+C7moOfXxnSofXmg3XK/MkfDYoZiA6HY6+25L6naKj+fSzVSKr
	 S6kUwnuxXSZCnsjGEYazq4KB6YJqdxtoxQ1wnKagSmebKc5F1u9pTcoqqwtC/OxNY9
	 Mmv5+sobeG/VOs0ADOYlVld8QHgrbG+vrevLPx41vTR54whAQCcvxQmrZd7P5WVaKn
	 p3KXRuxONHCYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A2876124D;
	Sun,  3 May 2026 14:50:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5335B190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A1858409F
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zivynKhXNMtv for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ADBA8409B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ADBA8409B
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2788F7FDF8; Sun,  3 May 2026 14:50:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06139187848e799aaed224c392d5cc3015b1a381
X-Git-Newrev: e3491e3e58826561da13d5448c1011411d0f57aa
X-Patchwork-Hint: ignore
Message-Id: <20260503145018.2788F7FDF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-anyio: bump to 4.13.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3491e3e58826561da13d5448c1011411d0f57aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://anyio.readthedocs.io/en/stable/versionhistory.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index d25c1a2bad..8bd80e86fb 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  10e3ba7d02402b6605d834a1e4881a1d  anyio-4.12.1.tar.gz
-sha256  41cfcc3a4c85d3f05c932da7c26d0201ac36f72abd4435ba90d0464a3ffed703  anyio-4.12.1.tar.gz
+md5  790c9bef76fdeac4c2e4e4ea757e14ab  anyio-4.13.0.tar.gz
+sha256  334b70e641fd2221c1505b3890c69882fe4a2df910cba14d97019b90b24439dc  anyio-4.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 32b4a84ef1..4cd435e265 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.12.1
+PYTHON_ANYIO_VERSION = 4.13.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/96/f0/5eb65b2bb0d09ac6776f2eb54adee6abe8228ea05b20a5ad0e4945de8aac
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/19/14/2c5dd9f512b66549ae92767a9c7b330ae88e1932ca57876909410251fe13
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
