Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D873C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 20:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB95F60A98;
	Wed, 22 Dec 2021 20:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vpJsZzdPiMPK; Wed, 22 Dec 2021 20:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4A2160AE5;
	Wed, 22 Dec 2021 20:58:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C75451BF861
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 20:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B652C82512
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 20:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QGz0C3XWO3OW for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 20:58:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D2DF82503
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 20:58:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CEE0D81D8B; Wed, 22 Dec 2021 20:53:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 21:56:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5cb0ff4c90a9fcb068d41262946ef6a9aef9f7d
X-Git-Newrev: 4e814227caa0a5d190e36cd5174239fe5c627279
X-Patchwork-Hint: ignore
Message-Id: <20211222205303.CEE0D81D8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ogre: bump to version 1.12.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e814227caa0a5d190e36cd5174239fe5c627279
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patches [1][2].

tinyxml has been replaced by pugixml [3].

Switch to git download method since github release without
the complete source code in the tarball [4].

Update indentation of hash file (two spaces).

Previous ogre version unconditionally include <sys/sysctl.h>
header that has been removed from glibc since 2.32.
This has been fixed since Ogre 1.12.7 [5].

[1] https://github.com/OGRECave/ogre/commit/de4d5c920e23e1e2b21dc5c8192ef74ba6210cca
[2] https://github.com/OGRECave/ogre/commit/3f182b7e743662ec3fa63e1c7f213171d99485ba
[3] https://github.com/OGRECave/ogre/commit/338103324096b78ae4718f97ac2150c4bb98c2d1
[4] https://github.com/OGRECave/ogre/issues/1332#issuecomment-563189058
[5] https://github.com/OGRECave/ogre/commit/8ec086e9bc2e24fab373b514c572483b69071d69

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-PrecompiledHeader.cmake-Add-c-argument-t.patch | 57 -----------------
 .../ogre/0002-Checks-for-strtol_l-function.patch   | 71 ----------------------
 package/ogre/Config.in                             |  1 +
 package/ogre/ogre.hash                             |  4 +-
 package/ogre/ogre.mk                               | 14 +++--
 5 files changed, 13 insertions(+), 134 deletions(-)

