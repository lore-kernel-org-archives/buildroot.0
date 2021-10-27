Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DEBC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 10:05:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 862B960FBF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 10:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 862B960FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51B154040D;
	Wed, 27 Oct 2021 10:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFPTkPCL1G4S; Wed, 27 Oct 2021 10:05:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBBC0403E6;
	Wed, 27 Oct 2021 10:05:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A71501BF9C2
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 10:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1FB0401AE
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 10:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cfp1-OKbv8Mt for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 10:05:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFD38401A2
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 10:05:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7019188F9A; Wed, 27 Oct 2021 10:01:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 11:54:26 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 89588d3b3b3ae8e82e22c9ffbf0ade4d1b6841fc
X-Git-Newrev: 0e464e25d1fa98538e8f8197c9f2c29726dbb1f4
X-Patchwork-Hint: ignore
Message-Id: <20211027100154.7019188F9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/vim: security
 bump to version 8.2.3565
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e464e25d1fa98538e8f8197c9f2c29726dbb1f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fix CVE-2021-3872: vim is vulnerable to Heap-based Buffer Overflow
Fix CVE-2021-3875: vim is vulnerable to Heap-based Buffer Overflow

https://github.com/vim/vim/compare/v8.2.3432...v8.2.3565

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5650439b922d020cfad1131e5fb536bce73eb845)
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
