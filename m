From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 20 May 2021 21:45:23 +0200
Subject: [Buildroot] [git commit] Revert "package/assimp: fix static only
 build"
Message-ID: <20210520191635.7F0B48891C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebe83db65587f371a77efec362b19fd3c2502457
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit b44b5cb265e3764169aa4856f40e8e2db55cba22.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...rib-zlib-disable-dynamic-library-building.patch | 31 ----------------------
 1 file changed, 31 deletions(-)

diff --git a/package/assimp/0003-contrib-zlib-disable-dynamic-library-building.patch b/package/assimp/0003-contrib-zlib-disable-dynamic-library-building.patch
deleted file mode 100644
index 8661311be5..0000000000
--- a/package/assimp/0003-contrib-zlib-disable-dynamic-library-building.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2b8684aded0c383be64bac0fa59e39870252963f Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 12 Apr 2020 18:19:13 +0200
-Subject: [PATCH] contrib/zlib: disable dynamic library building
-
-Fixes compile failure for static only toolchains (and assimp
-links against the static one).
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- contrib/zlib/CMakeLists.txt | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/contrib/zlib/CMakeLists.txt b/contrib/zlib/CMakeLists.txt
-index 9d1fcc94..78346233 100644
---- a/contrib/zlib/CMakeLists.txt
-+++ b/contrib/zlib/CMakeLists.txt
-@@ -195,10 +195,7 @@ if(MINGW)
-     set(ZLIB_DLL_SRCS ${CMAKE_CURRENT_BINARY_DIR}/zlib1rc.obj)
- endif(MINGW)
- 
--add_library(zlib SHARED ${ZLIB_SRCS} ${ZLIB_ASMS} ${ZLIB_DLL_SRCS} ${ZLIB_PUBLIC_HDRS} ${ZLIB_PRIVATE_HDRS})
- add_library(zlibstatic STATIC ${ZLIB_SRCS} ${ZLIB_ASMS} ${ZLIB_PUBLIC_HDRS} ${ZLIB_PRIVATE_HDRS})
--set_target_properties(zlib PROPERTIES DEFINE_SYMBOL ZLIB_DLL)
--set_target_properties(zlib PROPERTIES SOVERSION 1)
- 
- INSTALL( TARGETS zlibstatic
-          LIBRARY DESTINATION ${ASSIMP_LIB_INSTALL_DIR}
--- 
-2.26.0
-
