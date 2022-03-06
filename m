Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE42C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Mar 2022 10:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1D9540227;
	Sun,  6 Mar 2022 10:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a7qGFJ5TEXyW; Sun,  6 Mar 2022 10:28:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7DD4401E2;
	Sun,  6 Mar 2022 10:28:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0809A1BF4DA
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 10:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAC9060AF6
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 10:28:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GIfF6l3U4yus for <buildroot@lists.busybox.net>;
 Sun,  6 Mar 2022 10:28:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E45D605B2
 for <buildroot@buildroot.org>; Sun,  6 Mar 2022 10:28:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u1so18987648wrg.11
 for <buildroot@buildroot.org>; Sun, 06 Mar 2022 02:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bhXxsCaeE3i7jAuVq/NF2fAviqz80phXm1PXwepIies=;
 b=AvrIBGIYW+IIe8B7tMC77boX+C3/ATjpWmuCpqZFGBHVWpQQR53NRY/cygdUD09gj3
 h7RN7jRDFyYAwDj9/2MSqyhoF99dvvZBgSAy3TMMRRb92/foCzjCe/ZDryOYMkTTwShy
 pwi9wFfB8Uh3is0JPWMaKAAbW0QjemA+VQnv1TkgaasOpDNuITwetI4eswNhHwmzQY9E
 ASCPsMVJhWdwpF6NQS3bf6TTSsrkcPaKQduZK9ybs8wublKas7RJTim4I5ersnACnzDr
 mUpe+7PTVia07zbfueUcvsQp+nfq5FMIkS6K9Unynqt35Qn+aBxJACyhhNT82Nz3iszg
 XqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bhXxsCaeE3i7jAuVq/NF2fAviqz80phXm1PXwepIies=;
 b=U/l37i0delK2U7so0Wl4PB/PGfiiariVs0I7p8vLMMhyHt6BpBja0jLPiTdMaHD0lR
 NI7Mn7QPe0/LOiL7AQVjVD9MdB5V3PGFqZ/XRNiXcX5DuPLnvEgbLyKOhj2o1a+NP9Xc
 jwPaX/0kzIvCFlKkMeyhiJTCmWLn6Fl1kfxSeAFqZx1qP6x6nBW9JrB93YVL4cl3j7HD
 I3Xk9mYXcnK6fySxlPzphZ0L8ge/rnH5kQNaq6ySTtQCzfVazD9GeVWSgZLELLcUoV5g
 /tJ9e+vab4wAMul5VJCmBuU91AwpDW5ePYiOU62XaFGJkcoHExU0Lcj7CnusSETZ+pJT
 x2ww==
X-Gm-Message-State: AOAM533adI+HxuRVBJpQfz1N0vHzxf2hiD/5seng3mNVuKUs7OduW9l1
 f+rCL4SYiEK6MQ11XpcbC0LvjQy1aN0=
X-Google-Smtp-Source: ABdhPJyfLlE3pqwSzRTOl4NKP7+Tv3mAhCPQpH5QtkfdibkagrfeWo1GLY07CBTf/SD34CZj4wdOhQ==
X-Received: by 2002:adf:eb81:0:b0:1e3:2bf5:132 with SMTP id
 t1-20020adfeb81000000b001e32bf50132mr4900221wrn.246.1646562483168; 
 Sun, 06 Mar 2022 02:28:03 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b00381141f4967sm12829050wmq.35.2022.03.06.02.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 02:28:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Mar 2022 11:27:22 +0100
Message-Id: <20220306102722.129713-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/libglfw: fix wayland build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 3.3.6 in
commit 3cd9bb4f2a91d3739c5da96f5e4dd37d3ae13799:

CMake Error at CMakeLists.txt:252 (find_package):
  Could not find a package configuration file provided by "ECM" with any of
  the following names:

    ECMConfig.cmake
    ecm-config.cmake

Fixes:
 - http://autobuild.buildroot.org/results/0d7420aff7392c294614fd12e65ac7cd57787e98

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix typo in title

 ...emove-extra-cmake-modules-dependency.patch | 121 ++++++++++++++++++
 ...xt-allow-override-of-wayland-pkgdata.patch |  32 +++++
 package/libglfw/Config.in                     |   2 +
 package/libglfw/libglfw.mk                    |   6 +-
 4 files changed, 160 insertions(+), 1 deletion(-)
 create mode 100644 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
 create mode 100644 package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch

