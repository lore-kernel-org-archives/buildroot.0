From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 31 Oct 2014 14:49:02 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets : bump version to
	v1.3-chrome37-firefox30
Message-ID: <1414763342-6580-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Bumped the version and did some trivial reworking of the patch file :
libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 ...le-shared-library-build-when-BUILD_SHARED.patch | 38 +++++++++-------------
 package/libwebsockets/libwebsockets.mk             |  2 +-
 2 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
index 7aa03d4..72cd293 100644
--- a/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
+++ b/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
@@ -1,19 +1,20 @@
-From 990835b15e3713e6c34d64b4bed8e55dcca6e6e2 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 30 Aug 2014 00:40:03 +0200
-Subject: [PATCH 2/2] cmake: disable shared library build when
- BUILD_SHARED_LIBS is off
+From 045b035bd9ebbd45f40dda36b143ede869eb5f16 Mon Sep 17 00:00:00 2001
+From: Sagaert Johan <sagaert.johan@skynet.be>
+Date: Fri, 31 Oct 2014 12:25:48 +0100
+Subject: [PATCH 1/1] new patch based on original from: Samuel Martin
 
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 ---
- CMakeLists.txt | 19 +++++++++++++------
- 1 file changed, 13 insertions(+), 6 deletions(-)
+This is a rework of [PATCH 2/2] cmake: disable shared library build when
+ BUILD_SHARED_LIBS is off  (from Samuel Martin <s.martin49@gmail.com>)
+ CMakeLists.txt | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 72391b0..8f28680 100644
+index 7978845..89853ce 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -320,14 +320,19 @@ source_group("Sources"          FILES ${SOURCES})
+@@ -372,14 +372,19 @@ source_group("Sources"          FILES ${SOURCES})
  #
  # Create the lib.
  #
@@ -33,7 +34,7 @@ index 72391b0..8f28680 100644
  
  if (WIN32)
  	# On Windows libs have the same file ending (.lib)
-@@ -348,15 +353,17 @@ endif(WIN32)
+@@ -400,15 +405,17 @@ endif(WIN32)
  
  # We want the shared lib to be named "libwebsockets"
  # not "libwebsocket_shared".
@@ -54,7 +55,7 @@ index 72391b0..8f28680 100644
  			PROPERTIES
  			SOVERSION ${SOVERSION})
  	endforeach()
-@@ -408,7 +415,7 @@ if (NOT WITHOUT_EXTENSIONS)
+@@ -460,7 +467,7 @@ if (NOT LWS_WITHOUT_EXTENSIONS)
  	endif()
  
  	# Make sure ZLib is compiled before the libs.
@@ -63,7 +64,7 @@ index 72391b0..8f28680 100644
  		add_dependencies(${lib} ZLIB)
  	endforeach()
  
-@@ -462,7 +469,7 @@ if (UNIX)
+@@ -524,7 +531,7 @@ if (UNIX)
  endif()
  
  # Setup the linking for all libs.
@@ -72,15 +73,6 @@ index 72391b0..8f28680 100644
  	target_link_libraries(${lib} ${LIB_LIST})
  endforeach()
  
-@@ -727,7 +734,7 @@ install(FILES ${HDR_PUBLIC}
- set(CPACK_COMPONENT_HEADERS_DISPLAY_NAME "Header files")
- 
- # Install libs.
--install(TARGETS websockets websockets_shared
-+install(TARGETS ${_libs_websockets}
- 		LIBRARY DESTINATION lib${LIB_SUFFIX}
- 		ARCHIVE DESTINATION lib${LIB_SUFFIX}
- 		COMPONENT libraries)
 -- 
-2.1.0
+2.1.2
 
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 96b51cb..75cbd09 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v1.23-chrome32-firefox24
+LIBWEBSOCKETS_VERSION = v1.3-chrome37-firefox30
 LIBWEBSOCKETS_SOURCE = libwebsockets-$(LIBWEBSOCKETS_VERSION).tar.xz
 LIBWEBSOCKETS_SITE = http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
 LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
-- 
2.1.2
