Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2CFCA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FD5680272;
	Thu,  4 Sep 2025 16:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XylVPSud6gPI; Thu,  4 Sep 2025 16:12:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F4480786
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F4480786;
	Thu,  4 Sep 2025 16:12:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9C5B106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A0F4403E6
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1-HAyfOez_o for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 954D8403E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 954D8403E5
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:12:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 857B587F44; Thu,  4 Sep 2025 16:12:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 18:08:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ce1d6f01736cf8c41b7a191e2e35b7f9efb50b4
X-Git-Newrev: 3b5e1205dca03f20225eb9ee9d185c35bf6af15f
X-Patchwork-Hint: ignore
Message-Id: <20250904161210.857B587F44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openal: bump to 1.24.3 to fix GCC
 15.x build issues
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b5e1205dca03f20225eb9ee9d185c35bf6af15f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openal 1.22.0 does not build with GCC 15.x, but the backport of the
fixes to 1.22.0 turns out to be too complicated, so let's bump to
1.24.3 instead.

Since 1.24.3 uses C++17, and after testing with GCC 7.x, then GCC 8.x
then GCC 9.x, we found out that GCC 9.x at least is
necessary. Therefore, reverse dependencies are updated accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alure/Config.in                       | 11 +++--------
 package/gstreamer1/gst1-plugins-bad/Config.in |  6 +++---
 package/lugaru/Config.in                      |  6 +++---
 package/minetest/Config.in                    |  8 ++++----
 package/openal/Config.in                      |  6 +++---
 package/openal/openal.hash                    |  2 +-
 package/openal/openal.mk                      |  2 +-
 package/solarus/Config.in                     |  6 +++---
 package/supertux/Config.in                    |  6 +++---
 package/supertuxkart/Config.in                |  6 +++---
 10 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/package/alure/Config.in b/package/alure/Config.in
index e0064accba..c831bba913 100644
--- a/package/alure/Config.in
+++ b/package/alure/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_ALURE
 	bool "alure"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_USE_WCHAR # use wchar_t
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	select BR2_PACKAGE_OPENAL
 	help
 	  Alure is a C++ 3D audio API. It uses OpenAL for audio
@@ -50,12 +49,8 @@ config BR2_PACKAGE_ALURE_VORBIS_DECODER
 
 endif
 
-comment "alure needs a toolchain w/ C++, gcc >= 4.9, NPTL, wchar"
+comment "alure needs a toolchain w/ C++, gcc >= 9, NPTL, wchar"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
-
-comment "alure needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 89db860f87..4a78e9b694 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -520,16 +520,16 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENAL
 	bool "openal"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENAL
 
-comment "openal plugin needs a toolchain w/ NPTL, C++, gcc >= 4.9"
+comment "openal plugin needs a toolchain w/ NPTL, C++, gcc >= 9"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264
 	bool "openh264"
diff --git a/package/lugaru/Config.in b/package/lugaru/Config.in
index 4454ebcd06..904652d99b 100644
--- a/package/lugaru/Config.in
+++ b/package/lugaru/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LUGARU
 	depends on BR2_PACKAGE_HAS_LIBGL # libglu
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7 # SDL2 OpenGL (GLX)
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # openal
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_USE_MMU # SDL2 OpenGL (GLX)
 	depends on !BR2_STATIC_LIBS # SDL2
@@ -29,10 +29,10 @@ config BR2_PACKAGE_LUGARU
 
 	  https://osslugaru.gitlab.io/
 
-comment "lugaru needs X11 and a toolchain w/ C++, OpenGL backend, gcc >= 4.9, NPTL, dynamic library"
+comment "lugaru needs X11 and a toolchain w/ C++, OpenGL backend, gcc >= 9, NPTL, dynamic library"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS
diff --git a/package/minetest/Config.in b/package/minetest/Config.in
index 4e139ac3e2..290c062bab 100644
--- a/package/minetest/Config.in
+++ b/package/minetest/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MINETEST
 	bool "minetest"
 	depends on BR2_INSTALL_LIBSTDCPP # irrlichtMt (bundled)
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_XORG7 # irrlichtMt (bundled)
 	depends on BR2_PACKAGE_HAS_LIBGL # irrlichtMt (bundled)
