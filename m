Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C539F3028D
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDFE461224;
	Sun, 15 Mar 2026 22:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhLb98NEN6DC; Sun, 15 Mar 2026 22:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA82661226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613097;
	bh=V/QWSiXeUexXudd2JGBaUBta532OtUOJGePzqHznkdk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sheQWHpRr1Q1VsirqOTp4wzU/OdigOdnynSmDUfWSsXE8ddSaS31bxUc3ssaHLVdg
	 ubO1D0RqWEitj3VOSXqeaD3cr4ENjcj0DiCaufi5EVZXs1j378TdoSePhTqUjDYcqN
	 IgSsYt3iRTwoIxkOB+sW4EPINGTNyQx9UNuEfSBEigYgyDTMk/yqW/nfaiTG7i0pnS
	 KEUo6AHG7HjsF6ra849HXIjmqVmXBBzD6IIEBeRYz9ziu8FmIJbypuLGrdUqrnPZLH
	 VROwKOg1/Bpybr0MKyfoVvorFVyWpSPeICGga+k7V5ZDloFL1XFuC1z96+azn0A3EU
	 TgkIQBFikH/Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA82661226;
	Sun, 15 Mar 2026 22:18:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2A241B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2CC740727
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8wGEjEm9gUW for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEAE540724
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEAE540724
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D61A83F4D; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6df86418f57771419e63aceb1b6a2b2aab16ae37
X-Git-Newrev: 577a27ffcf9b4bebee81dd0d7c82236b428aa62e
X-Patchwork-Hint: ignore
Message-Id: <20260315221802.1D61A83F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markdown: bump version to
 3.10.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/577a27ffcf9b4bebee81dd0d7c82236b428aa62e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://python-markdown.github.io/changelog/#3102-2026-02-09

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index 4aa4ff7c1c..1a5aef991f 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  357bb6397bf50ee1b15f2de751a8e44f  markdown-3.10.tar.gz
-sha256  37062d4f2aa4b2b6b32aefb80faa300f82cc790cb949a35b8caede34f2b68c0e  markdown-3.10.tar.gz
+md5  ec7bae2cc261dcb2c9a27271b60d40d4  markdown-3.10.2.tar.gz
+sha256  994d51325d25ad8aa7ce4ebaec003febcce822c3f8c911e3b17c52f7f589f950  markdown-3.10.2.tar.gz
 # Locally computed sha256 checksums
 sha256  7ba4eb6d10b32b2d11dce13821340351cdbbb30ba8ccc67841db2ffd86e79aca  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 2dc699c22f..0abcae709e 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.10
+PYTHON_MARKDOWN_VERSION = 3.10.2
 PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/7d/ab/7dd27d9d863b3376fcf23a5a13cb5d024aed1db46f963f1b5735ae43b3be
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/2b/f4/69fa6ed85ae003c2378ffa8f6d2e3234662abd02c10d216c0ba96081a238
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
