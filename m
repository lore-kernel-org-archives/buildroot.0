Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945CCF3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AF8A611CC;
	Sun, 15 Mar 2026 22:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5G1Cl7S-0vs8; Sun, 15 Mar 2026 22:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57B8361431
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613185;
	bh=6xfVrYGyUB/GH/3vo0xkkwLv5n1LPQEyNJhj2DqsITE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aDIRYl8vOD5EtwqpZt9MOLi7wrvFyvqA5wzIC5ZF3tItJ9pHtNg2LHEw1j0pYJpSv
	 onYS7Ktngv7iGduyM/Gy6v5GAXufGhXQe+0ebBA9JqkNlFigF2pY2uTdLkBzzMbGG8
	 p4Zf/WS3WCdmH1kLABdNfY41zSUnrCGvfl9BLX+FNbN4UG1H8F+CO9UQH5pzZja7kn
	 BaP+V8CQOt2LV6qjHF1k4PCw4UhOya1qglVln5WKJrh7bGa/6XO7RATbN3Zzz32BZm
	 o66LYA9ZUmLrhcMtrUSVpAU4LDIDSr1iwTsji1/26WdJX3b/n1OxatwIwm67yjaxDA
	 1pOuAklUoXOGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57B8361431;
	Sun, 15 Mar 2026 22:19:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 140841B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 356D0610C3
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWoXpCHs_wA2 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3936E61092
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3936E61092
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BA08839BB; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac3633ec9ca29fc6749348b51af09e0a438f3149
X-Git-Newrev: e59cc42d2f4b4fd557ceb4fef4b7865da17bf4b7
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.7BA08839BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tornado: security bump
 version to 6.5.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e59cc42d2f4b4fd557ceb4fef4b7865da17bf4b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/tornadoweb/tornado/blob/v6.5.5/docs/releases/v6.5.5.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 53972feb09..1eebd20284 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  bf697c5e3cfb0a572192abf062e83e32  tornado-6.5.4.tar.gz
-sha256  a22fa9047405d03260b483980635f0b041989d8bcc9a313f8fe18b411d84b1d7  tornado-6.5.4.tar.gz
+md5  765aacc9cb8931aa66c8f3a83050120c  tornado-6.5.5.tar.gz
+sha256  192b8f3ea91bd7f1f50c06955416ed76c6b72f96779b962f07f911b91e8d30e9  tornado-6.5.5.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index ab2dd3a334..7b1759bbb6 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.5.4
+PYTHON_TORNADO_VERSION = 6.5.5
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/37/1d/0a336abf618272d53f62ebe274f712e213f5a03c0b2339575430b8362ef2
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/f8/f1/3173dfa4a18db4a9b03e5d55325559dab51ee653763bb8745a75af491286
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
