Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736FD606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pbscA+V6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwrNiWtV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 493878123C;
	Fri,  6 Nov 2026 14:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLqcOH8cOJBh; Fri,  6 Nov 2026 14:34:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 30A9081246
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793975657;
	b=iKIgQ6dy761svCT3ZVBNhHwUvQxnkdFIfJ36sGkf9Jr52Z6pE0kv00SiBA8oIhVrtl4F
	 sOoaKt/lYrZ/zCCBaU3apBpXHZWy9sxneJGfChzt6DjWDm996a0jgh0feAqtYr5FrHtOU
	 DbPky0NwI2oPt74k+KS5lEXjaIWSumrtX7wm5fV0ecr3FYkd5nrVjCboPrfp3pVtq0qWI
	 ajSEVkbRA0MjSW4Jb3Z+/iHiQ/dYqr8uYzpz1q4PCJJDOh58fmUhXfLiWtdkvErpjg7AS
	 evIZMQHuIFZ2N5L0fE8XWPk/QhCyOAswNvxGABmMinVeBDSxtO/UhA67voC7dA0xxYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793975657;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=MXLOYSADtsqshE0Di1nhjA14n//h0t37f4Dig/9+9aA=;
	b=qb1lrZgUxZm6emvy5GSg7sC5GZN3kSpMsYAn6qRlGiED2cajV7MWrAdcl/qz53gt/hS0
	 XgEz8wMVYYR5Q9I6SJ2Kqhj3cnWYo5Z1UrUtY3Z4sZHm2N1BeKJNpb5UgRYnRtTySXUs2
	 ZH4vKutGKyt9o4AQxI9pT44NFHqdfIAOhql1f4yt0Xps8P1SWrN9uhv1YHUvbL2hmkXcu
	 AYJZjaBCE7960FsKk+EsCPGN8M30zYh2JyYNXeM+1afFqfw1gcNa2jgHqK724q/fOXEKT
	 rzjzj0dlF10IgwWpQWU6lrDr75CmOw8NH/l336S+KTNfrdYszKxjnCYoMaLJhdIalFw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793975657;
	bh=MXLOYSADtsqshE0Di1nhjA14n//h0t37f4Dig/9+9aA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pbscA+V6YGODR17B5e80D6U334PNtcnGxtkHMwpts4JqyyUjTqJhWFlkVN9LvLxPI
	 JJyXn6EKebEurzw7gjrjGnFCFPERRCQBjeMJ1f9TrV562PmpAKv9gmY/ItU+OZfIOH
	 NzWi5S5NLZ1EyZDXRt9S0qLj9kquadUQ3cjL7fXxQJddIZHASLlcAgCxiOhp2hyUTg
	 AhpjC0RbkLcY/AuzYE4YdjarmQ5MfNwb+FB/Y+xfBHWvsZ4BLxQegoqgPZIgx0KXaL
	 c9MI+T4JHLsSvOtpYTN9yjuuji0S2E+0Ui6FtdsRgE5NTSbk7ojp2AMHxfA2dy/SMf
	 lx5BegjgFUCYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30A9081246;
	Fri,  6 Nov 2026 14:34:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B21432A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 14:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BBD540953
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 14:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIeow9olCFNZ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 14:34:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F16994091C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=UwrNiWtV
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F16994091C
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 14:34:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a2069b9710so6349995e9.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 06:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793975652; x=1794580452; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ct8qevbNQiMCEEHrh37m7NOECaFefmOynKtdqs2Zc2U=;
 b=UwrNiWtVQ6F9EaEvUi52eXv2kU+VV6lGNYXZj+Oum6CcecE0MU1IDyuMCZ/s752sW1
 DVe4YWFbZ0fuL9qMW8+V2pSDvXa8uqKxp+1G7emC7Ke1qwvfaP2w/7Pm+f5qvz5yXiMq
 uGB2s4oB2M7rbAoV3qKQ8XyicLOpCc1ABcYF2LaiQW22DPOQ1y+bcyrtKnnXzNcW9lRQ
 4x68IOuQ0I4ypDL/936BHjIWqOW0gavXTeLl/mVRSesVvJAvCMTPy95RHdZp0cmtEER5
 6nw+xYno5W5i+j7njy+SrUnjLfwMrvsC8F2dodOy8yrKosndFuNrvfMXIyBbqbkjZ8af
 Csrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793975652; x=1794580452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ct8qevbNQiMCEEHrh37m7NOECaFefmOynKtdqs2Zc2U=;
 b=M61whh3T7bhA9vgKAtbfki5PxA8Ol9iucOmRuloJdq0oBaOH9YIb/bgsalXo3GNO4P
 5oTPOgFwkU/vnH+Y9SR5pAh5KJNMSL2wY1VMAjBsMRRVlUY/xTgrRQVUci9GvEuUJQaX
 6y7GurfWcMEKvxWieL8kaBWrwprnHR2PNL55QVeyUsvwlP3+vQ0V8bLrKejAtKONZRtH
 gcMSXaU9TqRiV4snojSFvVG19U7cuSV0N+sIrsGbrlrJ/DLg1lbOCPL9FuHAXT5VmDDB
 I20D59uT9KGUhxSt3DKDUKHpUJvDyQFiy04dloN8HBO0chRLwu5xMQ/wonXA/tRDV70F
 8uXg==
