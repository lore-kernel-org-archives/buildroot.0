Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CB8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 21:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 257834186C;
	Sat, 21 May 2022 21:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KAWwAdPTIxhn; Sat, 21 May 2022 21:59:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C60541711;
	Sat, 21 May 2022 21:59:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13BD21BF3F9
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 21:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E35B41710
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 21:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DhKo-LuLYwiM for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 21:58:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 200BE41711
 for <buildroot@buildroot.org>; Sat, 21 May 2022 21:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AB0C685DA7; Sat, 21 May 2022 21:47:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 23:57:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f0196659019af5cc31bd5608f68cf9e476b2b747
X-Git-Newrev: 4059d9d67b17998add6970f729e0124b596e3207
X-Patchwork-Hint: ignore
Message-Id: <20220521214745.AB0C685DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/git: security
 bump to version 2.31.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4059d9d67b17998add6970f729e0124b596e3207
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issue:

 CVE-2022-24765:
  On multi-user machines, Git users might find themselves unexpectedly in
  a Git worktree, e.g. when there is a scratch space (`/scratch/`) intended
  for all users and another user created a repository in `/scratch/.git`.
  Merely having a Git-aware prompt that runs `git status` (or `git diff`)
  and navigating to a directory which is supposedly not a Git worktree, or
  opening such a directory in an editor or IDE such as VS Code or Atom, will
  potentially run commands defined by that other user via
  `/scratch/.git/config`.

https://www.openwall.com/lists/oss-security/2022/04/12/7

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 832107c6dc4b42ff35b09bfa60dddb5537821161)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 1db29ac457..5868fbffda 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  9f61417a44d5b954a5012b6f34e526a3336dcf5dd720e2bb7ada92ad8b3d6680  git-2.31.1.tar.xz
+sha256  d9167d801cf4aa2abca6e8f43d5d1b383e02e4d257ac1dc071802bb773ed0e2a  git-2.31.2.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 90b1acd6a4..0127ba5129 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.31.1
+GIT_VERSION = 2.31.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
