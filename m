Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4F1CCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48D1960657;
	Sat, 11 Oct 2025 21:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CwXXcuVU1xB; Sat, 11 Oct 2025 21:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40A8160BCC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40A8160BCC;
	Sat, 11 Oct 2025 21:15:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27406BC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CA31811A4
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YP7oqYk6rtIJ for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1E418063D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1E418063D
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:15:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C11E586E7C; Sat, 11 Oct 2025 21:15:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Oct 2025 23:05:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6024a4980356efa74faf4ba54c6cc555d27f4f7
X-Git-Newrev: d4a505b17565641e7655e8b992da5bb6029b0ee7
X-Patchwork-Hint: ignore
Message-Id: <20251011211515.C11E586E7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltrace: bump version to 0.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d4a505b17565641e7655e8b992da5bb6029b0ee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://gitlab.com/cespedes/ltrace/-/blob/0.8.1/NEWS
https://gitlab.com/cespedes/ltrace/-/blob/ltrace-0.8.0/NEWS

- Drop the upstreamed 0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
  https://gitlab.com/cespedes/ltrace/-/commit/10177832689ae3411d7dad39ac66b2ceaf4e46f2
- Switch site to gitlab

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...gure.ac-fix-autoreconf-with-autoconf-2.70.patch | 35 ----------------------
 package/ltrace/ltrace.hash                         |  2 +-
 package/ltrace/ltrace.mk                           |  7 ++---
 4 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 127e20ca0f..0f6a5b0b19 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -663,7 +663,6 @@ package/lockfile-progs/0001-sus3v-legacy.patch lib_patch.Sob lib_patch.Upstream
 package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch lib_patch.Upstream
 package/ltrace/0001-arm-plt.patch lib_patch.Upstream
 package/ltrace/0002-sparc-add-missing-library.h-include.patch lib_patch.Upstream
-package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch lib_patch.Upstream
 package/lttng-babeltrace/0001-tests-lib-Makefile.am-remove-unneeded-static-flag.patch lib_patch.Upstream
 package/lttng-babeltrace/0002-configure.ac-fix-popt-static-build.patch lib_patch.Upstream
 package/lttng-libust/0001-configure.ac-add-disable-tests.patch lib_patch.Upstream
diff --git a/package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch b/package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
deleted file mode 100644
index efe993ec88..0000000000
--- a/package/ltrace/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From b8d5d086489ff20339e221323a60c140a9820e67 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 9 Oct 2021 09:39:52 +0200
-Subject: [PATCH] configure.ac: fix autoreconf with autoconf >= 2.70
-
-Drop AC_CONFIG_AUX_DIR to avoid the following build failure with
-autoconf >= 2.70:
-
-autoreconf: error: cannot create config/autoconf: No such file or directory
-
-Fixes:
- - http://autobuild.buildroot.org/results/433599039d6e1ee301465f9867e169c121a0646f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent as upstream is unmaintained:
-https://gitlab.com/cespedes/ltrace/-/issues/8]
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index b9c39fa..486589b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -28,7 +28,6 @@ AC_INIT([ltrace],[0.7.91],[ltrace-devel@lists.alioth.debian.org],
- AC_CONFIG_HEADERS([config.h])
- AC_CONFIG_SRCDIR(libltrace.c)
- AC_CONFIG_MACRO_DIR([config/m4])
--AC_CONFIG_AUX_DIR([config/autoconf])
- AC_CANONICAL_BUILD
- AC_CANONICAL_HOST
- 
--- 
-2.33.0
-
diff --git a/package/ltrace/ltrace.hash b/package/ltrace/ltrace.hash
index a677ed3511..cb505b46c3 100644
--- a/package/ltrace/ltrace.hash
+++ b/package/ltrace/ltrace.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4aecf69e4a33331aed1e50ce4907e73a98cbccc4835febc3473863474304d547  ltrace-82c66409c7a93ca6ad2e4563ef030dfb7e6df4d4.tar.gz
+sha256  11c85a1353fcf2b5438b19d0ccc2d376c96656ce6f11cf9537e3a92b84392c58  ltrace-0.8.1.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index b3bd90daaa..61d1a13809 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -4,11 +4,8 @@
 #
 ################################################################################
 
-# This github version has some extra fixes on top of https://ltrace.org/
-# in particular the following commit to avoid a crash:
-#   192e0a6 void struct members are now ignored
-LTRACE_VERSION = 82c66409c7a93ca6ad2e4563ef030dfb7e6df4d4
-LTRACE_SITE = $(call github,dkogan,ltrace,$(LTRACE_VERSION))
+LTRACE_VERSION = 0.8.1
+LTRACE_SITE = $(call gitlab,cespedes,ltrace,$(LTRACE_VERSION))
 LTRACE_DEPENDENCIES = elfutils
 LTRACE_CONF_OPTS = --disable-werror
 LTRACE_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
