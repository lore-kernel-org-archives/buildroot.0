Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593AAF3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C51741456;
	Sun, 15 Mar 2026 22:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxj7-ooviWPv; Sun, 15 Mar 2026 22:18:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6024441457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613131;
	bh=EDXTXQDZRvFg8UEgtEzBjHt08AGTvRKJFrZzlTAW3wg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QD4ZwlOvPNdLlLkY+fqzCCjS2pLbe+dr+dNc9C2m5Q/mIW+IAHu4sWZNvg6Yk3WOI
	 6SomGj74YpBpsG/inFYOwEjQE4DBx5Bxk/M68ajEkjiDV6rAfWywSs5x3IZm7Wv3Pq
	 qP03qTkCY/cSYcTus+CO5dzz0auZ32rO1Q3/T/4MDvD7QmI0M3WAWbDdjZltFWFxTv
	 9bOw8YoggtUlhY0K1WMWZro4ozPuoqN5wWFg4cYyrQIsLa0XxjuEVaOFqhTKFqokuY
	 vfrjnWfrjxoV3le2OLad393hFFnAKow2wYq+SxbD0M539Yg9iY8sLR/1xsIqM5iCFN
	 pYfAeF4rMvLvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6024441457;
	Sun, 15 Mar 2026 22:18:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03E321B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40B51610D8
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id er80tb6wQQxC for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33BB86108C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33BB86108C
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75F4F83F4D; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4e8a593456aca733674d1433bde4c693705ecd7
X-Git-Newrev: 256359467cc43999cb47a7ffbdb3db573d581e46
X-Patchwork-Hint: ignore
Message-Id: <20260315221802.75F4F83F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pdm-backend: bump version
 to 2.4.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/256359467cc43999cb47a7ffbdb3db573d581e46
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pdm-project/pdm-backend/releases/tag/2.4.7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pdm-backend/python-pdm-backend.hash | 4 ++--
 package/python-pdm-backend/python-pdm-backend.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
index 83e275c032..c856d1e818 100644
--- a/package/python-pdm-backend/python-pdm-backend.hash
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pdm-backend/json
-md5  63dd231ba6206cc834b205694208df40  pdm_backend-2.4.6.tar.gz
-sha256  5dd9cd581a4f18d57ff506a5b3aad7c8df31e5949b6fd854bbc34c38107e4532  pdm_backend-2.4.6.tar.gz
+md5  f51ca7c104f47dac6b31dc51255fab19  pdm_backend-2.4.7.tar.gz
+sha256  a509d083850378ce919d41e7a2faddfc57a1764d376913c66731125d6b14110f  pdm_backend-2.4.7.tar.gz
 # Locally computed sha256 checksums
 sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
index 4f30f8a909..c3cfeb6f73 100644
--- a/package/python-pdm-backend/python-pdm-backend.mk
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PDM_BACKEND_VERSION = 2.4.6
+PYTHON_PDM_BACKEND_VERSION = 2.4.7
 PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
-PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/71/fc/15b83c93a8e7929b62debaad63a3e89b8ce7f8a86075bda0d81e42c3cad5
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/e2/38/d22c1050130b8cdf16fef76c99c59968086802744947f2813d45c69cca52
 PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
 PYTHON_PDM_BACKEND_LICENSE = MIT
 PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