X-Gm-Message-State: APuU4Z/5EoXXqVpNtGw0glSs/wp/uWrDNWMFqiEIvy6UTUTnS2Twv2wS
 I11cn7T/WTuE2u/zdeLnDaJo4fh7GCQlTXBUH4ewPjkdQgGtMXBDfg2AmDoAVbOU
X-Gm-Gg: AYBFou22kFCZ4qaglmM6vL7vjGyO/Q26U7s8Bt66qaA2KU2i9GrjPzdzQ3vAl6/PnQm
 p/kGRdx2M12AV+MYgx1ZZz8/4zXC+xmN77sC75FsVzTVb7hnlx9XuOJnoW9XhOO0YK7ENV6vVcP
 5yFtry97WfD+LaMDT3B7b2KW65Rs7FYHkKlxpJqy4g1UkHcwZdh75GdKFZbH7vEOvwOYLCivMRf
 q3DPILHIo5T/ATD48t/Z4qIZnfLzfCG6q1k5iVJXUhK6hHD87LY9HzExAB0sBaNhao81zPANb+9
 kPSBUAjs6z3FCeG1CFPHgxSG80JA+mbqZ4GyAnxw1DhK5/LX6A5IFi9MsmWf2VVxE+1L47AdK1q
 d6oUkUHsTnEj+DCx/lyyChajoQazEs4sLdoXDtHBqEgPtkLoPxrZuQTdzHH38vY2I36X68SFRAS
 vJhhFh7kmQgDJHGiz88OBEQ9X9AnFRttIzLISvAG8d2qzn5iw4PB5wjfEU9KiGxS5DI22nWi70k
 xZBTcoWU8blL24r2RHg1V8FuDCY2mAeZBSIJQwN+9kp9gn6diTsSAE+cHLwnPBrSEtvbb1siRjS
 f4Y5Ch7P/dAfq4KUJPQUPNp6QOWKNGiGrgKJaNZoBzjyQXs+RV05gA==
X-Received: by 2002:a05:600c:4e43:b0:4a1:83f0:7c91 with SMTP id
 5b1f17b1804b1-4b6de0cda6cmr46725585e9.18.1793975651818; 
 Fri, 06 Nov 2026 06:34:11 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6e2028d9bsm122714665e9.9.2026.11.06.06.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 06:34:11 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Paul Louvel <paul.louvel@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>,
 Nico Orlando <nico.orlando@dave.eu>, Roberto Zelbi <roberto.zelbi@dave.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri,  6 Nov 2026 15:34:08 +0100
