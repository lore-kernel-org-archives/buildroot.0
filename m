Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9DAC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 608D260F24;
	Wed, 28 Feb 2024 16:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Cw4h43LA-jw; Wed, 28 Feb 2024 16:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32A6A60F21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32A6A60F21;
	Wed, 28 Feb 2024 16:45:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 923E31BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88CD680E95
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pefPiGi3PVyo for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EE7780C2F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EE7780C2F
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CC3F87BFB; Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 17:19:57 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 1e83664d4de09389ba48d2b2ba0618f48c36dc66
X-Git-Newrev: bd202dde79987898f3deb7cd6fbdff1217659dda
X-Patchwork-Hint: ignore
Message-Id: <20240228164457.7CC3F87BFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/webkitgtk: bump
 to version 2.42.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd202dde79987898f3deb7cd6fbdff1217659dda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Update to a new major release.

Release notes:

https://webkitgtk.org/2023/09/15/webkitgtk2.42.0-released.html
https://webkitgtk.org/2023/09/27/webkitgtk2.42.1-released.html
https://webkitgtk.org/2023/11/10/webkitgtk2.42.2-released.html

Security notes:

https://webkitgtk.org/security/WSA-2023-0008.html

- USE_JPEGXL is enabled by default now [1], so add a libjxl if used.

- ENABLE_GLES2 has been dropped, so drop it also here [2].
  Instead, enable USE_OPENGL_OR_ES if libgles is present. Beware that also
  libegl is needed for USE_OPENGL_OR_ES, but that one is most of the time a
  dependency for libgles, so leave it out here.

- Also raise the minimal GCC version to 10.2, which is required since webkitgtk-2.42.x [3].
  Similar to commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4,
  we do check on >= GCC 10, because we can't check on >= GCC 10.2.

[1] https://github.com/WebKit/WebKit/commit/93865414f33190c57e293a80492e10edc461d7f0
[2] https://github.com/WebKit/WebKit/commit/cfe917fec45bf72c371087ece034feee8454f1b4
[3] https://github.com/WebKit/WebKit/commit/133498aaee8f44443d9e3b2a08be4a4b77b93fc9

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c4abff80b0fc0001e5804e43d32cbeb67d3d2009)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ailure-when-gstreamer-support-is-disabled.patch | 36 ----------------------
 package/webkitgtk/Config.in                        |  6 ++--
 package/webkitgtk/webkitgtk.hash                   |  6 ++--
 package/webkitgtk/webkitgtk.mk                     | 16 +++++++---
 4 files changed, 17 insertions(+), 47 deletions(-)

diff --git a/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch b/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
deleted file mode 100644
index 3fa23b215b..0000000000
--- a/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9b31965cdf362768e86f7e592e59e68fb3351261 Mon Sep 17 00:00:00 2001
-From: Matt Turner <mattst88@gmail.com>
-Date: Tue, 8 Aug 2023 16:51:25 -0700
-Subject: [PATCH] Fix build failure when gstreamer support is disabled
- https://bugs.webkit.org/show_bug.cgi?id=259931 https://bugs.gentoo.org/911663
-
-Reviewed by Carlos Alberto Lopez Perez.
-
-* Source/WebCore/loader/MixedContentChecker.cpp:
-
-Canonical link: https://commits.webkit.org/260527.429@fix-build
-
-(cherry picked from commit f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732)
-
-Upstream: https://github.com/WebKit/WebKit/commit/f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- Source/WebCore/loader/MixedContentChecker.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Source/WebCore/loader/MixedContentChecker.cpp b/Source/WebCore/loader/MixedContentChecker.cpp
-index 9b4c7fe62020..ac4733bc08bc 100644
---- a/Source/WebCore/loader/MixedContentChecker.cpp
-+++ b/Source/WebCore/loader/MixedContentChecker.cpp
-@@ -33,6 +33,8 @@
- #include "ContentSecurityPolicy.h"
- #include "Document.h"
- #include "Frame.h"
-+#include "FrameLoader.h"
-+#include "FrameLoaderClient.h"
- #include "SecurityOrigin.h"
- 
- namespace WebCore {
--- 
-2.42.0
-
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index cb10784133..ace1b8739f 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,12 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 9, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 10, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 
@@ -32,7 +32,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 7f50f1aa7b..59782732c3 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.40.5.tar.xz.sums
-sha1  2f4d06b021115eb4106177f7d5f534f45b5d3b2e  webkitgtk-2.40.5.tar.xz
-sha256  7de051a263668621d91a61a5eb1c3771d1a7cec900043d4afef06c326c16037f  webkitgtk-2.40.5.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.42.2.tar.xz.sums
+sha1  05bec6a824e46f043b865478735bc8395249510e  webkitgtk-2.42.2.tar.xz
+sha256  5720aa3e8627f1b9f63252187d4df0f8233ae71d697b1796ebfbe5ca750bd118  webkitgtk-2.42.2.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 9c68fe73cf..611d7f65d3 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.40.5
+WEBKITGTK_VERSION = 2.42.2
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -73,6 +73,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_INTROSPECTION=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBJXL),y)
+WEBKITGTK_CONF_OPTS += -DUSE_JPEGXL=ON
+WEBKITGTK_DEPENDENCIES += libjxl
+else
+WEBKITGTK_CONF_OPTS += -DUSE_JPEGXL=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBMANETTE),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=ON
 WEBKITGTK_DEPENDENCIES += libmanette
@@ -80,12 +87,11 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=OFF
 endif
 
-# Use GLES if available and desktop GL is not.
-ifeq ($(BR2_PACKAGE_HAS_LIBGL):$(BR2_PACKAGE_HAS_LIBGLES),:y)
-WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+WEBKITGTK_CONF_OPTS += -DUSE_OPENGL_OR_ES=ON
 WEBKITGTK_DEPENDENCIES += libgles
 else
-WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
+WEBKITGTK_CONF_OPTS += -DUSE_OPENGL_OR_ES=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
