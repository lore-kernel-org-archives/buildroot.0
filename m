Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A056AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:36:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41C7B60F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41C7B60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D9FE404A8;
	Tue,  3 Aug 2021 23:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id goG33oPGclqe; Tue,  3 Aug 2021 23:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA18740515;
	Tue,  3 Aug 2021 23:36:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 531B01BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6010A40EF9
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X1FFpuvqvCBc for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9417040E8D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E84D187F55; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 11:51:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1cf3c394c7c40b1b093e4a77d5512d52ca3006e2
X-Git-Newrev: dc1970260bed838022b4829da9e3bb75555e130e
X-Patchwork-Hint: ignore
Message-Id: <20210803211005.E84D187F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/solarus: fix OpenGLES2
 build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=dc1970260bed838022b4829da9e3bb75555e130e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

1. Adds a patch that fixes OpenGLES2 build
   https://gitlab.com/solarus-games/solarus/-/merge_requests/1364

2. Updates Config.in and solarus.mk to support OpenGLES2

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
[yann.morin.1998@free.fr: renumber patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0002-Add-a-basic-FindOpenGLES2.cmake.patch     | 48 ++++++++++++++++++++++
 package/solarus/Config.in                          |  2 +-
 package/solarus/solarus.mk                         |  9 +++-
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/package/solarus/0002-Add-a-basic-FindOpenGLES2.cmake.patch b/package/solarus/0002-Add-a-basic-FindOpenGLES2.cmake.patch
new file mode 100644
index 0000000000..59bf9e8cf4
--- /dev/null
+++ b/package/solarus/0002-Add-a-basic-FindOpenGLES2.cmake.patch
@@ -0,0 +1,48 @@
+From 2bf0e98f17d92fd86ee61be179e3cebe93f75ea7 Mon Sep 17 00:00:00 2001
+From: Gleb Mazovetskiy <glex.spb@gmail.com>
+Date: Sun, 3 Jan 2021 12:38:13 +0000
+Subject: [PATCH] Add a basic FindOpenGLES2.cmake
+
+Fixes #1324
+---
+ cmake/modules/FindOpenGLES2.cmake | 28 ++++++++++++++++++++++++++++
+ 1 file changed, 28 insertions(+)
+ create mode 100644 cmake/modules/FindOpenGLES2.cmake
+
+diff --git a/cmake/modules/FindOpenGLES2.cmake b/cmake/modules/FindOpenGLES2.cmake
+new file mode 100644
+index 000000000..70fd5e6f0
+--- /dev/null
++++ b/cmake/modules/FindOpenGLES2.cmake
+@@ -0,0 +1,28 @@
++# Try to find OpenGLES2. Once done this will define:
++#     OPENGLES2_FOUND
++#     OPENGLES2_INCLUDE_DIRS
++#     OPENGLES2_LIBRARIES
++#     OPENGLES2_DEFINITIONS
++
++find_package(PkgConfig QUIET)
++
++pkg_check_modules(PC_OPENGLES2 glesv2)
++
++if (PC_OPENGLES2_FOUND)
++    set(OPENGLES2_DEFINITIONS ${PC_OPENGLES2_CFLAGS_OTHER})
++endif ()
++
++find_path(OPENGLES2_INCLUDE_DIRS NAMES GLES2/gl2.h
++    HINTS ${PC_OPENGLES2_INCLUDEDIR} ${PC_OPENGLES2_INCLUDE_DIRS}
++)
++
++set(OPENGLES2_NAMES ${OPENGLES2_NAMES} glesv2 GLESv2)
++find_library(OPENGLES2_LIBRARIES NAMES ${OPENGLES2_NAMES}
++    HINTS ${PC_OPENGLES2_LIBDIR} ${PC_OPENGLES2_LIBRARY_DIRS}
++)
++
++include(FindPackageHandleStandardArgs)
++find_package_handle_standard_args(OpenGLES2 REQUIRED_VARS OPENGLES2_INCLUDE_DIRS OPENGLES2_LIBRARIES
++                                  FOUND_VAR OPENGLES2_FOUND)
++
++mark_as_advanced(OPENGLES2_INCLUDE_DIRS OPENGLES2_LIBRARIES)
+-- 
+2.27.0
+
diff --git a/package/solarus/Config.in b/package/solarus/Config.in
index b0f4121f6d..bcfa640890 100644
--- a/package/solarus/Config.in
+++ b/package/solarus/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_SOLARUS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on !BR2_STATIC_LIBS # SDL2
-	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_GLM
 	select BR2_PACKAGE_LIBMODPLUG
 	select BR2_PACKAGE_LIBOGG
diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
index 90cbf3e784..07d9af5248 100644
--- a/package/solarus/solarus.mk
+++ b/package/solarus/solarus.mk
@@ -16,7 +16,7 @@ SOLARUS_LICENSE_FILES = license.txt
 # Install libsolarus.so
 SOLARUS_INSTALL_STAGING = YES
 
-SOLARUS_DEPENDENCIES = glm libgl libmodplug libogg libvorbis openal physfs \
+SOLARUS_DEPENDENCIES = glm libmodplug libogg libvorbis openal physfs \
 	sdl2 sdl2_image sdl2_ttf
 
 # Disable launcher GUI (requires Qt5)
@@ -24,6 +24,13 @@ SOLARUS_CONF_OPTS = \
 	-DSOLARUS_GUI=OFF \
 	-DSOLARUS_TESTS=OFF
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+SOLARUS_DEPENDENCIES += libgl
+else
+SOLARUS_CONF_OPTS += -DSOLARUS_GL_ES=ON
+SOLARUS_DEPENDENCIES += libgles
+endif
+
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
 SOLARUS_CONF_OPTS += -DSOLARUS_USE_LUAJIT=ON
 SOLARUS_DEPENDENCIES += luajit
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
