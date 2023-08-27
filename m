Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43C5C83F01
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 15:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61BB780C58;
	Sun, 27 Aug 2023 15:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61BB780C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id US9VcFFMlXZm; Sun, 27 Aug 2023 15:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80D6380D0F;
	Sun, 27 Aug 2023 15:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80D6380D0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24F561BF5DF
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 15:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F17C6409F1
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 15:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F17C6409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HwQgayAnRKuy for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 15:18:34 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 671E04099F
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 15:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 671E04099F
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-400e8ca7e38so20881595e9.3
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 08:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693149512; x=1693754312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s85IAmvMje5I0IY6rMlOjursSsqY1Xfon5ye90GW7Rg=;
 b=TZfAuwXL7GZBop+w4OsLfuRDTMKjA62KGdvzb1KPGBJF+BO6Ue5SH73f2M1bmbaP1/
 Tq5jkbuDWssFn3QoZ6xFSMgCEDKSiy7t9z+uV2BmZZ0jNN9bKdiPZ1FVZBdU/DzHFtJB
 haT3V4NW32510gasPpnIIHracqjMvdehKnKR36iyAN2JGuwGmEJ2hb8RhEQE3whspe0D
 gyfM1V14R+nfR4RiBF9QTDd+nJ0ZnWfeYQJOjYPZWYrq200NBgB4oeqRb5ZFUTX/enGA
 +S39G7E4oA+3oiKMkIeKrqTaSmvQzuyJaXFzXoGRe5XU872Jg4U/CPTAK+sHxsPmm0SC
 LYWg==
X-Gm-Message-State: AOJu0YxNOqUNeJYnS5wsU94QI9p6+QM/s6mRJXpg32OG8a4tsRfNiBfa
 G8zuXwYimnB6pQHJMPBkhSwKcImIfPk=
X-Google-Smtp-Source: AGHT+IFEK5gXrocfKyuBlvkWZiGmB33qk1Ygver4g4N5bvpRzGQbjhCbOuJF3yYX3N71O94u6A9hxg==
X-Received: by 2002:a5d:678d:0:b0:315:a17d:dbc6 with SMTP id
 v13-20020a5d678d000000b00315a17ddbc6mr18076952wru.14.1693149512196; 
 Sun, 27 Aug 2023 08:18:32 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a5d6184000000b0030ae53550f5sm7876822wru.51.2023.08.27.08.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Aug 2023 08:18:31 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Aug 2023 17:18:28 +0200
Message-ID: <20230827151828.515020-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693149512; x=1693754312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s85IAmvMje5I0IY6rMlOjursSsqY1Xfon5ye90GW7Rg=;
 b=geOTwtVTxFhwa1GGwEEgbo4/aXnqnTdNrTu/KapTW64ipz796KfhgB6z6uYC2fjQlD
 f9uaPh4sD1/d8aJWImFwzHRZfQmXLWpWATmx6t1ipCriU+Mae57NqnozVgcWJDQAZs53
 6kKygDKu4LGsZ5LbATTPvsucB+z27BRPjQn0h9KGjlPIA5/MsXhRY1784TT311kggJP5
 v7XQnDHTpKKrh2DM+busu0M2QmxsO+eB40nEj3FjvOoZgNF30B9+HyLZQ1e9gkqUIHJp
 cpWDAzNuXp24/S31DLd+7qJ+TC27N7qR5S4uI/u31x2vfyOgIo9bxzipON1Fr6iemLCl
 MxCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=geOTwtVT
Subject: [Buildroot] [PATCH] package/mesa3d-demos: update optional opengl
 patch due to new glu dependency in util
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

matrix-code from es2gears has been moved to util in version 9.0.0 [1]
so now es2gears is linked with mesa3d-demo libutil (idep_util).
But at the same time the dependency on glu (dep_glu) has been added
to libutil [2]. dep_glu requires opengl (FULL_GL) to build.

In order to keep the es2gears for egl only builds we have to
split the libutil files list to build readtex.c and showbuffer.c
only if opengl is available.

Add back dep_glu since it's used in util's meson.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948236
https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948042

[1] https://gitlab.freedesktop.org/mesa/demos/-/commit/c33e2f731c2eab86bbad7b6a028f8a90ea40a00c
[2] https://gitlab.freedesktop.org/mesa/demos/-/commit/ef24aae22978d4d357340074ca9a1c04d9cf81e6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
---
 ...s-makes-opengl-an-optional-component.patch | 95 ++++++++++---------
 1 file changed, 50 insertions(+), 45 deletions(-)