Message-Id: <20261106143409.2581133-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605111256.107837-1-paul.louvel@bootlin.com>
References: <20260605111256.107837-1-paul.louvel@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/qt5/qt5base: export the OpenGL
 and EGL library dirs to CMake
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_PRO_TLD,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the OpenGL ES2, OpenGL or EGL libraries are found with pkg-config,
as in Buildroot, their directory only ends up as a -L flag in
QMAKE_LIBS_OPENGL_ES2, QMAKE_LIBS_OPENGL or QMAKE_LIBS_EGL. qtbase drops
it when generating Qt5GuiConfigExtras.cmake, whose find_library(...
NO_DEFAULT_PATH) then never finds the libraries:

  -- Qt OpenGL implementation: GLESv2
  -- Qt OpenGL libraries:
  -- Qt EGL libraries:

So Qt5Gui_OPENGL_LIBRARIES and Qt5Gui_EGL_LIBRARIES are empty for every
CMake project using them, and qt5webkit with OpenGL ES2 (qt5base OpenGL
support, which enables its WebKit2/QML API) fails to link libWebCore:

  GraphicsContext3DOpenGLES.cpp: undefined reference to `glBindRenderbuffer'
  ...: undefined reference to `eglGetProcAddress'

Add a patch exporting the directories given with -L when QMAKE_LIBDIR_*
are not set.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - new patch: with the OpenGL support of qt5base, which enables the
    WebKit2 QML API of qt5webkit, libWebCore fails to link because
    Qt5Gui_OPENGL_LIBRARIES and Qt5Gui_EGL_LIBRARIES are empty.

Tested: Bootlin x86_64 glibc stable toolchain, qt5base with OpenGL ES2
(mesa3d softpipe, EGL) and eglfs, qt5declarative, qt5webkit (WebKit2 ON) and
qt-webkit-kiosk: everything builds, Qt reports "Qt OpenGL libraries:
Qt5::Gui_GLESv2" and "Qt EGL libraries: Qt5::Gui_EGL", libWebCore links
libGLESv2/libEGL, the qt_lib_webkit*.pri files are in
$(HOST_DIR)/mkspecs/modules, the headers in $(STAGING_DIR)/usr/include/qt5,
and the QtWebKit QML module in both $(STAGING_DIR)/usr/qml and
$(TARGET_DIR)/usr/qml. Not run-time tested.

 ...penGL-and-EGL-library-dirs-found-wit.patch | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 package/qt5/qt5base/0012-gui-export-the-OpenGL-and-EGL-library-dirs-found-wit.patch

