Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FB3C77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 11:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38A6D82128;
	Sun, 23 Apr 2023 11:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38A6D82128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id honrfCu1SH9F; Sun, 23 Apr 2023 11:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3751982154;
	Sun, 23 Apr 2023 11:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3751982154
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B7B31C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 658DE817A4
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 658DE817A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGX-zZ1BMqkO for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 11:02:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87A178176D
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 11:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87A178176D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74C028448C; Sun, 23 Apr 2023 11:02:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 13:01:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f9622fe3d85b4d9f734b879abc1d485afea19b2
X-Git-Newrev: b5b1d830b8713393d63227caa09064aa594e15cb
X-Patchwork-Hint: ignore
Message-Id: <20230423110248.74C028448C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glib-networking: bump version to
 2.76.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5b1d830b8713393d63227caa09064aa594e15cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop "0001-meson-change-std-to-gnu99.patch" since change is available
   in this version.

Signed-off-by: James Knight <james.d.knight@live.com>
[yann.morin.1998@free.fr: regenerate .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 .../0001-meson-change-std-to-gnu99.patch           | 30 ----------------------
 package/glib-networking/glib-networking.hash       |  4 +--
 package/glib-networking/glib-networking.mk         |  4 +--
 4 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2758ad9377..5f6538ea74 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -606,7 +606,6 @@ package/giblib/0001-fix-imlib2-detection.patch Upstream
 package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch Upstream
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch Upstream
 package/gli/0001-Optional-building-tests.patch Upstream
-package/glib-networking/0001-meson-change-std-to-gnu99.patch Upstream
 package/glmark2/0001-wscript-use-find_program-to-find-wayland-scanner.patch Upstream
 package/glmark2/0002-libmatrix-Add-missing-utility-include.patch Upstream
 package/glog/0001-added-emscripten-support.patch Upstream
diff --git a/package/glib-networking/0001-meson-change-std-to-gnu99.patch b/package/glib-networking/0001-meson-change-std-to-gnu99.patch
deleted file mode 100644
index 9f266bc2c8..0000000000
--- a/package/glib-networking/0001-meson-change-std-to-gnu99.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From cdfa726bae1d82b7bd3735475fc2b2c6a31c1d2f Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <qignacio@amazon.com>
-Date: Fri, 12 Nov 2021 11:51:33 +0100
-Subject: [PATCH] meson: change std to gnu99
-
-This is the same as glib and should fix issues with old
-compilers
-
-(cherry picked from commit b192086b9936602a40a14d00a6883b339b9d7955)
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index b018ca7b..130a2bf0 100644
---- a/meson.build
-+++ b/meson.build
-@@ -3,7 +3,7 @@ project(
-   version: '2.70.0',
-   license: 'LGPL2.1+',
-   meson_version: '>= 0.50.0',
--  default_options: ['c_std=c99']
-+  default_options: ['c_std=gnu99']
- )
- 
- prefix = get_option('prefix')
--- 
-2.17.1
-
diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 766efd0ced..72e70ff0ed 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,3 +1,3 @@
-# From https://download.gnome.org/sources/glib-networking/2.70/glib-networking-2.70.1.sha256sum
-sha256  2a16bfc2d271ccd3266e3fb462bc8a4103c02e81bbb339aa92d6fb060592d7bc  glib-networking-2.70.1.tar.xz
+# From https://download.gnome.org/sources/glib-networking/2.76/glib-networking-2.76.0.sha256sum
+sha256  149a05a179e629a538be25662aa324b499d7c4549c5151db5373e780a1bf1b9a  glib-networking-2.76.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index b6d29110ed..2481171658 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.70
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
+GLIB_NETWORKING_VERSION_MAJOR = 2.76
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
 GLIB_NETWORKING_SITE = https://download.gnome.org/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
