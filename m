Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACC1C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 21:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 441C883BF8;
	Fri,  1 Mar 2024 21:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VFqSfQL6VVgQ; Fri,  1 Mar 2024 21:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D22483C00
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D22483C00;
	Fri,  1 Mar 2024 21:04:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2FCC1BF2EF
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2085741FB2
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-caKNR6HULg for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 21:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 153BF41F8E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 153BF41F8E
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 21:04:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CFD587E29; Fri,  1 Mar 2024 21:04:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 22:01:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d5e2a87760467595f7086d89671563f61fd3acb
X-Git-Newrev: ef65c4f90b3be448c50d210c39baf07fefc1d282
X-Patchwork-Hint: ignore
Message-Id: <20240301210411.0CFD587E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: security bump to version
 9.1.0145
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef65c4f90b3be448c50d210c39baf07fefc1d282
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2024-22667: Vim before 9.0.2142 has a stack-based buffer
overflow because did_set_langmap in map.c calls sprintf to write to the
error buffer that is passed down to the option callback functions.

Update hash of README.txt (version number updated with
https://github.com/vim/vim/commit/b4ddc6c11e95cef4b372e239871fae1c8d4f72b6)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 4 ++--
 package/vim/vim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 4ff64bada2..194bcb4378 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d826682fb839c0b99f80b9189af549d46dc087ef2cfc617ce161609ba5da4dc7  vim-9.0.2136.tar.gz
+sha256  0056537cb57190aa41c12ba6c2ad04ce10e7f714cde4c1fe7193a37e1c44db46  vim-9.1.0145.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
-sha256  b475d5d3f8c855dc1a84813bbe45c44054d7f7aee20c800950bf89d5958873de  README.txt
+sha256  7a2f621c8496396dae5eecdcc4dccff9d534dff4627193d3ebf7fa6d2cb27042  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index b0b4ffe344..fb8062e1fa 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.2136
+VIM_VERSION = 9.1.0145
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
