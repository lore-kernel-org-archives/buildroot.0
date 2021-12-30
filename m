Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC570C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59E1C4015E;
	Thu, 30 Dec 2021 14:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvcEVaVl1-YT; Thu, 30 Dec 2021 14:07:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95E9A4036F;
	Thu, 30 Dec 2021 14:07:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A049D1BF2BC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E22640270
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JT9siBUnSwxb for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:07:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90D8D4017E
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:07:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9AFCA82DD9; Thu, 30 Dec 2021 14:01:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 15:05:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ac4d6879b30bc267af1f1b382d9ac93f5aa1c28
X-Git-Newrev: 2d7a3e48c574c05346b66f79cdb75ecdfa7f074e
X-Patchwork-Hint: ignore
Message-Id: <20211230140124.9AFCA82DD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/efl: bump to version 1.26.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d7a3e48c574c05346b66f79cdb75ecdfa7f074e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

efl disable libinput
efl disable heif (there is no libheif package in Buildroot)

See:
https://www.enlightenment.org/news/2021-12-26-efl-1.26.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch | 4 ++--
 ...002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch | 4 ++--
 package/efl/0003-ecore_fb-fix-build-with-tslib.patch              | 4 ++--
 package/efl/efl.hash                                              | 4 ++--
 package/efl/efl.mk                                                | 8 +++++---
 5 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch b/package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
index 185926ac46..8fa4658f06 100644
--- a/package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
+++ b/package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
@@ -1,4 +1,4 @@
-From 51dfe1863ddc8c5dd576405a9bbb8bca875c1142 Mon Sep 17 00:00:00 2001
+From 00833baac6935bd1e3e9856211bc165c5b02a7bd Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sat, 1 Aug 2020 02:25:47 +0200
 Subject: [PATCH] ecore_evas/engines/drm/meson.build: use "gl_deps" as engine
@@ -32,5 +32,5 @@ index 58071010d0..0741d7fccd 100644
  
  engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'drm'))
 -- 
-2.25.4
+2.31.1
 
diff --git a/package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch b/package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
index 89ec838a72..3465fc50aa 100644
--- a/package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
+++ b/package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
@@ -1,4 +1,4 @@
-From 8548b02c487ba7e9d78489c6db58812ee5cfb197 Mon Sep 17 00:00:00 2001
+From a21e71cc2284a19a34c913aff757e656e3a8c14a Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sat, 1 Aug 2020 01:01:00 +0200
 Subject: [PATCH] ecore_evas/engines/drm/meson.build: fix "gl_drm" include
@@ -33,5 +33,5 @@ index 0741d7fccd..edda1abd71 100644
  shared_module(mod_full_name, engine_src,
    include_directories : config_dir + [engine_include_dir],
 -- 
-2.25.4
+2.31.1
 
diff --git a/package/efl/0003-ecore_fb-fix-build-with-tslib.patch b/package/efl/0003-ecore_fb-fix-build-with-tslib.patch
index 8eb159505f..2756e0932d 100644
--- a/package/efl/0003-ecore_fb-fix-build-with-tslib.patch
+++ b/package/efl/0003-ecore_fb-fix-build-with-tslib.patch
@@ -1,4 +1,4 @@
-From 9a785396a7940ec541cf4793f9c9f92548c99d4c Mon Sep 17 00:00:00 2001
+From 836b13de08980d89fc13690284efd355c1b43218 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 10 Jul 2021 22:38:03 +0200
 Subject: [PATCH] ecore_fb: fix build with tslib
@@ -31,5 +31,5 @@ index 6d50e0f146..7c7f6786c3 100644
      install: true,
      version : meson.project_version()
 -- 
-2.30.2
+2.31.1
 
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 69008cde23..6364d276c0 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,5 +1,5 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.25.1.tar.xz.sha256sum
-sha256  351ca0211ca000234527a503585f039f985607ec9439e34b49d8b8bbf35a7e6b  efl-1.25.1.tar.xz
+# From https://www.enlightenment.org/news/2021-12-26-efl-1.26.0
+sha256  a4a9bce45fd27f8541874e44a130f64550bee1f2f72feaa6c8a758d92eaf204c  efl-1.26.0.tar.xz
 
 sha256  d666b6b2df9f5b791f85c299c65516cb55528b02a807603de246f65f4918ae22  COMPLIANCE
 sha256  5bceb52d65debe420bc520f2992807740dc928b7fdc3c2e9a74b5889177ddf4c  COPYING
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index cdb05aa551..46bce29305 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.25.1
+EFL_VERSION = 1.26.0
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
@@ -209,7 +209,7 @@ EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
 # json evas loader is disabled by default by upstream.
 # Disable libspectre (ps).
 # Keep all other evas loader enabled or handled below.
-EFL_EVAS_LOADERS_DISABLER = avif gst json ps
+EFL_EVAS_LOADERS_DISABLER = avif gst heif json ps
 
 # efl already depends on jpeg.
 ifeq ($(BR2_PACKAGE_EFL_JPEG),y)
@@ -302,6 +302,7 @@ HOST_EFL_DEPENDENCIES = \
 # Configure options:
 # audio=false: remove libsndfile dependency.
 # eeze=false: remove libudev dependency.
+# input=false: remove libinput dependency.
 # libmount=false: remove dependency on host-util-linux libmount.
 # elua=true: build elua for the host.
 # physics=false: remove Bullet dependency.
@@ -324,6 +325,7 @@ HOST_EFL_CONF_OPTS += \
 	-Dglib=true \
 	-Dgstreamer=false \
 	-Dharfbuzz=false \
+	-Dinput=false \
 	-Dlibmount=false \
 	-Dlua-interpreter=luajit \
 	-Dnetwork-backend=none \
@@ -340,7 +342,7 @@ HOST_EFL_CONF_OPTS += \
 	-Dxinput22=false
 
 # List of modular image/vector loaders to disable in efl
-HOST_EFL_EVAS_LOADERS_DISABLER = avif bmp dds eet generic gst ico json \
+HOST_EFL_EVAS_LOADERS_DISABLER = avif bmp dds eet generic gst heif ico json \
 	jp2k pdf pmaps ps psd raw rsvg tga tgv tiff wbmp webp xcf xpm
 
 HOST_EFL_CONF_OPTS += -Devas-loaders-disabler=$(subst $(space),$(comma),$(HOST_EFL_EVAS_LOADERS_DISABLER))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
