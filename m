Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D073BC44501
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 15:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C2D94080A;
	Mon, 13 Jul 2026 15:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_VSN6Ho7MfY; Mon, 13 Jul 2026 15:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1DCC40817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783955023;
	bh=5Rnwco3WPBoZ9RlSwE+b9ngs8fXispmXacuVA4g5E70=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sh+tKo4f83oqCGR3+btIcvqL8Oj78SdxsfPpdw9SH7sfDdxCCIqj6HmyRSk94stvd
	 MFukqDS6z1nMYUfEWTJ+JA4mSxzrmjNwwppzeHz7Lsn/nfDbV9j4Cu2rBHffQZf8oy
	 UolbaOCtdMcXup3HUaqm/MdNVP3SGMFSA5BmjQedGn7hnCU7x5GeirI4W/NOZ3k7ri
	 5wlEALkFj+jZNia6dyAf3lm7dCIrSEFFqIkcWZFD3ROPGz3EgCmzHUl2oFw08lwHiB
	 xDAIsIC4kybKNKRu8B2HMGkXiIsHDvEFpToFijqH8av1lPdo7PQ2eJrw+3qfyB+7mq
	 bq4D1v3Wzd7tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1DCC40817;
	Mon, 13 Jul 2026 15:03:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E51B928D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAB8E40817
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5w9_RLOviU3 for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 15:03:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D4834080A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D4834080A
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:03:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D33A4887D6; Mon, 13 Jul 2026 15:03:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 16:57:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 024dfbd0fb0ee38fd03965223ee94fd8d8c4ad72
X-Git-Newrev: 08c39b39852de9612e0ae9b7d4c5a8cfc6aa461a
X-Patchwork-Hint: ignore
Message-Id: <20260713150306.D33A4887D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-emailproxy: bump version to
 2026.7.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/08c39b39852de9612e0ae9b7d4c5a8cfc6aa461a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/simonrob/email-oauth2-proxy/releases/tag/2026-07-03

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-emailproxy/python-emailproxy.hash | 4 ++--
 package/python-emailproxy/python-emailproxy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-emailproxy/python-emailproxy.hash b/package/python-emailproxy/python-emailproxy.hash
index 6c534834ca..41a1f47195 100644
--- a/package/python-emailproxy/python-emailproxy.hash
+++ b/package/python-emailproxy/python-emailproxy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/emailproxy/json
-md5  8cdcbe1f2e0956facf27cf2ed160e227  emailproxy-2025.10.4.tar.gz
-sha256  28efbc446df0319d9641b0b7a35440bae91863bf70471c8cedaafbefb1b50915  emailproxy-2025.10.4.tar.gz
+md5  3585e02c8d9c827d8f5c94da4c93018d  emailproxy-2026.7.3.tar.gz
+sha256  40fbc5d46832d38f22689cb68eb40211580c75301d1192806c7e5a8daaebe9c5  emailproxy-2026.7.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-emailproxy/python-emailproxy.mk b/package/python-emailproxy/python-emailproxy.mk
index 603e58fe7c..a6dd7a85c8 100644
--- a/package/python-emailproxy/python-emailproxy.mk
+++ b/package/python-emailproxy/python-emailproxy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EMAILPROXY_VERSION = 2025.10.4
+PYTHON_EMAILPROXY_VERSION = 2026.7.3
 PYTHON_EMAILPROXY_SOURCE = emailproxy-$(PYTHON_EMAILPROXY_VERSION).tar.gz
-PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/4f/0d/045028f891c4a83ea7d616a81f0b9af8d290316eb0c958d572b6445232f9
+PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/6e/bc/51b7adf9e9f176f838cf4649ed27584b88ca5a0c8650ca75e9b432c563e0
 PYTHON_EMAILPROXY_SETUP_TYPE = setuptools
 PYTHON_EMAILPROXY_LICENSE = Apache-2.0
 PYTHON_EMAILPROXY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
