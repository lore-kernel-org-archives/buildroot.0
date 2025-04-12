Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E1CC369A1
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 10:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A4C760882;
	Sat, 12 Apr 2025 10:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmoII5pjes74; Sat, 12 Apr 2025 10:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B183E607AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B183E607AC;
	Sat, 12 Apr 2025 10:55:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A931108
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 10:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BEA3607AC
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 10:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiR1XNAJ-G-A for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 10:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68756605CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68756605CB
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 10:55:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 552EA814AF; Sat, 12 Apr 2025 10:55:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Apr 2025 12:11:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fde0b3fe1c99207436fd0c25a94c09856d1ee552
X-Git-Newrev: 3a3ab70fc2f4c26c4d943de01748b0fa2c0cdacd
X-Patchwork-Hint: ignore
Message-Id: <20250412105523.552EA814AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmanette: bump to version 0.2.11
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3a3ab70fc2f4c26c4d943de01748b0fa2c0cdacd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release with a number of fixes, it also adds support for the
Steam Deck gamepad. Release notes:

  https://gitlab.gnome.org/GNOME/libmanette/-/blob/0.2.11/NEWS

This version introduces a dependency on the hidapi package.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Julien:
 - change release note link to use version tag
 - propagate hidapi dependencies in Config.in
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmanette/Config.in       | 13 +++++++++----
 package/libmanette/libmanette.hash |  4 ++--
 package/libmanette/libmanette.mk   |  3 ++-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/libmanette/Config.in b/package/libmanette/Config.in
index 31fff15286..873f8d8b0b 100644
--- a/package/libmanette/Config.in
+++ b/package/libmanette/Config.in
@@ -2,8 +2,11 @@ config BR2_PACKAGE_LIBMANETTE
 	bool "libmanette"
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2 -> gettext
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_PACKAGE_HAS_UDEV # hidapi
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # hidapi -> libusb
+	select BR2_PACKAGE_HIDAPI
 	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -11,7 +14,9 @@ config BR2_PACKAGE_LIBMANETTE
 
 	  https://gitlab.gnome.org/GNOME/libmanette
 
-comment "libmanette needs a toolchain w/ wchar, threads, headers >= 4.16"
+comment "libmanette needs a toolchain w/ wchar, NPTL threads, gcc >= 4.9, headers >= 4.16, udev"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16 || \
+		!BR2_PACKAGE_HAS_UDEV
diff --git a/package/libmanette/libmanette.hash b/package/libmanette/libmanette.hash
index 3653d672de..0ec6077c2c 100644
--- a/package/libmanette/libmanette.hash
+++ b/package/libmanette/libmanette.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.9.sha256sum
-sha256  29366be5452f60a74c65fc64ffe2d74eddd4e6e6824c2cefa567a43bd92b688f  libmanette-0.2.9.tar.xz
+# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.11.sha256sum
+sha256  b812b94e08632ba62a30960a8de29217a73a2fff5da2f12acc8a5d4771a49a70  libmanette-0.2.11.tar.xz
 
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libmanette/libmanette.mk b/package/libmanette/libmanette.mk
index 7872c8b796..44beef836f 100644
--- a/package/libmanette/libmanette.mk
+++ b/package/libmanette/libmanette.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMANETTE_VERSION_MAJOR = 0.2
-LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).9
+LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).11
 LIBMANETTE_SOURCE = libmanette-$(LIBMANETTE_VERSION).tar.xz
 LIBMANETTE_SITE = https://download.gnome.org/sources/libmanette/$(LIBMANETTE_VERSION_MAJOR)
 LIBMANETTE_LICENSE = LGPL-2.1+
@@ -14,6 +14,7 @@ LIBMANETTE_INSTALL_STAGING = YES
 LIBMANETTE_DEPENDENCIES = \
 	libevdev \
 	libglib2 \
+	hidapi \
 	$(TARGET_NLS_DEPENDENCIES)
 
 LIBMANETTE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
