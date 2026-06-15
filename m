Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F19CD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 19:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02AF5418BC;
	Mon, 15 Jun 2026 19:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNShVgQvLx9N; Mon, 15 Jun 2026 19:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A9AE418BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781551722;
	bh=X5PX9rGJBwHee4ZiAhsHrB04lpmN6vGBw58v6dtNODI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CfdtEQj+kyqekXQtsCb/R7gFHjwSua3X4alFcZjujRtGqI0hIPgXQCImt2/L4yVIj
	 vq9PDTUoMS3HL2zs2HTxHpSXowh9tg/D29OiSwBj9ziCbRNDFmVPexIIAQ+vnhn7k+
	 zYEbG0tMDyXAy1pklIwZDJyLHPD8ba0af/BI3kfwVslkFgVIANE/FbgHZuRfdK07OE
	 eUcwP74nyhMSun6KjixV91U1WSe9VZuxPN873Q987kLp1Iew5BUk1ocCIUhe8iRBMz
	 woaMIZrwnUpQqmzd44TRB9VWTrOemmOAMwb74kGemtX5YEVj2f4bF1AZwTC2TQ+J/8
	 kZoBvqORMss5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A9AE418BD;
	Mon, 15 Jun 2026 19:28:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A92E169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C3C480980
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_FWqfy72ltg for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 19:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71BA380898
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71BA380898
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:28:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D1988835A; Mon, 15 Jun 2026 19:28:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 21:28:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca5c7817621b208cd06a00c89f580525da22da28
X-Git-Newrev: 672672e4c25ddaa1da9abc1005001dedd64b0504
X-Patchwork-Hint: ignore
Message-Id: <20260615192818.9D1988835A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{python-}protobuf: bump to version
 35.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/672672e4c25ddaa1da9abc1005001dedd64b0504
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release Notes:
https://github.com/protocolbuffers/protobuf/releases/tag/v35.0
https://github.com/protocolbuffers/protobuf/releases/tag/v35.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index be6484fb92..aaf5d77095 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  e4e6ff10760cf747a2decd1867741f561b216bd60cc4038c87564713a6da1848  protobuf-34.1.tar.gz
+sha256  f0b6838e7522a8da96126d487068c959bc624926368f3024ac8fd03abd0a1ac4  protobuf-35.1.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 4f5911e794..d4d0e3e0d0 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 34.1
+PROTOBUF_VERSION = 35.1
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 346a2f3c54..714e2cf49b 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  7d860558dfbd2762140370c391285c35  protobuf-7.34.1.tar.gz
-sha256  9ce42245e704cc5027be797c1db1eb93184d44d1cdd71811fb2d9b25ad541280  protobuf-7.34.1.tar.gz
+md5  e9074f4f40672c900f878be049f86cb8  protobuf-7.35.1.tar.gz
+sha256  ce115a26fe0c39a2c29973d914d327e516a6455464489fe3cd1e51a1b354f81a  protobuf-7.35.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 3ba1b96514..17369d1462 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = protobuf-7.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/6b/6b/a0e95cad1ad7cc3f2c6821fcab91671bd5b78bd42afb357bb4765f29bc41
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/da/01/9ef0afd7999eb9badb3a768b4aedd78c86d4c65cfaf1958ab276199e76b4
 
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
