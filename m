Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BC8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CBB04187B;
	Mon, 30 May 2022 20:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HrMn8MJJDOZn; Mon, 30 May 2022 20:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4321741706;
	Mon, 30 May 2022 20:55:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF311BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18B7441706
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kJpW8J4eAMPW for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:55:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A07A41702
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 26CB486803; Mon, 30 May 2022 20:44:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 22:54:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db14515e879e550fde617e2baa24c40f4694ecb8
X-Git-Newrev: da66811e8e4afe205d0b45f332dea033648e986a
X-Patchwork-Hint: ignore
Message-Id: <20220530204404.26CB486803@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: security bump to version
 8.2.4980
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

commit: https://git.buildroot.net/buildroot/commit/?id=da66811e8e4afe205d0b45f332dea033648e986a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
