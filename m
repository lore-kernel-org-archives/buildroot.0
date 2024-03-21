Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574B6C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20F6482BE7;
	Thu, 21 Mar 2024 21:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfT-QMu1Vs_z; Thu, 21 Mar 2024 21:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C2D682BBC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C2D682BBC;
	Thu, 21 Mar 2024 21:05:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0004E1BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8410A6084E
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJEB7Jnz7Zzi for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB0F06085E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB0F06085E
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 996FA837B1; Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:28:54 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: a442714e74ac79f631b47a910f8c8ee12eb8844f
X-Git-Newrev: 5d36747c709609551a4876fb63380e6863dc4086
X-Patchwork-Hint: ignore
Message-Id: <20240321210326.996FA837B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libgit2: bump
 version to 1.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d36747c709609551a4876fb63380e6863dc4086
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

* Remove patch applied upstream.
* Upstream fixed building inside the source tree, but still does not
  recommend it, so keep LIBGIT2_SUPPORTS_IN_SOURCE_BUILD = NO

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4aef53575bdb9d1e74ca5600eb93079964d2e8fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ot-declare-win32-functions-on-non-win32-p.patch | 35 ----------------------
 package/libgit2/libgit2.hash                       |  2 +-
 package/libgit2/libgit2.mk                         |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch b/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch
deleted file mode 100644
index 6be66ffee3..0000000000
--- a/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 20811c5aa9c528405eaa3f88ff22a9adebafa9e6 Mon Sep 17 00:00:00 2001
-From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Date: Wed, 8 Mar 2023 14:00:52 +0100
-Subject: [PATCH] sysdir: Do not declare win32 functions on non-win32 platforms
-
-These declaration poses problems on some embedded or retro Linux systems
-that deliberately disable support for wchar_t from their libc.
-
-Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-[Retrieved from:
-https://github.com/libgit2/libgit2/commit/20811c5aa9c528405eaa3f88ff22a9adebafa9e6]
----
- src/libgit2/sysdir.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/libgit2/sysdir.h b/src/libgit2/sysdir.h
-index 1d15bbf43..03f59e1de 100644
---- a/src/libgit2/sysdir.h
-+++ b/src/libgit2/sysdir.h
-@@ -134,10 +134,12 @@ extern int git_sysdir_set(git_sysdir_t which, const char *paths);
-  */
- extern int git_sysdir_reset(void);
- 
-+#ifdef GIT_WIN32
- /** Sets the registry system dir to a mock; for testing.  */
- extern int git_win32__set_registry_system_dir(const wchar_t *mock_sysdir);
- 
- /** Find the given system dir; for testing. */
- extern int git_win32__find_system_dirs(git_str *out, const char *subdir);
-+#endif
- 
- #endif
--- 
-2.39.2
-
diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index baf43c66f7..4dd6519ca3 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d557fbf35557bb5df53cbf38ae0081edb4a36494ec0d19741fa673e509245f8f  libgit2-1.6.2.tar.gz
+sha256  d25866a4ee275a64f65be2d9a663680a5cf1ed87b7ee4c534997562c828e500d  libgit2-1.6.4.tar.gz
 sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index b31f5199e1..9ddf2374bb 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.6.2
+LIBGIT2_VERSION = 1.6.4
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