diff --git a/package/ogre/0001-CMake-Utils-PrecompiledHeader.cmake-Add-c-argument-t.patch b/package/ogre/0001-CMake-Utils-PrecompiledHeader.cmake-Add-c-argument-t.patch
deleted file mode 100644
index 97f4e24890..0000000000
--- a/package/ogre/0001-CMake-Utils-PrecompiledHeader.cmake-Add-c-argument-t.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From f480ac538eb69086d4b7db855c2a457d5d6420d4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 10 Feb 2020 14:05:12 +0100
-Subject: [PATCH] CMake/Utils/PrecompiledHeader.cmake: Add -c argument to build
- precompiled headers
-
-Add "-c" argument when building precompiled headers to fix build with
-RELRO.
-
-More information on a similar issue with domoticz can be found here:
-https://patchwork.ozlabs.org/patch/1187328:
-
-"The problem AFAICS is that if no -c or similar option is given, GCC
-decides what needs to be done based on the rest of the arguments. If the
-rest of the arguments include a -Wl,... option, it decides that linking
-needs to be done. If the rest of the arguments are just header files, it
-decides to create a precompiled header."
-
-Fixes:
- - http://autobuild.buildroot.org/results/8fabf8d270b9257c3a9db6a2f17f1c08ec9428d3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream: https://github.com/OGRECave/ogre/commit/de4d5c920e23e1e2b21dc5c8192ef74ba6210cca]
----
- CMake/Utils/PrecompiledHeader.cmake | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/CMake/Utils/PrecompiledHeader.cmake b/CMake/Utils/PrecompiledHeader.cmake
-index a02d99acd..bfb0059db 100644
---- a/CMake/Utils/PrecompiledHeader.cmake
-+++ b/CMake/Utils/PrecompiledHeader.cmake
-@@ -133,11 +133,11 @@ MACRO(_PCH_GET_COMPILE_COMMAND out_command _input _output)
-             STRING(REGEX REPLACE "^ +" "" pchsupport_compiler_cxx_arg1 ${CMAKE_CXX_COMPILER_ARG1})
- 
-             SET(${out_command}
--              ${CMAKE_CXX_COMPILER} ${pchsupport_compiler_cxx_arg1} ${_compile_FLAGS} -x c++-header -o ${_output} ${_input}
-+              ${CMAKE_CXX_COMPILER} ${pchsupport_compiler_cxx_arg1} ${_compile_FLAGS} -x c++-header -c -o ${_output} ${_input}
-               )
-         ELSE(CMAKE_CXX_COMPILER_ARG1)
-             SET(${out_command}
--              ${CMAKE_CXX_COMPILER}  ${_compile_FLAGS} -x c++-header -o ${_output} ${_input}
-+              ${CMAKE_CXX_COMPILER}  ${_compile_FLAGS} -x c++-header -c -o ${_output} ${_input}
-               )
-         ENDIF(CMAKE_CXX_COMPILER_ARG1)
-     ELSE(CMAKE_COMPILER_IS_GNUCXX)
-@@ -291,7 +291,7 @@ MACRO(ADD_PRECOMPILED_HEADER _targetName _input)
-     set_target_properties(${_targetName}_pch_dephelp PROPERTIES INCLUDE_DIRECTORIES "${DIRINC}")
- 
-     #MESSAGE("_compile_FLAGS: ${_compile_FLAGS}")
--    #message("COMMAND ${CMAKE_CXX_COMPILER}	${_compile_FLAGS} -x c++-header -o ${_output} ${_input}")
-+    #message("COMMAND ${CMAKE_CXX_COMPILER}	${_compile_FLAGS} -x c++-header -c -o ${_output} ${_input}")
- 
-     ADD_CUSTOM_COMMAND(
-       OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${_name}"
--- 
-2.24.1
-
diff --git a/package/ogre/0002-Checks-for-strtol_l-function.patch b/package/ogre/0002-Checks-for-strtol_l-function.patch
deleted file mode 100644
index 540530ee9e..0000000000
--- a/package/ogre/0002-Checks-for-strtol_l-function.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 3f182b7e743662ec3fa63e1c7f213171d99485ba Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 10 Feb 2020 21:45:58 +0100
-Subject: [PATCH] Checks for strtol_l function
-
-strtol_l (and strtoul_l, strtoll_l, strtoull_l) are not always available
-(for example on musl) so check for strtol_l and reuse android fallback if
-needed to avoid the following build failure:
-
-/home/buildroot/autobuild/instance-1/output-1/build/ogre-1.12.0/OgreMain/src/OgreStringConverter.cpp: In static member function 'static bool Ogre::StringConverter::parse(const String&, Ogre::int32&)':
-/home/buildroot/autobuild/instance-1/output-1/build/ogre-1.12.0/OgreMain/src/OgreStringConverter.cpp:253:22: error: 'strtol_l' was not declared in this scope
-         ret = (int32)strtol_l(val.c_str(), &end, 0, _numLocale);
-                      ^~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/107cffe41081ce46441dec8699d6ad0f152bc152
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/OGRECave/ogre/commit/3f182b7e743662ec3fa63e1c7f213171d99485ba]
----
- CMake/ConfigureBuild.cmake             | 7 +++++++
- CMake/Templates/OgreBuildSettings.h.in | 2 ++
- OgreMain/include/OgreString.h          | 3 +++
- 3 files changed, 12 insertions(+)
-
-diff --git a/CMake/ConfigureBuild.cmake b/CMake/ConfigureBuild.cmake
-index ab049a525ae..73606c997c1 100644
---- a/CMake/ConfigureBuild.cmake
-+++ b/CMake/ConfigureBuild.cmake
-@@ -133,6 +133,13 @@ if(SDL2_FOUND OR EMSCRIPTEN)
-     set(OGRE_BITES_HAVE_SDL 1)
- endif()
- 
-+# determine if strtol_l is supported
-+include(CheckFunctionExists)
-+CHECK_FUNCTION_EXISTS(strtol_l HAVE_STRTOL_L)
-+if (NOT HAVE_STRTOL_L)
-+  set(OGRE_NO_LOCALE_STRCONVERT 1)
-+endif ()
-+
- # generate OgreBuildSettings.h
- configure_file(${OGRE_TEMPLATES_DIR}/OgreComponents.h.in ${PROJECT_BINARY_DIR}/include/OgreComponents.h @ONLY)
- configure_file(${OGRE_TEMPLATES_DIR}/OgreBuildSettings.h.in ${PROJECT_BINARY_DIR}/include/OgreBuildSettings.h @ONLY)
-diff --git a/CMake/Templates/OgreBuildSettings.h.in b/CMake/Templates/OgreBuildSettings.h.in
-index a491d09624c..95eb1b71d64 100644
---- a/CMake/Templates/OgreBuildSettings.h.in
-+++ b/CMake/Templates/OgreBuildSettings.h.in
-@@ -107,4 +107,6 @@ WARNING: Disabling this will make the samples unusable.
- 
- #cmakedefine01 OGRE_NO_QUAD_BUFFER_STEREO
- 
-+#cmakedefine01 OGRE_NO_LOCALE_STRCONVERT
-+
- #endif
-diff --git a/OgreMain/include/OgreString.h b/OgreMain/include/OgreString.h
-index a81c220012e..1f544195dee 100644
---- a/OgreMain/include/OgreString.h
-+++ b/OgreMain/include/OgreString.h
-@@ -46,8 +46,11 @@ THE SOFTWARE.
- #   define strnicmp strncasecmp
- #endif
- 
-+#if OGRE_PLATFORM == OGRE_PLATFORM_ANDROID || OGRE_PLATFORM == OGRE_PLATFORM_EMSCRIPTEN || \
-+	(OGRE_PLATFORM == OGRE_PLATFORM_LINUX && OGRE_NO_LOCALE_STRCONVERT == 1)
- #if OGRE_PLATFORM == OGRE_PLATFORM_ANDROID || OGRE_PLATFORM == OGRE_PLATFORM_EMSCRIPTEN
- #   define locale_t int
-+#endif
- #   define strtod_l(ptr, end, l) strtod(ptr, end)
- #   define strtoul_l(ptr, end, base, l) strtoul(ptr, end, base)
- #   define strtol_l(ptr, end, base, l) strtol(ptr, end, base)
diff --git a/package/ogre/Config.in b/package/ogre/Config.in
index 1d7784714d..7d57d3f82a 100644
--- a/package/ogre/Config.in
+++ b/package/ogre/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_OGRE
 	depends on BR2_USE_WCHAR # use wchar_t
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBFREEIMAGE
+	select BR2_PACKAGE_PUGIXML
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_SDL2_OPENGL
 	select BR2_PACKAGE_SDL2_X11 # use wmInfo.info.x11
