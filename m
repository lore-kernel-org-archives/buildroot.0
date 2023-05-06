Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA9DC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E564361205;
	Sat,  6 May 2023 14:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E564361205
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Npr8mT-PgHG9; Sat,  6 May 2023 14:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12FB761108;
	Sat,  6 May 2023 14:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12FB761108
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01D261BF36E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE21340A08
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE21340A08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3Kp4sjvVQH8 for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:41:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B66ED404C4
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B66ED404C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C2B485DCC; Sat,  6 May 2023 14:41:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 16:24:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 378fea2d23a404dd93c9db05b293094ff4dee4ba
X-Git-Newrev: 4aef53575bdb9d1e74ca5600eb93079964d2e8fd
X-Patchwork-Hint: ignore
Message-Id: <20230506144102.9C2B485DCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgit2: bump version to 1.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4aef53575bdb9d1e74ca5600eb93079964d2e8fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Remove patch applied upstream.
* Upstream fixed building inside the source tree, but still does not
  recommend it, so keep LIBGIT2_SUPPORTS_IN_SOURCE_BUILD = NO

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
