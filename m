Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A93C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 13:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D74C80C00;
	Thu, 30 Dec 2021 13:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVy9-3nHpaJu; Thu, 30 Dec 2021 13:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80B0280C02;
	Thu, 30 Dec 2021 13:56:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 135061BF408
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 13:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E5A580BF9
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 13:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ploTQxkNABmS for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 13:56:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C153580BD1
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 13:56:38 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s1so50699513wrg.1
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 05:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F6zM65KEUZM4TgbCkD0HyUjz0WxPfWt/XeNUFefB/vY=;
 b=dWu/OhOciMpHUY351i+hnEpT5qXuzk3TLrR6wVpXFvr4WJCqZSqGUPemevfPXaMOwP
 GYE27ps9p7pjHGOb2hFPx0LXzSexE8snsEISJPx121HnsTHBXsR6MIla5UG0Vnifnhl8
 eLsH/8C+1alrMJHwm/nOnxzuc1+6/BT+b8Ubd885UtodZ/Ad/zQxFt6Y2AhgsuQgIGC7
 HgI1IHoGcDBshsX9Kov8S5L3Z2on8pKuzIyvgdQLOvkVnPmPXSiYGIA+39AAZzqN6hTk
 VM+mVnkc7K9RZXkvKd5WhtrqeASYb0TmbJHl9gdps1HPYIJFZx1uK25fzqUErmawjBqy
 m79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F6zM65KEUZM4TgbCkD0HyUjz0WxPfWt/XeNUFefB/vY=;
 b=as18AnFApgtBnlp70rDCfWxjrAxzEknuR7jhHYqVlvgIByhwyRSzEDXLOa1zgZ96eQ
 wcoLc/yXTFNwUTQohmMlMAUR3sz3ibDXwazQ8F2RZSx5NAjYkKpeFmB8o/IHqqL4c8jc
 /OaTvn4SC1ALFBDsMOgOmTHxdWVm+D7/YBUxffMIfVA7VUPxmWlxQSKSoPfh6x23GvDX
 n6ryyILiMAgm+JlS2bwjwNzL0nRKdQux+m+myJAkroQbrk42vfFeyXF+WmsUiSP0L/vv
 Apx4yxDDNt+HFUXAB9mfNjo0Vy/1u4LTe75nOr0NA52SwuplK4dReN9cpLiKl0x2MtNS
 HySA==
X-Gm-Message-State: AOAM531M5H4H3pa/7LDr9kuONjtE9Gq7tjcIxFV23b8DZOagDZrm8END
 VcFo/squojvz1bDy0gECY+1D0Wdmw4Q=
X-Google-Smtp-Source: ABdhPJy+C03OKwDuQtx+qUtvfJeCWJ+GuoKlbTD5FjnCj44HCxvSyUZC1txA9/dDcPHYZsIX+iJUew==
X-Received: by 2002:adf:fa87:: with SMTP id h7mr24429764wrr.561.1640872597112; 
 Thu, 30 Dec 2021 05:56:37 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l7sm24353765wms.1.2021.12.30.05.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 05:56:36 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 14:56:15 +0100
Message-Id: <20211230135621.2255847-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/7] package/supertux: bump to version 0.6.3
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove upstream patch 0001-CMakeLists.txt-compile-squirrel-with-fPIC.patch

Add new glm dependency added by:

https://github.com/SuperTux/supertux/commit/7187e3f6d7ce2ccc25bcc96e9bee25c24416d545

Add new zlib dependency added by:

https://github.com/SuperTux/supertux/commit/100bc052bc693c2e4978fffe34c9aa4376f8f8c6

Update data/AUTHORS hash since several new assets has been added since
version 0.6.2:

https://github.com/SuperTux/supertux/commit/ec5e2f52137bba2ea7533e020cd8bf4b85e6b904
https://github.com/SuperTux/supertux/commit/1ff490d32206289c72d31c7f78bfeca2956e136b
https://github.com/SuperTux/supertux/commit/14ac958c711837c6cbd1e9362768ababc38effc5
https://github.com/SuperTux/supertux/commit/392320b79006ad1fb99b3f5dd9e771d9ba6a4668
https://github.com/SuperTux/supertux/commit/2fd5ed445c8b00e4c50d0da456543d64015a4681
https://github.com/SuperTux/supertux/commit/e45b5f7f8635e1749eee7a74a9fc9fde13d8344e

See:
https://www.supertux.org/news/2021/12/23/0.6.3

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...Lists.txt-compile-squirrel-with-fPIC.patch | 35 -------------------
 package/supertux/Config.in                    |  2 ++
 package/supertux/supertux.hash                |  4 +--
 package/supertux/supertux.mk                  |  6 ++--
 4 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 package/supertux/0001-CMakeLists.txt-compile-squirrel-with-fPIC.patch

