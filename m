Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3AAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DBFC60FA1;
	Thu, 14 Apr 2022 20:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQSLUDFidUiA; Thu, 14 Apr 2022 20:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7614960AB0;
	Thu, 14 Apr 2022 20:15:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04C021BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E524481365
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QfJ-R3FpQ9gg for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:14:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29CA38136A
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:14:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CA11783D02; Thu, 14 Apr 2022 20:04:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 22:14:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b2d97780d98763aaa7953776a3d6b9e887b7f8d
X-Git-Newrev: 832107c6dc4b42ff35b09bfa60dddb5537821161
X-Patchwork-Hint: ignore
Message-Id: <20220414200445.CA11783D02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/git: security bump to version
 2.31.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=832107c6dc4b42ff35b09bfa60dddb5537821161
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
