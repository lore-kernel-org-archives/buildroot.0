Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9562CF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74D21611A9;
	Sat, 12 Oct 2024 15:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6HxVZePrMN1; Sat, 12 Oct 2024 15:04:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF5C611C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF5C611C9;
	Sat, 12 Oct 2024 15:04:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 898F71BF47E
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B88D56063A
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzw9ENkp36_W for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B44E60679
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B44E60679
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9395385C84; Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:01:05 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: ee3155d7799a3d81dd296ecaa2614030ac8fce6e
X-Git-Newrev: b42f1ddcc7827d7df8e9f281539d3746beabd07b
X-Patchwork-Hint: ignore
Message-Id: <20241012150253.9395385C84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/php: security
 bump version to 8.3.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=b42f1ddcc7827d7df8e9f281539d3746beabd07b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Removed patch which is included in this release.

Fixes CVE-2024-8926, CVE-2024-8927, CVE-2024-9026, and CVE-2024-8925.

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
Release notes: https://news-web.php.net/php.announce/438

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a2da88519fc1f96e517171dfb053aca8c00f7daf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fix-configure-check-for-aarch64-CRC32-API.patch | 56 ----------------------
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)

diff --git a/package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch b/package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch
deleted file mode 100644
index 46e6558dcd..0000000000
--- a/package/php/0006-Autotools-fix-configure-check-for-aarch64-CRC32-API.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 5947db6bb8e336252337fb0194c3b8e834d100b6 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 25 Aug 2024 18:00:29 +0200
-Subject: [PATCH] Fix GH-15587: Autotools: fix configure check for aarch64
- CRC32 API
-
-On arm32 bit the check succeeds leading to a build error later on:
-
-/home/autobuild/autobuild/instance-3/output-1/build/php-8.3.10/ext/standard/crc32.c:70:12:
- error: 'armv8-a' does not support feature 'nothing'
-   70 | #   pragma GCC target ("+nothing+crc")
-
-Upstream: https://github.com/php/php-src/commit/5947db6bb8e336252337fb0194c3b8e834d100b6
-
-Co-authored-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[http://lists.busybox.net/pipermail/buildroot/2024-August/761151.html]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- configure.ac | 24 +++++++++++++++++++-----
- 1 file changed, 19 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1142c9459d71..fb59a81700f4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -738,11 +738,25 @@ AC_FUNC_ALLOCA
- PHP_TIME_R_TYPE
- PHP_CHECK_IN_ADDR_T
- 
--AC_CACHE_CHECK([for aarch64 CRC32 API], ac_cv_func___crc32d,
--[AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <arm_acle.h>]],[[__crc32d(0, 0);]])],[ac_cv_func___crc32d=yes],[ac_cv_func___crc32d="no"])])
--if test "$ac_cv_func___crc32d" = "yes"; then
--  AC_DEFINE([HAVE_AARCH64_CRC32], [1], [Define when aarch64 CRC32 API is available.])
--fi
-+AC_CACHE_CHECK([for aarch64 CRC32 API], [ac_cv_func___crc32d],
-+[AC_LINK_IFELSE([AC_LANG_PROGRAM([
-+#include <arm_acle.h>
-+# if defined(__GNUC__)
-+#  if!defined(__clang__)
-+#   pragma GCC push_options
-+#   pragma GCC target ("+nothing+crc")
-+#  elif defined(__APPLE__)
-+#   pragma clang attribute push(__attribute__((target("crc"))), apply_to=function)
-+#  else
-+#   pragma clang attribute push(__attribute__((target("+nothing+crc"))), apply_to=function)
-+#  endif
-+# endif
-+], [__crc32d(0, 0);])],
-+[ac_cv_func___crc32d=yes],
-+[ac_cv_func___crc32d=no])])
-+AS_VAR_IF([ac_cv_func___crc32d], [yes],
-+  [AC_DEFINE([HAVE_AARCH64_CRC32], [1],
-+    [Define to 1 when aarch64 CRC32 API is available.])])
- 
- dnl Check for asm goto support.
- AC_CACHE_CHECK([for asm goto], ac_cv__asm_goto,
diff --git a/package/php/php.hash b/package/php/php.hash
index 7df051df4e..3110e205ef 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  b862b098a08ab9bf4b36ed12c7d0d9f65353656b36fb0e3c5344093aceb35802  php-8.3.11.tar.xz
+sha256  f774e28633e26fc8c5197f4dae58ec9e3ff87d1b4311cbc61ab05a7ad24bd131  php-8.3.12.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index d7788107c1..3202902322 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.11
+PHP_VERSION = 8.3.12
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