diff --git a/package/qt5/qt5base/0012-gui-export-the-OpenGL-and-EGL-library-dirs-found-wit.patch b/package/qt5/qt5base/0012-gui-export-the-OpenGL-and-EGL-library-dirs-found-wit.patch
new file mode 100644
index 0000000000..6ab60937de
--- /dev/null
+++ b/package/qt5/qt5base/0012-gui-export-the-OpenGL-and-EGL-library-dirs-found-wit.patch
@@ -0,0 +1,82 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Fri, 6 Nov 2026 14:27:11 +0100
+Subject: [PATCH] gui: export the OpenGL and EGL library dirs found with -L to
+ CMake
+
+When the OpenGL ES2, OpenGL or EGL libraries are detected with
+pkg-config, their library directory ends up as a -L flag in
+QMAKE_LIBS_OPENGL_ES2, QMAKE_LIBS_OPENGL or QMAKE_LIBS_EGL, while
+QMAKE_LIBDIR_* stay empty.
+
+cmakeProcessLibs() drops the -L flags, so the generated
+Qt5GuiConfigExtras.cmake calls _qt5gui_find_extra_libs() with an empty
+library directory, and its find_library(... NO_DEFAULT_PATH) never finds
+the libraries: Qt5Gui_OPENGL_LIBRARIES and Qt5Gui_EGL_LIBRARIES are
+empty, and CMake projects using them (e.g. QtWebKit with OpenGL ES2)
+fail to link with undefined references to the gl* and egl* functions.
+
+Use the directories given with -L when QMAKE_LIBDIR_* are not set.
+
+Upstream: N/A, Qt 5 is end of life and Qt 6 builds with CMake
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ mkspecs/features/cmake_functions.prf | 12 ++++++++++++
+ src/gui/gui.pro                      |  4 ++++
+ 2 files changed, 16 insertions(+)
+
+diff --git a/mkspecs/features/cmake_functions.prf b/mkspecs/features/cmake_functions.prf
+index 0c62b46..1b217ef 100644
+--- a/mkspecs/features/cmake_functions.prf
++++ b/mkspecs/features/cmake_functions.prf
+@@ -71,6 +71,18 @@ defineReplace(cmakeProcessLibs) {
+     return ($$join(out, ";"))
+ }
+ 
++defineReplace(cmakeProcessLibDirs) {
++    variable = $$1
++    out =
++    for(v, variable) {
++        contains(v, -L.*) {
++            v ~= s,^-L,,
++            out += $$v
++        }
++    }
++    return ($$out)
++}
++
+ defineReplace(cmakeRelativePath) {
+     path = $$relative_path($$1, $$2)
+     return($$replace(path, ([^/])$, \\1/))
+diff --git a/src/gui/gui.pro b/src/gui/gui.pro
+index 20372d9..21b5d55 100644
+--- a/src/gui/gui.pro
++++ b/src/gui/gui.pro
+@@ -76,6 +76,8 @@ qtConfig(angle) {
+     qtConfig(egl) {
+         CMAKE_EGL_LIBS = $$cmakeProcessLibs($$QMAKE_LIBS_EGL)
+         !isEmpty(QMAKE_LIBDIR_EGL): CMAKE_EGL_LIBDIR += $$cmakeTargetPath($$QMAKE_LIBDIR_EGL)
++        else: for(dir, $$list($$cmakeProcessLibDirs($$QMAKE_LIBS_EGL))): \
++            CMAKE_EGL_LIBDIR += $$cmakeTargetPath($$dir)
+     }
+ 
+     qtConfig(opengles2) {
+@@ -83,6 +85,7 @@ qtConfig(angle) {
+         CMAKE_OPENGL_INCDIRS = $$cmakePortablePaths($$QMAKE_INCDIR_OPENGL_ES2)
+         CMAKE_OPENGL_LIBS = $$cmakeProcessLibs($$QMAKE_LIBS_OPENGL_ES2)
+         !isEmpty(QMAKE_LIBDIR_OPENGL_ES2): CMAKE_OPENGL_LIBDIR = $$cmakePortablePaths($$QMAKE_LIBDIR_OPENGL_ES2)
++        else: CMAKE_OPENGL_LIBDIR = $$cmakePortablePaths($$cmakeProcessLibDirs($$QMAKE_LIBS_OPENGL_ES2))
+         CMAKE_GL_HEADER_NAME = GLES2/gl2.h
+         CMAKE_QT_OPENGL_IMPLEMENTATION = GLESv2
+     } else: qtConfig(opengl) {
+@@ -90,6 +93,7 @@ qtConfig(angle) {
+         CMAKE_OPENGL_INCDIRS = $$cmakePortablePaths($$QMAKE_INCDIR_OPENGL)
+         !qtConfig(dynamicgl): CMAKE_OPENGL_LIBS = $$cmakeProcessLibs($$QMAKE_LIBS_OPENGL)
+         !isEmpty(QMAKE_LIBDIR_OPENGL): CMAKE_OPENGL_LIBDIR = $$cmakePortablePaths($$QMAKE_LIBDIR_OPENGL)
++        else: CMAKE_OPENGL_LIBDIR = $$cmakePortablePaths($$cmakeProcessLibDirs($$QMAKE_LIBS_OPENGL))
+         CMAKE_GL_HEADER_NAME = GL/gl.h
+         mac: CMAKE_GL_HEADER_NAME = gl.h
+         CMAKE_QT_OPENGL_IMPLEMENTATION = GL
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
