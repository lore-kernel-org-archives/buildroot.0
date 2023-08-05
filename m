Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E7BEC8735
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 14:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA82341D9C;
	Thu,  7 Sep 2023 14:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA82341D9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h__0ZM36nVmC; Thu,  7 Sep 2023 14:54:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C5D441D65;
	Thu,  7 Sep 2023 14:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C5D441D65
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD791BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D1086125E
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D1086125E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRhBNrvPXwLs for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F37360C16
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F37360C16
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D75786A20; Thu,  7 Sep 2023 14:51:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Aug 2023 23:59:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09c4a7a35fb0e82f24399dea4507e47242eee27b
X-Git-Newrev: 7991d2c48a859f9c0333ade8192868c21b1a8a31
X-Patchwork-Hint: ignore
Message-Id: <20230907145125.0D75786A20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libarchive: bump version to 3.7.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7991d2c48a859f9c0333ade8192868c21b1a8a31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch, upstream applied a different solution:
https://github.com/libarchive/libarchive/commit/1f35c466aaa9444335a1b854b0b7223b0d2346c2

Release notes:
https://github.com/libarchive/libarchive/releases/tag/v3.7.1
https://github.com/libarchive/libarchive/releases/tag/v3.7.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...ols-do-not-add-iconv-for-Requires.private.patch | 28 ----------------------
 package/libarchive/libarchive.hash                 |  2 +-
 package/libarchive/libarchive.mk                   |  6 +----
 4 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3a9329ab71..f5c4f807e7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -659,7 +659,6 @@ package/leveldb/0003-CMakeLists.txt-check-for-atomic-library.patch Upstream
 package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch Upstream
 package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch Upstream
 package/libabseil-cpp/0001-force-position-independent-code.patch Upstream
-package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch Upstream
 package/libargon2/0001-libargon2-dont-fail-on-existing-symlink.patch Upstream
 package/libart/0001-art-config-cross.patch Sob Upstream
 package/libatasmart/0001-strpool-cross-flags.patch Upstream
diff --git a/package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch b/package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch
deleted file mode 100644
index 91903866ef..0000000000
--- a/package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 619c1be8d38ff79622db8f66f3b02832795315f9 Mon Sep 17 00:00:00 2001
-From: Christian Hesse <mail@eworm.de>
-Date: Wed, 14 Dec 2022 09:04:39 +0100
-Subject: [PATCH] autotools: do not add iconv for Requires.private
-
-There is no pkgconfig file for iconv, thus things break with this
-change. Let's drop iconv from Requires.private.
-
-Fixes: a83f3d32 ("autotools: Fix static linking when openssl is enabled in windows")
-[Retrieved from:
-https://github.com/libarchive/libarchive/pull/1817/commits/619c1be8d38ff79622db8f66f3b02832795315f9]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 99bff20d1..f245d0c55 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -378,7 +378,6 @@ if test "x$with_iconv" != "xno"; then
-     AC_CHECK_HEADERS([localcharset.h])
-     am_save_LIBS="$LIBS"
-     LIBS="${LIBS} ${LIBICONV}"
--    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
-     AC_CHECK_FUNCS([locale_charset])
-     LIBS="${am_save_LIBS}"
-     if test "x$ac_cv_func_locale_charset" != "xyes"; then
diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index b03bef3de5..02f7d84246 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  9e2c1b80d5fbe59b61308fdfab6c79b5021d7ff4ff2489fb12daf0a96a83551d  libarchive-3.6.2.tar.xz
+sha256  b17403ce670ff18d8e06fea05a9ea9accf70678c88f1b9392a2e29b51127895f  libarchive-3.7.1.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 2010b6529f..5bcf559a6e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,17 +4,13 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.6.2
+LIBARCHIVE_VERSION = 3.7.1
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