@@ -52,14 +52,14 @@ comment "sound support needs a toolchain w/ threads NPTL"
 
 endif
 
-comment "minetest needs a toolchain w/ C++, gcc >= 5.1, threads"
+comment "minetest needs a toolchain w/ C++, gcc >= 9, threads"
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "minetest needs X11 and an OpenGL provider"
 	depends on (BR2_INSTALL_LIBSTDCPP \
-		&& BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
+		&& BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		&& BR2_TOOLCHAIN_HAS_THREADS)
 	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
diff --git a/package/openal/Config.in b/package/openal/Config.in
index 6b0e9973db..648b855471 100644
--- a/package/openal/Config.in
+++ b/package/openal/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 config BR2_PACKAGE_OPENAL
 	bool "openal"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11 PR56019
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	help
@@ -27,8 +27,8 @@ config BR2_PACKAGE_OPENAL
 
 	  http://kcat.strangesoft.net/openal.html
 
-comment "openal needs a toolchain w/ NPTL, C++, gcc >= 4.9"
+comment "openal needs a toolchain w/ NPTL, C++, gcc >= 7"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index eae78b0582..ea4664c492 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  814831a8013d7365dfd1917b27f1fb6e723f3be3fe1c6a7ff4516425d8392f68  openal-1.22.0.tar.gz
+sha256  7e1fecdeb45e7f78722b776c5cf30bd33934b961d7fd2a11e0494e064cc631ce  openal-1.24.3.tar.gz
 sha256  d808ce217e5b611854da622b57ec29fe545584c48bc5352fae72a4b6e5074a15  COPYING
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 3d624139c2..d01a6f4b2f 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.22.0
+OPENAL_VERSION = 1.24.3
 OPENAL_SITE = $(call github,kcat,openal-soft,$(OPENAL_VERSION))
 OPENAL_LICENSE = LGPL-2.0+
 OPENAL_LICENSE_FILES = COPYING
diff --git a/package/solarus/Config.in b/package/solarus/Config.in
index bcfa640890..b0c807faed 100644
--- a/package/solarus/Config.in
+++ b/package/solarus/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_SOLARUS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # openal
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on !BR2_STATIC_LIBS # SDL2
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
@@ -25,9 +25,9 @@ config BR2_PACKAGE_SOLARUS
 	  http://www.solarus-games.org
 	  https://github.com/solarus-games/solarus
 
-comment "solarus needs OpenGL and a toolchain w/ C++, gcc >= 4.9, NPTL, dynamic library, and luajit or lua 5.1"
+comment "solarus needs OpenGL and a toolchain w/ C++, gcc >= 9, NPTL, dynamic library, and luajit or lua 5.1"
 	depends on !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/supertux/Config.in b/package/supertux/Config.in
index e8e96a3ae5..64c1715a25 100644
--- a/package/supertux/Config.in
+++ b/package/supertux/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SUPERTUX
 	depends on BR2_PACKAGE_HAS_LIBGL # libglew
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7 # libglew, SDL2 OpenGL (GLX)
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on BR2_USE_MMU # SDL2 OpenGL (GLX)
@@ -35,11 +35,11 @@ config BR2_PACKAGE_SUPERTUX
 
 	  http://supertux.github.io/
 
-comment "supertux needs OpenGL and a toolchain w/ C++, gcc >= 6, NPTL, dynamic library, wchar"
+comment "supertux needs OpenGL and a toolchain w/ C++, gcc >= 9, NPTL, dynamic library, wchar"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 319415754a..0f6c244058 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # openal
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz, openal
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
 	depends on BR2_PACKAGE_HAS_LIBGL
@@ -33,7 +33,7 @@ config BR2_PACKAGE_SUPERTUXKART
 
 	  http://supertuxkart.sourceforge.net/Main_Page
 
-comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++, gcc >= 4.9"
+comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++, gcc >= 9"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
@@ -41,6 +41,6 @@ comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NP
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		|| !BR2_PACKAGE_HAS_LIBGL \
 		|| BR2_TOOLCHAIN_USES_MUSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