diff --git a/package/supertux/0001-CMakeLists.txt-compile-squirrel-with-fPIC.patch b/package/supertux/0001-CMakeLists.txt-compile-squirrel-with-fPIC.patch
deleted file mode 100644
index 9fac20a3f8..0000000000
--- a/package/supertux/0001-CMakeLists.txt-compile-squirrel-with-fPIC.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 23d0bb0ef0fde52d1cffe235edead09287326fb4 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 4 Oct 2020 01:11:30 +0200
-Subject: [PATCH] CMakeLists.txt: compile squirrel with -fPIC
-
-Ensure that squirrel is compiled with -fPIC to allow linking the static
-libraries with dynamically linked programs. This is not a requirement
-for most architectures but is mandatory for ARM.
-
-Fixes:
-x86_64-buildroot-linux-musl/bin/ld: CMakeFiles/sq_static.dir/sq.c.o: relocation R_X86_64_32 against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIC
-x86_64-buildroot-linux-musl/bin/ld: final link failed: nonrepresentable section on output
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- CMakeLists.txt | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8b1dafa1e..07c603cce 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -412,7 +412,8 @@ ExternalProject_Add(squirrel
-   -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
-   -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
-   -DCMAKE_INSTALL_PREFIX=${SQUIRREL_PREFIX}
--  -DINSTALL_INC_DIR=include)
-+  -DINSTALL_INC_DIR=include
-+  -DCMAKE_POSITION_INDEPENDENT_CODE=ON)
- 
- if(WIN32)
-   add_library(squirrel_lib SHARED IMPORTED)
--- 
-2.25.4
-
diff --git a/package/supertux/Config.in b/package/supertux/Config.in
index 285f19694b..e8e96a3ae5 100644
--- a/package/supertux/Config.in
+++ b/package/supertux/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_SUPERTUX
 	select BR2_PACKAGE_BOOST_LOCALE
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_GLM
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLEW
 	select BR2_PACKAGE_LIBOGG
@@ -26,6 +27,7 @@ config BR2_PACKAGE_SUPERTUX
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_SDL2_IMAGE
 	select BR2_PACKAGE_SDL2_OPENGL
+	select BR2_PACKAGE_ZLIB
 	help
 	  SuperTux is a free classic 2D jump'n run sidescroller game in
 	  a style similar to the original Super Mario games covered
diff --git a/package/supertux/supertux.hash b/package/supertux/supertux.hash
index a6a515f912..f28c06b5e7 100644
--- a/package/supertux/supertux.hash
+++ b/package/supertux/supertux.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  26a9e56ea2d284148849f3239177d777dda5b675a10ab2d76ee65854c91ff598  SuperTux-v0.6.2-Source.tar.gz
+sha256  f7940e6009c40226eb34ebab8ffb0e3a894892d891a07b35d0e5762dd41c79f6  SuperTux-v0.6.3-Source.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.txt
-sha256  09645215102c1013a1ef8c16a30bacdb9a78924ca064372290405fabd3e7074d  data/AUTHORS
+sha256  a000d91146a61b44bdb79c3d2737e82d488b6cd65a23e0415e56915233def0a0  data/AUTHORS
diff --git a/package/supertux/supertux.mk b/package/supertux/supertux.mk
index 3587aefe3a..3941632f51 100644
--- a/package/supertux/supertux.mk
+++ b/package/supertux/supertux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUPERTUX_VERSION = 0.6.2
+SUPERTUX_VERSION = 0.6.3
 SUPERTUX_SITE = https://github.com/SuperTux/supertux/releases/download/v$(SUPERTUX_VERSION)
 SUPERTUX_SOURCE = SuperTux-v$(SUPERTUX_VERSION)-Source.tar.gz
 
@@ -15,8 +15,8 @@ SUPERTUX_LICENSE_FILES = LICENSE.txt data/AUTHORS
 
 # Use bundled squirrel, tinygettext sexp-cpp packages which are hardcoded in
 # the CMake build system.
-SUPERTUX_DEPENDENCIES = host-pkgconf boost freetype libcurl libgl libglew \
-	libogg libpng libvorbis openal physfs sdl2 sdl2_image
+SUPERTUX_DEPENDENCIES = host-pkgconf boost freetype glm libcurl libgl libglew \
+	libogg libpng libvorbis openal physfs sdl2 sdl2_image zlib
 
 # CMAKE_BUILD_TYPE=Release: disable profiling code (-pg)
 # ENABLE_BOOST_STATIC_LIBS=OFF: use boost shared libraries since supertux
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
