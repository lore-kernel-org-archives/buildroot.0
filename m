Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CB6C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 22:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CF3981D4F;
	Fri,  4 Feb 2022 22:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ANnfbCQvWo4; Fri,  4 Feb 2022 22:05:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97AB481CA5;
	Fri,  4 Feb 2022 22:05:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 842F51BF4E6
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 22:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72D694013A
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 22:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ej___ylkVG8n for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 22:05:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 710AA40395
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 22:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B38058184C; Fri,  4 Feb 2022 21:58:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Feb 2022 23:04:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed81b96cc549eeb0951e84303106699f728e089c
X-Git-Newrev: f54f61eb3a8c09e46137712796c2b93f4760a6d4
X-Patchwork-Hint: ignore
Message-Id: <20220204215815.B38058184C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libblockdev: bump to version 2.26
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

commit: https://git.buildroot.net/buildroot/commit/?id=f54f61eb3a8c09e46137712796c2b93f4760a6d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add upstream link to first patch
- Drop second patch (already in version)

https://github.com/storaged-project/libblockdev/blob/2.26-1/NEWS.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ovide-replacement-function-for-strerror_l.patch |  2 ++
 ...02-exec-Fix-deprecated-glib-function-call.patch | 32 ----------------------
 package/libblockdev/libblockdev.hash               |  2 +-
 package/libblockdev/libblockdev.mk                 |  2 +-
 4 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
index 018e4c4489..d5c9b2dfdb 100644
--- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
+++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
@@ -8,6 +8,8 @@ so let's provide a simple replacement function that falls back on
 strerror().
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Upstream status:
+https://github.com/storaged-project/libblockdev/pull/701]
 ---
  configure.ac         | 2 ++
  src/plugins/crypto.c | 7 +++++++
diff --git a/package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch b/package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch
deleted file mode 100644
index 2c370a133f..0000000000
--- a/package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From aad927a81fd9067865dc391c5bbff12ac51a0002 Mon Sep 17 00:00:00 2001
-From: Manuel Wassermann <manuel.wassermann97@gmail.com>
-Date: Thu, 1 Jul 2021 04:45:49 +0200
-Subject: [PATCH] exec: Fix deprecated glib function call Glib will rename
- "g_spawn_check_exit_status()" to "g_spawn_check_wait_status()" in version
- 2.69.
-
-[Retrieved from:
-https://github.com/storaged-project/libblockdev/commit/aad927a81fd9067865dc391c5bbff12ac51a0002]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/utils/exec.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/utils/exec.c b/src/utils/exec.c
-index 317fb5525..8faeb289c 100644
---- a/src/utils/exec.c
-+++ b/src/utils/exec.c
-@@ -236,7 +236,12 @@ gboolean bd_utils_exec_and_report_status_error (const gchar **argv, const BDExtr
-     /* g_spawn_sync set the status in the same way waitpid() does, we need
-        to get the process exit code manually (this is similar to calling
-        WEXITSTATUS but also sets the error for terminated processes */
--    if (!g_spawn_check_exit_status (exit_status, error)) {
-+
-+    #if !GLIB_CHECK_VERSION(2, 69, 0)
-+    #define g_spawn_check_wait_status(x,y) (g_spawn_check_exit_status (x,y))
-+    #endif
-+
-+    if (!g_spawn_check_wait_status (exit_status, error)) {
-         if (g_error_matches (*error, G_SPAWN_ERROR, G_SPAWN_ERROR_FAILED)) {
-             /* process was terminated abnormally (e.g. using a signal) */
-             g_free (stdout_data);
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 101b99f1a8..53a3b0737f 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  555aa42a2db39649ad83253bdc902ab5bd63d39c123e0c8055c4de7fe7571668  libblockdev-2.25.tar.gz
+sha256  c4c0e10b35ac632bda8ce6d200b5601184984dec387fe59185921eb42432e069  libblockdev-2.26.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 39ae9230d9..36b74966fb 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 2.25
+LIBBLOCKDEV_VERSION = 2.26
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
