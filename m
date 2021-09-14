Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA243C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 12:34:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02757610CE
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 12:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02757610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F2B8402F7;
	Tue, 14 Sep 2021 12:33:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1cjYIa4r9gH; Tue, 14 Sep 2021 12:33:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC0E04013A;
	Tue, 14 Sep 2021 12:33:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D0211BF989
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 12:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92F78607C7
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 12:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qDoDK2sqdhU for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 12:33:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D98F60707
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 12:33:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 864518B2C3; Tue, 14 Sep 2021 12:31:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 14:14:13 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: a13cff2d06a54a917a393648aff3d494ff1371b3
X-Git-Newrev: 9481e9f8af11b0922076244bdddb73583e3f9f44
X-Patchwork-Hint: ignore
Message-Id: <20210914123158.864518B2C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/vim: security
 bump to version 8.2.3432
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9481e9f8af11b0922076244bdddb73583e3f9f44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- Fix CVE-2021-3770: vim is vulnerable to Heap-based Buffer Overflow
- Update hash of README.txt due to changes not related to license:
  https://github.com/vim/vim/commit/f2a44e5c48b029666ded556e2ab052dfc1266d62
  https://github.com/vim/vim/commit/89a9c159f23fb7b3e24e6d09068adfc24a73afcb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c3198cd4148b5ee8a91f3eff07420e2d2f846d24)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 4 ++--
 package/vim/vim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index eb5928e91c..ce04e5cf5d 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8a72323817210daf40abe545bdf7637591b9b541a0fb3560baed76e436132dba  vim-8.2.0000.tar.gz
-sha256  accdbd6761e7dd7e580545fe30f3a5a7707d50073aec4b8afef85c30fc9c031b  README.txt
+sha256  12cce47b81e12779b7d58faf879633be1b668f54a5417a5a24adac50413b3b3c  vim-8.2.3432.tar.gz
+sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 36cb59331a..f1ed3c342d 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.0000
+VIM_VERSION = 8.2.3432
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
