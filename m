Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C678F3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27DC361490;
	Sun, 15 Mar 2026 22:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJ_YJ2PKGzwK; Sun, 15 Mar 2026 22:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37E2A61451
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613191;
	bh=WMLhvd2YirijPGf79bsG3h1PnLuEjtWc6JPgMB3PVoE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P0SU3rMTLOXHAikonjI5B+4AKkekfoqDDA6ojJ6pL9D00ix1CEQnY6mUgP4MTH/Gp
	 NqofLhKmjK7YYvOoRafZZ4Ql7uTHC0caO09+A9/JDoiTVYTvDiU92ntafVVAXynpUw
	 MNP6doi3bFH6bx+kfRErAZlmUEilcXBMCByfqRp3jHb380SAw4RphD7LTfiZMvOBFM
	 xb/Z9VMEIJwr9L2AmiVA38xCi7OblxIb8qjim6B6h87PcyeYoF+IxyXVKYAm2Hq7Kx
	 njoIDi83p9FQXFBzEee3rODFkCh2JSOpnf6m3Gleyl4A2B4a4GdwsBiE+III0MjVN2
	 DnTpzrCHNu74w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E2A61451;
	Sun, 15 Mar 2026 22:19:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 116C5357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7717E6108B
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N397EV9i-qOE for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDCED61128
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDCED61128
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B9997FE0B; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29bc88d4fb42ffaa561bc9fa7891325c551496a4
X-Git-Newrev: 87ae6583755e2e9b257a0b35dbbf9b8720252e67
X-Patchwork-Hint: ignore
Message-Id: <20260315221805.2B9997FE0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-websockets: bump version to
 16.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87ae6583755e2e9b257a0b35dbbf9b8720252e67
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/python-websockets/websockets/blob/16.0/docs/project/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 13659d2634..448aa69e19 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  08f8a430c20d75ffe44faafb95f6f7cc  websockets-15.0.1.tar.gz
-sha256  82544de02076bafba038ce055ee6412d68da13ab47f0c60cab827346de828dee  websockets-15.0.1.tar.gz
+md5  eca5d5bbef505b977ea84d6799f8fa89  websockets-16.0.tar.gz
+sha256  5f6261a5e56e8d5c42a4497b364ea24d94d9563e8fbd44e78ac40879c60179b5  websockets-16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index cdac2485ab..b7b8d26e2b 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 15.0.1
+PYTHON_WEBSOCKETS_VERSION = 16.0
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/21/e6/26d09fab466b7ca9c7737474c52be4f76a40301b08362eb2dbc19dcc16c1
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/04/24/4b2031d72e840ce4c1ccb255f693b15c334757fc50023e4db9537080b8c4
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
