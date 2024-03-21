Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C2AC54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28EB482B53;
	Thu, 21 Mar 2024 21:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VprPWT6rW6jg; Thu, 21 Mar 2024 21:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C65D882B9F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C65D882B9F;
	Thu, 21 Mar 2024 21:05:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25CDC1BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B868B401BC
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rc1PC8kJQnpQ for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D12401BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0D12401BA
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E887837AB; Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:28:15 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1ae6b35f46de94d8f1dcc92306e03dc6ff21d748
X-Git-Newrev: a442714e74ac79f631b47a910f8c8ee12eb8844f
X-Patchwork-Hint: ignore
Message-Id: <20240321210326.8E887837AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libgit2: bump to
 version 1.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a442714e74ac79f631b47a910f8c8ee12eb8844f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

* Fix the license because libgit2 has been using some android code
  without attribution. This explains the change of the hash in the
  license file, which now includes the text of the BSD-2-Clause
  license.
* Building in-source is accidentely broken in this release and upstream
  recommends a separate build directory anyway, so use a separate build
  directory.
* Some win32-specific declarations use wchar_t, add an upstreamed patch
  to avoid a dependency to wchar_t elsewhere.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f32176a7671d8842b175077a92e268226fcec78f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ot-declare-win32-functions-on-non-win32-p.patch | 35 ++++++++++++++++++++++
 package/libgit2/libgit2.hash                       |  4 +--
 package/libgit2/libgit2.mk                         |  7 +++--
 3 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch b/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch
new file mode 100644
index 0000000000..6be66ffee3
--- /dev/null
+++ b/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch
@@ -0,0 +1,35 @@
+From 20811c5aa9c528405eaa3f88ff22a9adebafa9e6 Mon Sep 17 00:00:00 2001
+From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+Date: Wed, 8 Mar 2023 14:00:52 +0100
+Subject: [PATCH] sysdir: Do not declare win32 functions on non-win32 platforms
+
+These declaration poses problems on some embedded or retro Linux systems
+that deliberately disable support for wchar_t from their libc.
+
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+[Retrieved from:
+https://github.com/libgit2/libgit2/commit/20811c5aa9c528405eaa3f88ff22a9adebafa9e6]
+---
+ src/libgit2/sysdir.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libgit2/sysdir.h b/src/libgit2/sysdir.h
+index 1d15bbf43..03f59e1de 100644
+--- a/src/libgit2/sysdir.h
++++ b/src/libgit2/sysdir.h
+@@ -134,10 +134,12 @@ extern int git_sysdir_set(git_sysdir_t which, const char *paths);
+  */
+ extern int git_sysdir_reset(void);
+ 
++#ifdef GIT_WIN32
+ /** Sets the registry system dir to a mock; for testing.  */
+ extern int git_win32__set_registry_system_dir(const wchar_t *mock_sysdir);
+ 
+ /** Find the given system dir; for testing. */
+ extern int git_win32__find_system_dirs(git_str *out, const char *subdir);
++#endif
+ 
+ #endif
+-- 
+2.39.2
+
diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index e834525df5..baf43c66f7 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7074f1e2697992b82402501182db254fe62d64877b12f6e4c64656516f4cde88  libgit2-1.5.1.tar.gz
-sha256  0fc09da43d666b5b0cf5695defc3100d5cf387936b260ebab37e396d7e0dbc83  COPYING
+sha256  d557fbf35557bb5df53cbf38ae0081edb4a36494ec0d19741fa673e509245f8f  libgit2-1.6.2.tar.gz
+sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index c962c8030f..b31f5199e1 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.5.1
+LIBGIT2_VERSION = 1.6.2
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
 	MIT (sha1), \
 	BSD-3-Clause (sha256), \
 	wildmatch license (wildmatch), \
-	CC0-1.0 (xoroshiro256)
+	CC0-1.0 (xoroshiro256), \
+	BSD-2-Clause (basename_r)
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_CPE_ID_VENDOR = libgit2_project
 LIBGIT2_INSTALL_STAGING = YES
@@ -24,6 +25,8 @@ LIBGIT2_CONF_OPTS = \
 	-DUSE_NTLMCLIENT=OFF \
 	-DUSE_THREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
 
+LIBGIT2_SUPPORTS_IN_SOURCE_BUILD = NO
+
 LIBGIT2_DEPENDENCIES = zlib libhttpparser
 
 # If libiconv is available (for !locale toolchains), then we can use
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
