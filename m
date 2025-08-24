Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84DACAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2C5D80643;
	Mon,  8 Sep 2025 14:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3W-Vtf6ghXK; Mon,  8 Sep 2025 14:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F5A78081E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F5A78081E;
	Mon,  8 Sep 2025 14:18:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02983186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 908374021D
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDA1mslpKPa8 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6793D40217
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6793D40217
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6575E82158; Mon,  8 Sep 2025 14:16:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 19:14:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ed0e75af1a12ed43bb1136a6a018efb0904834f
X-Git-Newrev: 7b1e6ec3f784951789c29db2bc32fa013fb1cc3a
X-Patchwork-Hint: ignore
Message-Id: <20250908141624.6575E82158@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{,
 lib}apparmor: bump to version 4.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b1e6ec3f784951789c29db2bc32fa013fb1cc3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updating also the companion libapparmor library and removing upstreamed
patch.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[Julien:
 - add "{,lib}" in commit log title
 - reorder LIBAPPARMOR_DEPENDENCIES alphabetically
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/apparmor/apparmor.hash                     |  4 +-
 package/apparmor/apparmor.mk                       |  4 +-
 ...define-a-portable-version-of-gnu-basename.patch | 44 ----------------------
 package/libapparmor/libapparmor.hash               |  4 +-
 package/libapparmor/libapparmor.mk                 |  7 ++--
 5 files changed, 10 insertions(+), 53 deletions(-)

diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index 190045cd65..ef7dd81aaf 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.7
-sha256  64494bd99fa6547a9cbdb4fc6bc732451a02dd19e6eb70eab977b239632151eb  apparmor-v3.1.7.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.1
+sha256  f125aae32964e4e84443fec005f37f37abd5164f30620239c42864655a1b0281  apparmor-v4.1.1.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 20dbce6f97..febd1d5eb0 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, please also update the libapparmor package
-APPARMOR_VERSION_MAJOR = 3.1
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).7
+APPARMOR_VERSION_MAJOR = 4.1
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).1
 APPARMOR_SOURCE = apparmor-v$(APPARMOR_VERSION).tar.gz
 APPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(APPARMOR_VERSION)
 APPARMOR_DL_SUBDIR = apparmor
diff --git a/package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch b/package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch
deleted file mode 100644
index c068279853..0000000000
--- a/package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7fb040bde69ebdfce48cf1a01c1a62fd4f8eef0a Mon Sep 17 00:00:00 2001
-From: Jules Maselbas <jmaselbas@zdiv.net>
-Date: Thu, 16 May 2024 12:01:00 +0200
-Subject: [PATCH] libapparamor: Define a portable version of gnu basename
-
-Since musl 1.2.5, basename(3) prototype is only provided in libgen.h
-(as mandated by POSIX) and not in strings.h. Also there is a major
-difference between the gnu basename and the one defined in libgen.h,
-the latter modify the argument string making them incompatible.
-
-Fix this by defining a portable version of basename using strchr.
-
-Upstream: https://gitlab.com/apparmor/apparmor/-/commit/7fb040bde69ebdfce48cf1a01c1a62fd4f8eef0a
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- libraries/libapparmor/testsuite/test_multi.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/libraries/libapparmor/testsuite/test_multi.c b/libraries/libapparmor/testsuite/test_multi.c
-index 578629500..7f37966ec 100644
---- a/libraries/libapparmor/testsuite/test_multi.c
-+++ b/libraries/libapparmor/testsuite/test_multi.c
-@@ -1,5 +1,3 @@
--#define _GNU_SOURCE /* for glibc's basename version */
--
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-@@ -7,6 +5,12 @@
- 
- #include <aalogparse.h>
- 
-+static const char *basename(const char *path)
-+{
-+	const char *p = strrchr(path, '/');
-+	return p ? p + 1 : path;
-+}
-+
- int print_results(aa_log_record *record);
- 
- int main(int argc, char **argv)
--- 
-GitLab
-
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index 68b0468ae3..d0603c0a3a 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.7
-sha256  64494bd99fa6547a9cbdb4fc6bc732451a02dd19e6eb70eab977b239632151eb  apparmor-v3.1.7.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.1
+sha256  f125aae32964e4e84443fec005f37f37abd5164f30620239c42864655a1b0281  apparmor-v4.1.1.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 91c22ad35b..64442fcc16 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -5,19 +5,20 @@
 ################################################################################
 
 # When updating the version here, please also update the apparmor package
-LIBAPPARMOR_VERSION_MAJOR = 3.1
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).7
+LIBAPPARMOR_VERSION_MAJOR = 4.1
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).1
 LIBAPPARMOR_SOURCE = apparmor-v$(LIBAPPARMOR_VERSION).tar.gz
 LIBAPPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPARMOR_VERSION)
 LIBAPPARMOR_LICENSE = LGPL-2.1
 LIBAPPARMOR_LICENSE_FILES = LICENSE libraries/libapparmor/COPYING.LGPL
 
-LIBAPPARMOR_DEPENDENCIES = host-bison host-flex host-pkgconf
+LIBAPPARMOR_DEPENDENCIES = host-autoconf-archive host-bison host-flex host-pkgconf
 LIBAPPARMOR_SUBDIR = libraries/libapparmor
 LIBAPPARMOR_INSTALL_STAGING = YES
 
 # no configure in tarball
 LIBAPPARMOR_AUTORECONF = YES
+LIBAPPARMOR_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 
 # Most AppArmor tools will want to link to the static lib.
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
