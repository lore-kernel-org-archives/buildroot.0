Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976C6C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 21:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50E22608D8;
	Sat,  5 Aug 2023 21:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50E22608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RTRa9g6jY10e; Sat,  5 Aug 2023 21:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F3D460D59;
	Sat,  5 Aug 2023 21:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F3D460D59
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 588D51BF86B
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DBCB40257
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DBCB40257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ecwRhNUAazQP for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 21:34:12 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABBCD415D7
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 21:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABBCD415D7
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 68B43A4C00C6;
 Sat,  5 Aug 2023 23:34:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55386)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSOuW-0000fm-0W;
 Sat, 05 Aug 2023 23:34:08 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 23:34:08 +0200
Message-Id: <20230805213408.3588223-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691271248;
 bh=N47APkByva/SlfgO2ZCZKThZosUCMgmOkikuU0HC4k4=;
 h=From:To:Cc:Subject:Date:From;
 b=UrZIN3tlzTKHe/+454D6kXq/UGeesPB9Iqgfvh+ueNv+8A36fSPVU3kepen3rpS7F
 jCapAiD3/7cWKs1asVD/GMgPxswhBMEl96iTKY8kMB9vERs+0gQ8c151QpNlyFbC7W
 UMqM8lzNoRJWCAJQexsq9jbF8bQudyhF9QF/PZ0yMJZ9dF1GKh5V6Us/2yEr2sYEqz
 jGl3mYcD+fHOSxm2zOYAqQOGVXHDaN1lJHOlFZ58nytz3fzr8dtcX17C+I/eKxEGND
 XJonkeiiq3m45s230qep6gGYLesmZOthOLgxgzhJfgL1dDHJQBDXI4tAxrk+SREsQR
 KiQs8B3vgw65A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=UrZIN3tl
Subject: [Buildroot] [PATCH 1/1] package/libarchive: bump version to 3.7.1
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch, upstream applied a different solution:
https://github.com/libarchive/libarchive/commit/1f35c466aaa9444335a1b854b0b7223b0d2346c2

Release notes:
https://github.com/libarchive/libarchive/releases/tag/v3.7.1
https://github.com/libarchive/libarchive/releases/tag/v3.7.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...o-not-add-iconv-for-Requires.private.patch | 28 -------------------
 package/libarchive/libarchive.hash            |  2 +-
 package/libarchive/libarchive.mk              |  6 +---
 4 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 8d5e291e8b..67db03239c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -657,7 +657,6 @@ package/leveldb/0003-CMakeLists.txt-check-for-atomic-library.patch Upstream
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
