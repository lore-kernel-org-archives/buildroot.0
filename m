Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E56CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5AB240A64;
	Sun, 17 Jul 2022 13:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5AB240A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1XTZ8BwTdzwP; Sun, 17 Jul 2022 13:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7557B40A5F;
	Sun, 17 Jul 2022 13:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7557B40A5F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D8041BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4396460B09
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4396460B09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQhhy7NuLbUt for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:20:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 013A860B04
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 013A860B04
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C0C9E83BCB; Sun, 17 Jul 2022 13:06:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 15:15:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b35ee9bace28892238e92d04922fb5e7bba8e9f6
X-Git-Newrev: d07edd1e4f4e790196bf31f87e071aa9de1cc789
X-Patchwork-Hint: ignore
Message-Id: <20220717130654.C0C9E83BCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncmpc: bump to version 0.47
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

commit: https://git.buildroot.net/buildroot/commit/?id=d07edd1e4f4e790196bf31f87e071aa9de1cc789
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- C++20 is mandatory since
  https://github.com/MusicPlayerDaemon/ncmpc/commit/776e97b7a1f99e01d0d93bcbedbdc1736aad8ae6
- iconv is an optional dependency since
  https://github.com/MusicPlayerDaemon/ncmpc/commit/68c04f925d780d0e5705950310e8233ab6898a29
- Second patch is not needed since
  https://github.com/MusicPlayerDaemon/ncmpc/commit/c264db04dd30af301e7d85c9d145bb1f1ae3fea3

https://github.com/MusicPlayerDaemon/ncmpc/blob/v0.47/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...002-meson.build-link-with-lintl-if-needed.patch | 38 ----------------------
 package/ncmpc/Config.in                            |  7 ++--
 package/ncmpc/ncmpc.hash                           |  2 +-
 package/ncmpc/ncmpc.mk                             |  3 +-
 4 files changed, 7 insertions(+), 43 deletions(-)

diff --git a/package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch b/package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch
deleted file mode 100644
index 9f599c89e9..0000000000
--- a/package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 21ad6bf2bcb0745c25a28637449a72eee883a8e2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Apr 2019 19:19:10 +0200
-Subject: [PATCH] meson.build: link with lintl if needed
-
-Fixes:
- - http://autobuild.buildroot.org/results/d53978fb30d77cb4d10921bf721eff3d066567ce
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent as upstream already rejected the first patch
-on atomic: https://github.com/MusicPlayerDaemon/ncmpc/pull/45]
----
- meson.build | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index 2e6defc..28e9d29 100644
---- a/meson.build
-+++ b/meson.build
-@@ -42,6 +42,7 @@ else
-   error('libintl.h not found')
- endif
- conf.set('ENABLE_NLS', enable_nls)
-+intl_dep = cc.find_library('intl', required: false)
- if enable_nls
-   conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
-   subdir('po')
-@@ -356,6 +357,7 @@ ncmpc = executable('ncmpc',
-     boost_dep,
-     pcre_dep,
-     curses_dep,
-+    intl_dep,
-     lirc_dep,
-     libmpdclient_dep,
-   ],
--- 
-2.20.1
-
diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
index eda6e0bbd5..61c186a4ae 100644
--- a/package/ncmpc/Config.in
+++ b/package/ncmpc/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_NCMPC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_NCURSES
 	help
@@ -14,7 +14,8 @@ config BR2_PACKAGE_NCMPC
 
 	  http://www.musicpd.org/clients/ncmpc/
 
-comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 10"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index a5d6698a61..17bc6e3ace 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  177f77cf09dd4ab914e8438be399cdd5d83c9aa992abc8d9abac006bb092934e  ncmpc-0.46.tar.xz
+sha256  61da23b1bc6c7a593fdc28611932cd7a30fcf6803830e01764c29b8abed2249c  ncmpc-0.47.tar.xz
 
 # Hash for license file:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 41fface525..5d4702de78 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,13 +5,14 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).46
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).47
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = \
 	host-pkgconf \
 	libmpdclient \
 	ncurses \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(TARGET_NLS_DEPENDENCIES)
 NCMPC_LICENSE = GPL-2.0+
 NCMPC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
