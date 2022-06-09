Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7950C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADFDB8426F;
	Thu,  9 Jun 2022 20:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTFNxfh4kaxm; Thu,  9 Jun 2022 20:36:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA6008425F;
	Thu,  9 Jun 2022 20:36:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 794EC1BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 718B641B73
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dszxdtxC5-VB for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:35:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 664F241C2F
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:35:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 99BB686ED0; Thu,  9 Jun 2022 20:23:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:32:01 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 86ff2cb992d92f04ed07455443ca7229a1e24e4c
X-Git-Newrev: 9d774240eeaa7b475d70d3015b38435c00f4518a
X-Patchwork-Hint: ignore
Message-Id: <20220609202328.99BB686ED0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/vim: security
 bump to version 8.2.5062
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d774240eeaa7b475d70d3015b38435c00f4518a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-1851: Out-of-bounds Read in GitHub repository vim/vim prior
to 8.2.

Fix CVE-2022-1886: Heap-based Buffer Overflow in GitHub repository
vim/vim prior to 8.2.

Fix CVE-2022-1898: Use After Free in GitHub repository vim/vim prior to
8.2.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a1dafa1b04fff04b238be8dbe5543f366062d2d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 9d61d6fc87..55e5643b90 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  5606a3c62dba038f4c4f2eddb305ffccbae58a7bfd569bdb8100f524564c8a32  vim-8.2.4980.tar.gz
+sha256  3052bc702cfb49571dbcf9824827ae6032c37c7bf1a2aa0d3f7cc18c8f085dfb  vim-8.2.5062.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 9e70360b90..6dbb32d27b 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4980
+VIM_VERSION = 8.2.5062
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
