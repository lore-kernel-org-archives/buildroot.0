Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2248EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 07:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F381360A6D;
	Sun,  9 Jul 2023 07:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F381360A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWlJmUW1InRz; Sun,  9 Jul 2023 07:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E83F760A84;
	Sun,  9 Jul 2023 07:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E83F760A84
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA5AE1BF574
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 07:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8078C40891
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 07:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8078C40891
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7R4lklPMHKEh for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 07:55:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 263D74088B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 263D74088B
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 07:55:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 34197A4C0A7B;
 Sun,  9 Jul 2023 09:55:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43226)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIPGh-0003cU-2w;
 Sun, 09 Jul 2023 09:55:44 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Jul 2023 09:55:43 +0200
Message-Id: <20230709075543.400474-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709075543.400474-1-bernd@kuhls.net>
References: <20230709075543.400474-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688889344;
 bh=DVCuS+TjCCouGhxVAwTHI08dEvGUbVn0WibKMZ1bZic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sPQ6tT1ogp+Z2onQQxwj0Mup+C/9e3RQLGdgDIJQUXfX2C1U21KnI5Y8ih4sQgXp8
 ffE6R8cB9rgr1Z2jRK4AQYX+tsiTyV3U+0lPH6VijnZY1Junw6tMtk3h68vvrqFE8T
 iIzFfRuwNemrwqWRxHrI7MmmjQnDEEQvENAfr3bO3+Mibkoyz3g8AJpeuxO0pdUjOk
 sgFdtpujy7rjYrKRaNCyQXWyIlzloFYYr3U/p6m35kntxGsdVFFoUREU9csS61SpSm
 Prpwo265mTUAOpW8ItqDFEJuclguBDvK46TAajq3myL4eWPmfkb7OSfoupKuECPFVk
 di6k4YwZxUCKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=sPQ6tT1o
Subject: [Buildroot] [PATCH 2/2] package/mesa3d-demos: bump version to 9.0.0
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
Cc: Spenser Gilliland <spenser@gillilanding.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2023-March/000711.html

Rebased patch, switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...s-makes-opengl-an-optional-component.patch | 28 +++++++++++--------
 package/mesa3d-demos/mesa3d-demos.hash        |  6 ++--
 package/mesa3d-demos/mesa3d-demos.mk          |  6 ++--
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
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