diff --git a/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch b/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
index af929003db..72bf72719c 100644
--- a/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
+++ b/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch
@@ -1,25 +1,44 @@
-From 9ec9f7b4d0ef5e799ca4cc5103163e4630d184d8 Mon Sep 17 00:00:00 2001
+From 5b45f98255b74589015d5cb0d8ca31d7169c9f34 Mon Sep 17 00:00:00 2001
 From: Julien Olivain <ju.o@free.fr>
 Date: Fri, 16 Sep 2022 22:30:59 +0200
 Subject: [PATCH] demos: makes opengl an optional component
 
 This patch is a port of [1] for the new meson build system.
 
+matrix-code from es2gears has been moved to util in version 9.0.0 [2]
+so now es2gears is linked with mesa3d-demo libutil (idep_util).
+But at the same time the dependency on glu (dep_glu) has been added
+to libutil [3]. dep_glu requires opengl (FULL_GL) to build.
+
+In order to keep the es2gears for egl only builds we have to
+split the libutil files list to build readtex.c and showbuffer.c
+only if opengl is available.
+
+Add back dep_glu since it's used in util's meson.
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948236
+https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948042
+
 [1].
 https://git.busybox.net/buildroot/tree/package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch?h=2022.08
+[2] https://gitlab.freedesktop.org/mesa/demos/-/commit/c33e2f731c2eab86bbad7b6a028f8a90ea40a00c
+[3] https://gitlab.freedesktop.org/mesa/demos/-/commit/ef24aae22978d4d357340074ca9a1c04d9cf81e6
 
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 [Bernd: rebased for version 9.0.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Romain: fix egl only builds in util]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
- meson.build         | 19 ++++++++++++-------
- meson_options.txt   |  1 +
- src/egl/meson.build |  5 ++++-
- src/meson.build     |  4 +++-
- 4 files changed, 20 insertions(+), 9 deletions(-)
+ meson.build          |  5 ++++-
+ meson_options.txt    |  1 +
+ src/egl/meson.build  |  5 ++++-
+ src/util/meson.build | 12 +++++++++---
+ 4 files changed, 18 insertions(+), 5 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index e1968fab..a15699d6 100644
+index 3e39b5a2..f27e1a18 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -39,7 +39,10 @@ add_project_arguments(
@@ -34,34 +53,8 @@ index e1968fab..a15699d6 100644
  
  dep_epoll = dependency('epoll-shim', required : false)
  dep_gles1 = dependency('glesv1_cm', required : get_option('gles1'))
-@@ -87,15 +87,17 @@
- 
- dep_threads = dependency('threads')
- 
--dep_glu = dependency('glu', required : false)
--# GLU is part of OpenGL.Framework
--if not dep_glu.found() and host_machine.system() != 'darwin'
--  _glu_name = 'GLU'
--  if host_machine.system() == 'windows'
--    _glu_name = 'glu32'
-+if dep_gl.found()
-+  dep_glu = dependency('glu', required : false)
-+  # GLU is part of OpenGL.Framework
-+  if not dep_glu.found() and host_machine.system() != 'darwin'
-+    _glu_name = 'GLU'
-+    if host_machine.system() == 'windows'
-+      _glu_name = 'glu32'
-+    endif
-+    dep_glu = cc.find_library(_glu_name, has_headers: 'GL/glu.h',
-+      required : dep_x11.found())
-   endif
--  dep_glu = cc.find_library(_glu_name, has_headers: 'GL/glu.h',
--    required : dep_x11.found())
- endif
- 
- dep_glx = dependency('glx', required: false, disabler : true)
 diff --git a/meson_options.txt b/meson_options.txt
-index ddadd2e3..f5405698 100644
+index 832b916a..c954a710 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -1,5 +1,6 @@
@@ -87,21 +80,33 @@ index d1846921..42bf8ecd 100644
  
  if dep_gles1.found()
    subdir('opengles1')
-diff --git a/src/meson.build b/src/meson.build
-index 39cac78d..7607c6de 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -20,7 +20,9 @@
+diff --git a/src/util/meson.build b/src/util/meson.build
+index b4fe614f..4420f28a 100644
+--- a/src/util/meson.build
++++ b/src/util/meson.build
+@@ -22,13 +22,19 @@ inc_util = include_directories('.')
  
- subdir('glad')
+ files_libutil = files(
+   'glinfo_common.c',
+-  'readtex.c',
+-  'showbuffer.c',
+   'trackball.c',
+   'matrix.c',
+ )
  
--subdir('util')
+-_deps = [dep_glu, dep_m]
++_deps = [dep_m]
 +if dep_gl.found()
-+  subdir('util')
++  files_libutil += files(
++    'readtex.c',
++    'showbuffer.c',
++  )
++  _deps += dep_glu
 +endif
- 
++
  if dep_glut.found()
-   subdir('demos')
+   files_libutil += files('shaderutil.c')
+   _deps += dep_glut
 -- 
-2.37.3
+2.41.0
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
