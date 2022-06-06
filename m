Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE757C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DDC361110;
	Mon,  6 Jun 2022 12:32:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SpC9BTmZJqJw; Mon,  6 Jun 2022 12:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91D0A612B8;
	Mon,  6 Jun 2022 12:32:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 340261BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A238840E6
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UGiO-RaswY3Z for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:32:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B14448413D
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:32:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 906FE86D17; Mon,  6 Jun 2022 12:20:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 14:31:28 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fe3e50f654e510bfc769e1d1705475851637d610
X-Git-Newrev: f85b8583338e52a9fb4286000f1d19497e037cda
X-Patchwork-Hint: ignore
Message-Id: <20220606122030.906FE86D17@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/vim: security
 bump to version 8.2.4980
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

commit: https://git.buildroot.net/buildroot/commit/?id=f85b8583338e52a9fb4286000f1d19497e037cda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-1619: Heap-based Buffer Overflow in function
cmdline_erase_chars in GitHub repository vim/vim prior to 8.2.4899. This
vulnerabilities are capable of crashing software, modify memory, and
possible remote execution

Fix CVE-2022-1620: NULL Pointer Dereference in function
vim_regexec_string at regexp.c:2729 in GitHub repository vim/vim prior
to 8.2.4901. NULL Pointer Dereference in function vim_regexec_string at
regexp.c:2729 allows attackers to cause a denial of service (application
crash) via a crafted input.

Fix CVE-2022-1621: Heap buffer overflow in vim_strncpy find_word in
GitHub repository vim/vim prior to 8.2.4919. This vulnerability is
capable of crashing software, Bypass Protection Mechanism, Modify
Memory, and possible remote execution

Fix CVE-2022-1629: Buffer Over-read in function find_next_quote in
GitHub repository vim/vim prior to 8.2.4925. This vulnerabilities are
capable of crashing software, Modify Memory, and possible remote
execution

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit da66811e8e4afe205d0b45f332dea033648e986a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 1cd0de9991..9d61d6fc87 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  f2755fca3b2f47052166dd601a38411b9adbeca0d43885194db8ada4d1a171a3  vim-8.2.4843.tar.gz
+sha256  5606a3c62dba038f4c4f2eddb305ffccbae58a7bfd569bdb8100f524564c8a32  vim-8.2.4980.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index be96a08d09..9e70360b90 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4843
+VIM_VERSION = 8.2.4980
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
