Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463C9C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1FD044352;
	Mon, 20 Feb 2023 21:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1FD044352
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1NNJoG70bkI; Mon, 20 Feb 2023 21:27:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C75E6447BF;
	Mon, 20 Feb 2023 21:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C75E6447BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 027BD1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DD9B40C1A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DD9B40C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRcmkGh7RbqA for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EECA4159E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EECA4159E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C0C986494; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Dec 2022 19:44:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0c6d4d7be81ac9ea0ed031e5f0796ef2d2a28770
X-Git-Newrev: d40c8b31d50c55f6bf2536f2e3ad2af4c6dd5730
X-Patchwork-Hint: ignore
Message-Id: <20230220205154.3C0C986494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/vim: security bump to
 version 9.0.0951
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

commit: https://git.buildroot.net/buildroot/commit/?id=d40c8b31d50c55f6bf2536f2e3ad2af4c6dd5730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix CVE-2022-3705: A vulnerability was found in vim and classified as
problematic. Affected by this issue is the function qf_update_buffer of
the file quickfix.c of the component autocmd Handler. The manipulation
leads to use after free. The attack may be launched remotely. Upgrading
to version 9.0.0805 is able to address this issue. The name of the patch
is d0fab10ed2a86698937e3c3fed2f10bd9bb5e731. It is recommended to
upgrade the affected component. The identifier of this vulnerability is
VDB-212324.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index ef3bc46cdc..03ee908db4 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  f50ab9c023e7c276a61a7076c840d36254ce83691dba28af9ac5c513b6ace3b4  vim-9.0.0709.tar.gz
+sha256  c95c9abcf024bd6293ad199e4efa1c09452a9c6456c9cbaf53d896cf7b9f4d08  vim-9.0.0951.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  de04910387a62ad4f9b36b91457c8d5ef32733ac5d768a128071b93f4821fcd1  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 22c1eb91a8..d814c68630 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.0709
+VIM_VERSION = 9.0.0951
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
