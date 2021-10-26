Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4535EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:36:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D5960E05
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09D5960E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D80E84051E;
	Tue, 26 Oct 2021 18:36:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVLmYrYm6hwl; Tue, 26 Oct 2021 18:36:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 300D240545;
	Tue, 26 Oct 2021 18:36:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 886131BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70EE980DC8
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1w6-68Sxd6M for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 18:36:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC83D80E3D
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 18:36:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0325C88E95; Tue, 26 Oct 2021 18:32:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 20:35:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f5ed26e1851e752a254d23101b0e97bbe2e5217
X-Git-Newrev: 5650439b922d020cfad1131e5fb536bce73eb845
X-Patchwork-Hint: ignore
Message-Id: <20211026183254.0325C88E95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: security bump to version
 8.2.3565
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

commit: https://git.buildroot.net/buildroot/commit/?id=5650439b922d020cfad1131e5fb536bce73eb845
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-3872: vim is vulnerable to Heap-based Buffer Overflow
Fix CVE-2021-3875: vim is vulnerable to Heap-based Buffer Overflow

https://github.com/vim/vim/compare/v8.2.3432...v8.2.3565

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 8dad275f49..bbe65c4dda 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  12cce47b81e12779b7d58faf879633be1b668f54a5417a5a24adac50413b3b3c  vim-8.2.3432.tar.gz
+sha256  ac2264c45684218232ec49a6ae8b88b9a68312b664b93b811868d24c39d8dc11  vim-8.2.3565.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index a94dab4bd7..960759aab4 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.3432
+VIM_VERSION = 8.2.3565
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
