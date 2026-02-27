Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C891FEFB7F
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 19:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5674B60BB1;
	Fri, 27 Feb 2026 19:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paMZ9acuV7x5; Fri, 27 Feb 2026 19:28:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 853D960BB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772220496;
	bh=TFoLh30p98cGCjHb17uMGjP8Fmk/3dZgydLjuTidl9g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kH6gEbGQRrBELlr1ftSwkZaL1SpESRhBXU6LsLZXTennunH45/grmg1YE8l71Lkwk
	 2Ho6qA57ODBuCBv1AC+zI+NuhT+Q0M/rmKSNFijWLcG8NyZ7K+4KMpE/E3yZGqgF2L
	 W9tEW8fTEDcBir5YdKkOuFDmWyBr0gCRksX+knUlCrXqHI1AQB555MAwjAGZPaPG2u
	 IdAClluYrORiVdAgYjUADN+rtmh1Lc/fNShmbssrMWvjpMc/zW+jCjtWdbFXzFCrig
	 zj8YFvJfnG7R0g9x/JT5X7g25g0psOlu55zhEWOov3wurEN9Ztd/Y5GsjhMuRjYwT7
	 5QT83JxfdAomQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 853D960BB6;
	Fri, 27 Feb 2026 19:28:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B8311F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D91E83231
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXWmrj66bFFQ for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 19:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF67E8322A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF67E8322A
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:28:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 976AF846E0; Fri, 27 Feb 2026 19:28:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Feb 2026 20:25:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fcfe01d70cb0f8f350cd6bb1bda914fc7fc8609
X-Git-Newrev: fbdabe5fda6573fb90571e0188ffaed5dc16dea9
X-Patchwork-Hint: ignore
Message-Id: <20260227192813.976AF846E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wlroots: bump version to 0.19.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fbdabe5fda6573fb90571e0188ffaed5dc16dea9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wlroots/wlroots.hash | 4 ++--
 package/wlroots/wlroots.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 77d5c4552b..37ac909693 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.0/downloads/wlroots-0.19.0.tar.gz.sig
+# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.2/downloads/wlroots-0.19.2.tar.gz.sig
 # with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  aefb0fe2633b0aad1d66123b2f41afab004fb625e2a7790492cdd39a805cac91  wlroots-0.19.0.tar.gz
+sha256  09a0a8d60104c8b0772fee4f60ba76a89aed7e59dff7659d00960fba06bdf267  wlroots-0.19.2.tar.gz
 
 # Hashes for license files:
 sha256  35d427c043dcafe8893b9e7247348f599847c81d9a067703587c80707f3d58df  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index babadea94f..bd2e0eb561 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.19.0
+WLROOTS_VERSION = 0.19.2
 WLROOTS_SITE = https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