diff --git a/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch b/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
new file mode 100644
index 0000000000..d5ee7c829a
--- /dev/null
+++ b/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
@@ -0,0 +1,121 @@
+From 2747e47393cbca2d09db56223e735bd94b21e2eb Mon Sep 17 00:00:00 2001
+From: Joel Winarske <joel.winarske@gmail.com>
+Date: Mon, 28 Sep 2020 22:23:02 -0700
+Subject: [PATCH] Wayland: Remove extra-cmake-modules dependency
+
+Fixes #1774.
+
+[Retrieved (and backported) from:
+https://github.com/glfw/glfw/commit/2747e47393cbca2d09db56223e735bd94b21e2eb]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ .gitignore         |  4 ---
+ CMakeLists.txt     | 16 ++++++------
+ src/CMakeLists.txt | 62 ++++++++++++++++++++++++++++------------------
+ 3 files changed, 45 insertions(+), 37 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 42bfa1806d..394827520b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -191,20 +191,18 @@ endif()
+ # Use Wayland for window creation
+ #--------------------------------------------------------------------
+ if (_GLFW_WAYLAND)
+-    find_package(ECM REQUIRED NO_MODULE)
+-    list(APPEND CMAKE_MODULE_PATH "${ECM_MODULE_PATH}")
+ 
+-    find_package(Wayland REQUIRED Client Cursor Egl)
+-    find_package(WaylandScanner REQUIRED)
+-    find_package(WaylandProtocols 1.15 REQUIRED)
++    include(FindPkgConfig)
++    pkg_check_modules(Wayland REQUIRED
++        wayland-client>=0.2.7
++        wayland-cursor>=0.2.7
++        wayland-egl>=0.2.7
++        xkbcommon)
+ 
+     list(APPEND glfw_PKG_DEPS "wayland-client")
+ 
+     list(APPEND glfw_INCLUDE_DIRS "${Wayland_INCLUDE_DIRS}")
+-    list(APPEND glfw_LIBRARIES "${Wayland_LIBRARIES}" "${CMAKE_THREAD_LIBS_INIT}")
+-
+-    find_package(XKBCommon REQUIRED)
+-    list(APPEND glfw_INCLUDE_DIRS "${XKBCOMMON_INCLUDE_DIRS}")
++    list(APPEND glfw_LIBRARIES "${Wayland_LINK_LIBRARIES}" "${CMAKE_THREAD_LIBS_INIT}")
+ 
+     include(CheckIncludeFiles)
+     include(CheckFunctionExists)
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 2f2bdd883d..e834506c6c 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -45,30 +45,44 @@ if (_GLFW_X11 OR _GLFW_WAYLAND)
+                      posix_time.c posix_thread.c xkb_unicode.c
+                      egl_context.c osmesa_context.c)
+ 
+-    ecm_add_wayland_client_protocol(glfw_SOURCES
+-        PROTOCOL
+-        "${WAYLAND_PROTOCOLS_PKGDATADIR}/stable/xdg-shell/xdg-shell.xml"
+-        BASENAME xdg-shell)
+-    ecm_add_wayland_client_protocol(glfw_SOURCES
+-        PROTOCOL
+-        "${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/xdg-decoration/xdg-decoration-unstable-v1.xml"
+-        BASENAME xdg-decoration)
+-    ecm_add_wayland_client_protocol(glfw_SOURCES
+-        PROTOCOL
+-        "${WAYLAND_PROTOCOLS_PKGDATADIR}/stable/viewporter/viewporter.xml"
+-        BASENAME viewporter)
+-    ecm_add_wayland_client_protocol(glfw_SOURCES
+-        PROTOCOL
+-        "${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/relative-pointer/relative-pointer-unstable-v1.xml"
+-        BASENAME relative-pointer-unstable-v1)
+-    ecm_add_wayland_client_protocol(glfw_SOURCES
+-        PROTOCOL
+-        "${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/pointer-constraints/pointer-constraints-unstable-v1.xml"
+-        BASENAME pointer-constraints-unstable-v1)
+-    ecm_add_wayland_client_protocol(glfw_SOURCES
+-        PROTOCOL
+-        "${WAYLAND_PROTOCOLS_PKGDATADIR}/unstable/idle-inhibit/idle-inhibit-unstable-v1.xml"
+-        BASENAME idle-inhibit-unstable-v1)
++    find_program(WAYLAND_SCANNER_EXECUTABLE NAMES wayland-scanner)
++    pkg_check_modules(WAYLAND_PROTOCOLS REQUIRED wayland-protocols>=1.15)
++    pkg_get_variable(WAYLAND_PROTOCOLS_BASE wayland-protocols pkgdatadir)
++
++    macro(wayland_generate protocol_file output_file)
++          add_custom_command(OUTPUT ${output_file}.h
++              COMMAND ${WAYLAND_SCANNER_EXECUTABLE} client-header
++              < ${protocol_file} > ${output_file}.h
++              DEPENDS ${protocol_file})
++          list(APPEND glfw_SOURCES ${output_file}.h)
++
++          add_custom_command(OUTPUT ${output_file}.c 
++              COMMAND ${WAYLAND_SCANNER_EXECUTABLE} private-code
++              < ${protocol_file} > ${output_file}.c
++              DEPENDS ${protocol_file})
++          list(APPEND glfw_SOURCES ${output_file}.c)
++    endmacro()
++
++    set(GLFW_WAYLAND_PROTOCOL_SOURCES)
++    wayland_generate(
++        ${WAYLAND_PROTOCOLS_BASE}/stable/xdg-shell/xdg-shell.xml
++        ${CMAKE_BINARY_DIR}/src/wayland-xdg-shell-client-protocol)
++    wayland_generate(
++        ${WAYLAND_PROTOCOLS_BASE}/unstable/xdg-decoration/xdg-decoration-unstable-v1.xml
++        ${CMAKE_BINARY_DIR}/src/wayland-xdg-decoration-client-protocol)
++    wayland_generate(
++        ${WAYLAND_PROTOCOLS_BASE}/stable/viewporter/viewporter.xml
++        ${CMAKE_BINARY_DIR}/src/wayland-viewporter-client-protocol)
++    wayland_generate(
++        ${WAYLAND_PROTOCOLS_BASE}/unstable/relative-pointer/relative-pointer-unstable-v1.xml
++        ${CMAKE_BINARY_DIR}/src/wayland-relative-pointer-unstable-v1-client-protocol)
++    wayland_generate(
++        ${WAYLAND_PROTOCOLS_BASE}/unstable/pointer-constraints/pointer-constraints-unstable-v1.xml
++        ${CMAKE_BINARY_DIR}/src/wayland-pointer-constraints-unstable-v1-client-protocol)
++    wayland_generate(
++        ${WAYLAND_PROTOCOLS_BASE}/unstable/idle-inhibit/idle-inhibit-unstable-v1.xml
++        ${CMAKE_BINARY_DIR}/src/wayland-idle-inhibit-unstable-v1-client-protocol)
++
+ elseif (_GLFW_OSMESA)
+     set(glfw_HEADERS ${common_HEADERS} null_platform.h null_joystick.h
+                      posix_time.h posix_thread.h osmesa_context.h)
diff --git a/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch b/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
new file mode 100644
index 0000000000..4bcb5e4eb7
--- /dev/null
+++ b/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
@@ -0,0 +1,32 @@
+From 46aaf2b2b4d3ec240b9aad175bb3eddb6ae11ead Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 4 Mar 2022 17:59:19 +0100
+Subject: [PATCH] src/CMakeLists.txt: allow override of wayland pkgdatadir
+
+Allow the user to override WAYLAND_{PROTOCOLS_BASE,CLIENT_PKGDATADIR}
+(needed when cross-compiling)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/glfw/glfw/pull/2053]
+---
+ src/CMakeLists.txt | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 01f191c9..475ce882 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -75,7 +75,9 @@ if (GLFW_BUILD_WAYLAND)
+     include(FindPkgConfig)
+     find_program(WAYLAND_SCANNER_EXECUTABLE NAMES wayland-scanner)
+     pkg_check_modules(WAYLAND_PROTOCOLS REQUIRED wayland-protocols>=1.15)
+-    pkg_get_variable(WAYLAND_PROTOCOLS_BASE wayland-protocols pkgdatadir)
++    if (NOT WAYLAND_PROTOCOLS_BASE)
++        pkg_get_variable(WAYLAND_PROTOCOLS_BASE wayland-protocols pkgdatadir)
++    endif()
+ 
+     macro(wayland_generate protocol_file output_file)
+         add_custom_command(OUTPUT "${output_file}.h"
+-- 
+2.34.1
+
diff --git a/package/libglfw/Config.in b/package/libglfw/Config.in
index 281b55df7b..e5e96036ff 100644
--- a/package/libglfw/Config.in
+++ b/package/libglfw/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBGLFW
 	bool "libglfw"
 	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXI if BR2_PACKAGE_XORG7
diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index 2ba31fd674..0a3986f662 100644
--- a/package/libglfw/libglfw.mk
+++ b/package/libglfw/libglfw.mk
@@ -29,7 +29,11 @@ LIBGLFW_DEPENDENCIES += libgles
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-LIBGLFW_CONF_OPTS +=  -DGLFW_USE_WAYLAND=1
+LIBGLFW_DEPENDENCIES += libxkbcommon wayland-protocols
+# Override pkg-config pkgdatadir variable, it needs the prefix
+LIBGLFW_CONF_OPTS += \
+	-DGLFW_USE_WAYLAND=1 \
+	-DWAYLAND_PROTOCOLS_BASE=$(STAGING_DIR)/usr/share/wayland-protocols
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