diff --git a/package/ogre/ogre.hash b/package/ogre/ogre.hash
index 8bb4ae96a1..0028a4b97c 100644
--- a/package/ogre/ogre.hash
+++ b/package/ogre/ogre.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256 163e7700e319532d4389ecba91e3ab88551f78610886fa36f8f262f9a5080988  ogre-1.12.0.tar.gz
-sha256 82758e8d1d72139904b9b7472ef0f6544413d2871b58540307fdcc20e473e5f8  LICENSE
+sha256  805b97aacd2070f19394fe92442307a7ba6036ad95c511f551817d694c8dea37  ogre-v1.12.12-br1.tar.gz
+sha256  82758e8d1d72139904b9b7472ef0f6544413d2871b58540307fdcc20e473e5f8  LICENSE
diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
index 2df685a23a..72c96cb33a 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -4,17 +4,21 @@
 #
 ################################################################################
 
-OGRE_VERSION = 1.12.0
-OGRE_SITE = $(call github,OGRECave,ogre,v$(OGRE_VERSION))
-OGRE_LICENSE = MIT (main library, DeferredShadingMedia samples), Public Domain (samples and plugins), Zlib (tinyxml)
+OGRE_VERSION = v1.12.12
+OGRE_SITE = https://github.com/OGRECave/ogre
+OGRE_SITE_METHOD = git
+OGRE_LICENSE = MIT (main library, DeferredShadingMedia samples), Public Domain (samples and plugins)
 OGRE_LICENSE_FILES = LICENSE
 OGRE_INSTALL_STAGING = YES
 
-# Ogre use a bundled version of tinyxml
+# Download with imgui submodule (https://github.com/ocornut/imgui
+OGRE_GIT_SUBMODULES = YES
+
 OGRE_DEPENDENCIES = host-pkgconf \
 	freetype \
 	libfreeimage \
 	libgl \
+	pugixml \
 	sdl2 \
 	xlib_libX11 \
 	xlib_libXaw \
@@ -27,9 +31,11 @@ OGRE_CXXFLAGS = $(TARGET_CXXFLAGS) -DGLEW_NO_GLU
 
 # Unbundle freetype and zziplib.
 # Disable java and nvidia cg support.
+# Disable imgui overlay to avoid extra download from CMake.
 OGRE_CONF_OPTS = -DOGRE_BUILD_DEPENDENCIES=OFF \
 	-DOGRE_BUILD_COMPONENT_JAVA=OFF \
 	-DOGRE_BUILD_PLUGIN_CG=OFF \
+	-DOGRE_BUILD_COMPONENT_OVERLAY_IMGUI=OFF \
 	-DOGRE_INSTALL_DOCS=OFF \
 	-DCMAKE_C_FLAGS="$(OGRE_CFLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(OGRE_CXXFLAGS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
