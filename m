Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE8AD68BC1
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65F1061125;
	Wed, 17 Dec 2025 21:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pie1rZyEFBq; Wed, 17 Dec 2025 21:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70B5D61149
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007891;
	bh=ayUydbF9c8kXyooSgJqCkjHJwH6u02qFKoPgWru0xiQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sv9Zo3pTe8sQnNyX54G7NccXCpc4ZlRaF82dqwz3hbMOHtswAQ1FnNLjQfyQ3gIKT
	 RxTEBMOeLRw+xtCD1CZfvQ/e2W7WVdO3Eqd+fVnMcRA+ohFecnAibCqz3tqn6d1iua
	 +wEmxgytYyy8ZZYsAohbs8MQQfA5/yZ/eK+7Ico6HhlijJTn3M7Veibpm9jG7fTthL
	 pDbef6gvB8cXq8Csk+hqlSVT1yYEeltr33Ywb6FbbdiVGuTEor0FOg0V7ufaAqoMUC
	 cU97/4I4CPjoYMw+w9CPya7IDKdsqIN08pMq2496XG3PmeIomBpiw2mldY7OBGSAkA
	 3CwUbFGUQozhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70B5D61149;
	Wed, 17 Dec 2025 21:44:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22CD9361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 096D140F72
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iz3FcZJTrCOh for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27EEF401A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27EEF401A0
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18146848DA; Wed, 17 Dec 2025 21:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:04:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6298cd050478b42a968d9d505eede3da768391e
X-Git-Newrev: e0cea7186f194a848c723a1ee143afc97f7b9de0
X-Patchwork-Hint: ignore
Message-Id: <20251217214449.18146848DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-soupsieve: bump version to
 2.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0cea7186f194a848c723a1ee143afc97f7b9de0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/facelessuser/soupsieve/blob/2.8/docs/src/markdown/about/changelog.md

Updated license hash due to copyright year bump:
https://github.com/facelessuser/soupsieve/commit/a616022df73ddc5ecb71092155be9baba876b52d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-soupsieve/python-soupsieve.hash | 6 +++---
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index d220c8c772..8dbcd237f7 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  19126989f90d775ebe752b7fcacf1fc5  soupsieve-2.6.tar.gz
-sha256  e2e68417777af359ec65daac1057404a3c8a5455bb8abc36f1a9866ab1a51abb  soupsieve-2.6.tar.gz
+md5  111f637c4017009883667bea09b0a442  soupsieve-2.8.tar.gz
+sha256  e2dd4a40a628cb5f28f6d4b0db8800b8f581b65bb380b97de22ba5ca8d72572f  soupsieve-2.8.tar.gz
 # Locally computed sha256 checksums
-sha256  7e1f14c81e9939ef23b472176cda08410cc238752d180abaa0151d8a1c48f594  LICENSE.md
+sha256  571d0dafef795a196a0bbc3ac9b160a06b3cad41c320fecd98da3e26a8c81971  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index b37d552fe1..cec1b63b19 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 2.6
+PYTHON_SOUPSIEVE_VERSION = 2.8
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/d7/ce/fbaeed4f9fb8b2daa961f90591662df6a86c1abf25c548329a86920aedfb
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/6d/e6/21ccce3262dd4889aa3332e5a119a3491a95e8f60939870a3a035aabac0d
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
