Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3B6C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 09:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AFAC60EB4;
	Mon, 14 Mar 2022 09:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCqAy2iSR83P; Mon, 14 Mar 2022 09:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B21C060BF0;
	Mon, 14 Mar 2022 09:21:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97A031BF3CA
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 09:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 953174148A
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 09:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uO_iNNro80nh for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 09:20:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F114741487
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 09:20:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 71AD783D74; Mon, 14 Mar 2022 09:12:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 10:15:24 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: ae76fa4469a604b034082339150b986cde5687ec
X-Git-Newrev: 7b20502662e935bcdf529e66792a93c84398b2e5
X-Patchwork-Hint: ignore
Message-Id: <20220314091203.71AD783D74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/vim: security
 bump to version 8.2.4450
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b20502662e935bcdf529e66792a93c84398b2e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fix CVE-2022-0554: Use of Out-of-range Pointer Offset in GitHub
repository vim/vim prior to 8.2.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 28c9cb5ff34aa98bf2d0db63f593745db006c910)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index fa3ca53cc8..8b60b7461f 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b40b4e341de6b65cdeacd4c816dea8fe5e3b385ee5e17af73fc69c00bd7c440b  vim-8.2.4301.tar.gz
+sha256  b0a5acbe83bbdd4b1412abd9dc2ae2e3593c6cff8ff11c551fda3e6e2a87ec81  vim-8.2.4450.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 98a5f153a8..28fd33c8ef 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4301
+VIM_VERSION = 8.2.4450
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
