Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59644C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AD3341BE9;
	Thu, 28 Apr 2022 21:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofG4MXftta7M; Thu, 28 Apr 2022 21:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9569419B2;
	Thu, 28 Apr 2022 21:38:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAF9A1C115D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B811E400E3
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p7rDKHjbdeJy for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:38:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1728A40004
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:38:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E78DB846EB; Thu, 28 Apr 2022 21:27:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 23:36:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e57a4e0c75e6127addf62652ba57e52b2df2a83e
X-Git-Newrev: 8c76fc9d1ccf623a8dad4d845a371bb5936e38d4
X-Patchwork-Hint: ignore
Message-Id: <20220428212755.E78DB846EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: security bump to version
 8.2.4843
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8c76fc9d1ccf623a8dad4d845a371bb5936e38d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-1381: global heap buffer overflow in skip_range in GitHub
repository vim/vim prior to 8.2.4763. This vulnerability is capable of
crashing software, Bypass Protection Mechanism, Modify Memory, and
possible remote execution

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index d55b1ea355..1cd0de9991 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  ccd57b074326b2faa15591eba3c86dcc07e53781079c44a0354436b8c4fe9b70  vim-8.2.4732.tar.gz
+sha256  f2755fca3b2f47052166dd601a38411b9adbeca0d43885194db8ada4d1a171a3  vim-8.2.4843.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 4eb659fd6e..be96a08d09 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4732
+VIM_VERSION = 8.2.4843
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
