Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF164C83F09
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DA3783DFC;
	Fri,  4 Jul 2025 06:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYVKUx2Sta32; Fri,  4 Jul 2025 06:22:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C4083DEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C4083DEE;
	Fri,  4 Jul 2025 06:22:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EABA1EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 988C360B71
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRUvVLyv7Vgd for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95FF560B65
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95FF560B65
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9419285CCE; Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 09:56:44 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8154e1226d2f631ee10ed8c34713f71aeb19ec23
X-Git-Newrev: 91895774f808ca40fe54b00fbe869c736f181caf
X-Patchwork-Hint: ignore
Message-Id: <20250704062126.9419285CCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libarchive:
 security bump to v3.8.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=91895774f808ca40fe54b00fbe869c736f181caf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This fixes the following CVEs:

- CVE-2025-5914
    Libarchive: double free at archive_read_format_rar_seek_data()
    in archive_read_support_format_rar.c
    https://www.cve.org/CVERecord?id=CVE-2025-5914

- CVE-2025-5915
    Libarchive: heap buffer over read in copy_from_lzss_window()
    at archive_read_support_format_rar.c
    https://www.cve.org/CVERecord?id=CVE-2025-5915

- CVE-2025-5916
    Libarchive: integer overflow while reading warc files
    at archive_read_support_format_warc.c
    https://www.cve.org/CVERecord?id=CVE-2025-5916

- CVE-2025-5917
    Libarchive: off by one error in build_ustar_entry_name()
    at archive_write_set_format_pax.c
    https://www.cve.org/CVERecord?id=CVE-2025-5917

- CVE-2025-5918
    Libarchive: reading past eof may be triggered for piped file streams
    https://www.cve.org/CVERecord?id=CVE-2025-5918

See the release notes:
- https://github.com/libarchive/libarchive/releases/tag/v3.8.0
- https://github.com/libarchive/libarchive/releases/tag/v3.8.1

In addition to the version bump, the following changes are required:
- The COPYING file has been edited upstream because of filename change on a
  sub-licensed component; see
  https://github.com/libarchive/libarchive/commit/c26f0377457db392bd57a640e8fe25506120f810
- The upstream "sha256sums" is currently unavailable, so the archive checksum
  has been computed locally
- Drop patches for libiconv in configure.ac, which has been properly addressed
  upstream in https://github.com/libarchive/libarchive/pull/2611
- Following the above, AUTORECONF is not needed any longer
- Drop mbedtls patch that has been applied upstream

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 95db5707dff571c7f3485b3aa63bf5977c7bf08d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-add-iconv-to-the-.pc-file-if-needed-1825.patch | 31 ----------------------
 ...ols-do-not-add-iconv-for-Requires.private.patch | 27 -------------------
 package/libarchive/libarchive.hash                 |  7 ++---
 package/libarchive/libarchive.mk                   |  6 +----
 4 files changed, 5 insertions(+), 66 deletions(-)

diff --git a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
deleted file mode 100644
index 31ac4b0b5a..0000000000
--- a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3879afd473a256173cc626e16293f3fe8875f2d6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 6 Jan 2024 09:53:23 +0100
-Subject: [PATCH] Revert "Only add "iconv" to the .pc file if needed (#1825)"
-
-This reverts commit 1f35c466aaa9444335a1b854b0b7223b0d2346c2.
-
-Upstream: no dedicated PR for this revert but there is already plenty of PRs/issues to fix iconv build ...
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 93f7af94..204a4e69 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -455,9 +455,7 @@ if test "x$with_iconv" != "xno"; then
-     AC_CHECK_HEADERS([localcharset.h])
-     am_save_LIBS="$LIBS"
-     LIBS="${LIBS} ${LIBICONV}"
--    if test -n "$LIBICONV"; then
--      LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
--    fi
-+    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
-     AC_CHECK_FUNCS([locale_charset])
-     LIBS="${am_save_LIBS}"
-     if test "x$ac_cv_func_locale_charset" != "xyes"; then
--- 
-2.43.0
-
diff --git a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
deleted file mode 100644
index a5b4c86a2f..0000000000
--- a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 619c1be8d38ff79622db8f66f3b02832795315f9 Mon Sep 17 00:00:00 2001
-From: Christian Hesse <mail@eworm.de>
-Date: Wed, 14 Dec 2022 09:04:39 +0100
-Subject: [PATCH] autotools: do not add iconv for Requires.private
-
-There is no pkgconfig file for iconv, thus things break with this
-change. Let's drop iconv from Requires.private.
-
-Fixes: a83f3d32 ("autotools: Fix static linking when openssl is enabled in windows")
-Upstream: https://github.com/libarchive/libarchive/pull/1817/commits/619c1be8d38ff79622db8f66f3b02832795315f9
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 99bff20d1..f245d0c55 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -455,7 +455,6 @@ if test "x$with_iconv" != "xno"; then
-     AC_CHECK_HEADERS([localcharset.h])
-     am_save_LIBS="$LIBS"
-     LIBS="${LIBS} ${LIBICONV}"
--    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
-     AC_CHECK_FUNCS([locale_charset])
-     LIBS="${am_save_LIBS}"
-     if test "x$ac_cv_func_locale_charset" != "xyes"; then
diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index d132664e17..b8738e4a99 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,5 @@
-# From https://www.libarchive.de/downloads/sha256sums
-sha256  ed8b5732e4cd6e30fae909fb945cad8ff9cb7be5c6cdaa3944ec96e4a200c04c  libarchive-3.7.9.tar.xz
+# Locally computed after verifying the signature from
+# https://www.libarchive.de/downloads/libarchive-3.8.1.tar.xz.asc
+sha256  19f917d42d530f98815ac824d90c7eaf648e9d9a50e4f309c812457ffa5496b5  libarchive-3.8.1.tar.xz
 # Locally computed:
-sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
+sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 7fec01a040..1dafec726b 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,17 +4,13 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.7.9
+LIBARCHIVE_VERSION = 3.8.1
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
 LIBARCHIVE_CPE_ID_VENDOR = libarchive
-# We're patching configure.ac
-LIBARCHIVE_AUTORECONF = YES
-# needed for autoreconf
-LIBARCHIVE_DEPENDENCIES += host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
