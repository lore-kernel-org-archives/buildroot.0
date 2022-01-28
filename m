Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7030EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18F7340B1F;
	Fri, 28 Jan 2022 21:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4BdR0OcUI3k; Fri, 28 Jan 2022 21:19:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21FF140B6B;
	Fri, 28 Jan 2022 21:19:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66F021BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62D9240B1F
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7HtQLXsrORs for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:19:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8199D40B6B
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:19:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AD7BC82B50; Fri, 28 Jan 2022 21:12:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 22:14:55 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e81847715fb0e43cd79ef170d22e94938e16c9ef
X-Git-Newrev: b26a86ffa2e7dd1a2896e0717b890fb8f309046f
X-Patchwork-Hint: ignore
Message-Id: <20220128211207.AD7BC82B50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/vim: security
 bump to version 8.2.4224
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

commit: https://git.buildroot.net/buildroot/commit/?id=b26a86ffa2e7dd1a2896e0717b890fb8f309046f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2022-0261: Heap-based Buffer Overflow in GitHub repository
vim/vim prior to 8.2.4120

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d3da56369c75473ee3fac768b86382adcdec3f76)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index fff5072063..49056b31cd 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2464110940c3d8d53bfef6d16912653c85187132fc0f87e937a382cafc4c6370  vim-8.2.4092.tar.gz
+sha256  8770c6308a6c0b0f8b93a4d7202451d195b4efad17787c0306f0be60947732c4  vim-8.2.4224.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 408b33a409..74ab1ec584 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4092
+VIM_VERSION = 8.2.4224
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
