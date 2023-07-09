Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9ADEB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 372026073F;
	Sun,  9 Jul 2023 16:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 372026073F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8_Qh8G5r8m0G; Sun,  9 Jul 2023 16:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E3D4606F5;
	Sun,  9 Jul 2023 16:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E3D4606F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF6301BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5E71409B6
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5E71409B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rh0DvdsL7P0 for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:44:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47172409B0
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47172409B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33C3E8696D; Sun,  9 Jul 2023 16:44:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Jul 2023 18:40:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1a7079a2387738044dd76105267d6477418df48
X-Git-Newrev: 80304d9911f34f8a0173a4f37d52f93177478cc7
X-Patchwork-Hint: ignore
Message-Id: <20230709164444.33C3E8696D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d-demos: bump version to 9.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=80304d9911f34f8a0173a4f37d52f93177478cc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2023-March/000711.html

Rebased patch, switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-demos-makes-opengl-an-optional-component.patch | 28 +++++++++++++---------
 package/mesa3d-demos/mesa3d-demos.hash             |  6 ++---
 package/mesa3d-demos/mesa3d-demos.mk               |  6 ++---
 3 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch b/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
index e51b6f1a2a..af929003db 100644
--- a/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
+++ b/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
@@ -9,6 +9,8 @@ This patch is a port of [1] for the new meson build system.
 https://git.busybox.net/buildroot/tree/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch?h=2022.08
 
 Signed-off-by: Julien Olivain <ju.o@free.fr>
+[Bernd: rebased for version 9.0.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  meson.build         | 19 ++++++++++++-------
  meson_options.txt   |  1 +
@@ -20,7 +22,7 @@ diff --git a/meson.build b/meson.build
 index e1968fab..a15699d6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -38,7 +38,10 @@ add_project_arguments(
+@@ -39,7 +39,10 @@ add_project_arguments(
  dep_m = cc.find_library('m', required : false)
  dep_winmm = cc.find_library('winmm', required : false)
  
@@ -30,30 +32,34 @@ index e1968fab..a15699d6 100644
 +  add_project_arguments('-DEGL_NO_X11=1', language: 'c')
 +endif
  
+ dep_epoll = dependency('epoll-shim', required : false)
  dep_gles1 = dependency('glesv1_cm', required : get_option('gles1'))
- dep_gles2 = dependency('glesv2', required : get_option('gles2'))
-@@ -75,13 +78,15 @@ endif
+@@ -87,15 +87,17 @@
  
  dep_threads = dependency('threads')
  
--dep_glu = dependency('glu', required : dep_x11.found())
--if not dep_glu.found()
+-dep_glu = dependency('glu', required : false)
+-# GLU is part of OpenGL.Framework
+-if not dep_glu.found() and host_machine.system() != 'darwin'
 -  _glu_name = 'GLU'
 -  if host_machine.system() == 'windows'
 -    _glu_name = 'glu32'
 +if dep_gl.found()
-+  dep_glu = dependency('glu', required : dep_x11.found())
-+  if not dep_glu.found()
++  dep_glu = dependency('glu', required : false)
++  # GLU is part of OpenGL.Framework
++  if not dep_glu.found() and host_machine.system() != 'darwin'
 +    _glu_name = 'GLU'
 +    if host_machine.system() == 'windows'
 +      _glu_name = 'glu32'
 +    endif
-+    dep_glu = cc.find_library(_glu_name, has_headers: 'GL/glu.h')
++    dep_glu = cc.find_library(_glu_name, has_headers: 'GL/glu.h',
++      required : dep_x11.found())
    endif
--  dep_glu = cc.find_library(_glu_name, has_headers: 'GL/glu.h')
+-  dep_glu = cc.find_library(_glu_name, has_headers: 'GL/glu.h',
+-    required : dep_x11.found())
  endif
  
- # GBM is needed for EGL on KMS
+ dep_glx = dependency('glx', required: false, disabler : true)
 diff --git a/meson_options.txt b/meson_options.txt
 index ddadd2e3..f5405698 100644
 --- a/meson_options.txt
@@ -64,7 +70,7 @@ index ddadd2e3..f5405698 100644
 +option('gl',                     type : 'feature')
  option('gles1',                  type : 'feature')
  option('gles2',                  type : 'feature')
- option('osmesa',                 type : 'feature')
+ option('glut',                   type : 'feature')
 diff --git a/src/egl/meson.build b/src/egl/meson.build
 index d1846921..42bf8ecd 100644
 --- a/src/egl/meson.build
diff --git a/package/mesa3d-demos/mesa3d-demos.hash b/package/mesa3d-demos/mesa3d-demos.hash
index b0cfb88816..cdf9adb3fd 100644
--- a/package/mesa3d-demos/mesa3d-demos.hash
+++ b/package/mesa3d-demos/mesa3d-demos.hash
@@ -1,3 +1,3 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2022-May/000677.html
-sha256  cea2df0a80f09a30f635c4eb1a672bf90c5ddee0b8e77f4d70041668ef71aac1  mesa-demos-8.5.0.tar.bz2
-sha512  df6a7f09638ca389d6e8bc569e599dcc59c9aa280bcfb95976d83e5cd3edfe74bb3a31f0953956dc16faa540ee5b09990e3377e1341d836fc527e50ace6e60b8  mesa-demos-8.5.0.tar.bz2
+# From https://lists.freedesktop.org/archives/mesa-announce/2023-March/000711.html
+sha256  3046a3d26a7b051af7ebdd257a5f23bfeb160cad6ed952329cdff1e9f1ed496b  mesa-demos-9.0.0.tar.xz
+sha512  af33ef72a521416e39d93370b2b4ccb768f08084c9e4c0aa62868210d9465c858e5cb8e5d23952295a3073946f609eb8723ee60b39dd9fb6696c4e45aafbb2c1  mesa-demos-9.0.0.tar.xz
diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index 5f7fe8e24d..29cb00bb8a 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MESA3D_DEMOS_VERSION = 8.5.0
-MESA3D_DEMOS_SOURCE = mesa-demos-$(MESA3D_DEMOS_VERSION).tar.bz2
-MESA3D_DEMOS_SITE = https://archive.mesa3d.org/demos/$(MESA3D_DEMOS_VERSION)
+MESA3D_DEMOS_VERSION = 9.0.0
+MESA3D_DEMOS_SOURCE = mesa-demos-$(MESA3D_DEMOS_VERSION).tar.xz
+MESA3D_DEMOS_SITE = https://archive.mesa3d.org/demos
 MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
 MESA3D_DEMOS_LICENSE = MIT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
