From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 18:28:11 +0200
Subject: [Buildroot] [git commit] tinyxml2: fix line-endings of patches
Message-ID: <20150516162820.3525280D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ecea41003003bed3f3ecf6fd991077b225f625f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the line endings of the tinyxml2 patches added in
commits 22f5be171c6f9bb2611e7b87197e9faeabcaab18 and
0fa452df185545d3781b3015195bee9431496b5d. Thanks to Romain Naour for
providing the correct version of the patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch |   86 ++++++++++----------
 .../0002-Rename-test-fixed-cmake-warning.patch     |   38 +++++-----
 2 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch b/package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch
index fec1abe..52288c5 100644
--- a/package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch
+++ b/package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch
@@ -13,53 +13,53 @@ index 91c61a4..4375bb9 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -10,8 +10,8 @@ include(GNUInstallDirs)
- ################################
- # set lib version here
- 
+ ################################
+ # set lib version here
+ 
 -set(GENERIC_LIB_VERSION "2.2.0")
 -set(GENERIC_LIB_SOVERSION "2")
-+set(GENERIC_LIB_VERSION "2.2.0")
-+set(GENERIC_LIB_SOVERSION "2")
- 
- 
- ################################
++set(GENERIC_LIB_VERSION "2.2.0")
++set(GENERIC_LIB_SOVERSION "2")
+ 
+ 
+ ################################
 @@ -46,12 +46,8 @@ endif(MSVC)
- 
- ################################
- # Add targets
--set(BUILD_STATIC_LIBS ON CACHE BOOL "Set to ON to build static libraries")
--if(BUILD_STATIC_LIBS)
--	add_library(tinyxml2static STATIC tinyxml2.cpp tinyxml2.h)
--	set_target_properties(tinyxml2static PROPERTIES OUTPUT_NAME tinyxml2)
--endif(BUILD_STATIC_LIBS)
--add_library(tinyxml2 SHARED tinyxml2.cpp tinyxml2.h)
-+option(BUILD_SHARED_LIBS "build shared or static libraries" ON)
-+add_library(tinyxml2 tinyxml2.cpp tinyxml2.h)
- set_target_properties(tinyxml2 PROPERTIES
-         COMPILE_DEFINITIONS "TINYXML2_EXPORT"
- 	VERSION "${GENERIC_LIB_VERSION}"
+ 
+ ################################
+ # Add targets
+-set(BUILD_STATIC_LIBS ON CACHE BOOL "Set to ON to build static libraries")
+-if(BUILD_STATIC_LIBS)
+-	add_library(tinyxml2static STATIC tinyxml2.cpp tinyxml2.h)
+-	set_target_properties(tinyxml2static PROPERTIES OUTPUT_NAME tinyxml2)
+-endif(BUILD_STATIC_LIBS)
+-add_library(tinyxml2 SHARED tinyxml2.cpp tinyxml2.h)
++option(BUILD_SHARED_LIBS "build shared or static libraries" ON)
++add_library(tinyxml2 tinyxml2.cpp tinyxml2.h)
+ set_target_properties(tinyxml2 PROPERTIES
+         COMPILE_DEFINITIONS "TINYXML2_EXPORT"
+ 	VERSION "${GENERIC_LIB_VERSION}"
 @@ -63,16 +59,11 @@ add_dependencies(test ${TARGET_DATA_COPY})
- target_link_libraries(test tinyxml2)
- 
- 
--if(BUILD_STATIC_LIBS)
--	install(TARGETS tinyxml2 tinyxml2static
--		RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
--		LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
--		ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
--else(BUILD_STATIC_LIBS)
--	install(TARGETS tinyxml2
--		RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
--		LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
--endif(BUILD_STATIC_LIBS)
-+install(TARGETS tinyxml2
-+        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-+        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+
- install(FILES tinyxml2.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
- 
- foreach(p LIB INCLUDE)
+ target_link_libraries(test tinyxml2)
+ 
+ 
+-if(BUILD_STATIC_LIBS)
+-	install(TARGETS tinyxml2 tinyxml2static
+-		RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+-		LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+-		ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+-else(BUILD_STATIC_LIBS)
+-	install(TARGETS tinyxml2
+-		RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+-		LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
+-endif(BUILD_STATIC_LIBS)
++install(TARGETS tinyxml2
++        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
++        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
++
+ install(FILES tinyxml2.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
+ 
+ foreach(p LIB INCLUDE)
 -- 
 1.9.3
 
diff --git a/package/tinyxml2/0002-Rename-test-fixed-cmake-warning.patch b/package/tinyxml2/0002-Rename-test-fixed-cmake-warning.patch
index b712f68..409269a 100644
--- a/package/tinyxml2/0002-Rename-test-fixed-cmake-warning.patch
+++ b/package/tinyxml2/0002-Rename-test-fixed-cmake-warning.patch
@@ -13,26 +13,26 @@ index 4375bb9..4a8f91d 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -53,10 +53,10 @@ set_target_properties(tinyxml2 PROPERTIES
- 	VERSION "${GENERIC_LIB_VERSION}"
- 	SOVERSION "${GENERIC_LIB_SOVERSION}")
- 
--add_executable(test xmltest.cpp)
--add_dependencies(test tinyxml2)
--add_dependencies(test ${TARGET_DATA_COPY})
--target_link_libraries(test tinyxml2)
-+add_executable(xmltest xmltest.cpp)
-+add_dependencies(xmltest tinyxml2)
-+add_dependencies(xmltest ${TARGET_DATA_COPY})
-+target_link_libraries(xmltest tinyxml2)
- 
- 
- install(TARGETS tinyxml2
+ 	VERSION "${GENERIC_LIB_VERSION}"
+ 	SOVERSION "${GENERIC_LIB_SOVERSION}")
+ 
+-add_executable(test xmltest.cpp)
+-add_dependencies(test tinyxml2)
+-add_dependencies(test ${TARGET_DATA_COPY})
+-target_link_libraries(test tinyxml2)
++add_executable(xmltest xmltest.cpp)
++add_dependencies(xmltest tinyxml2)
++add_dependencies(xmltest ${TARGET_DATA_COPY})
++target_link_libraries(xmltest tinyxml2)
+ 
+ 
+ install(TARGETS tinyxml2
 @@ -76,4 +76,4 @@ endforeach()
- configure_file(tinyxml2.pc.in tinyxml2.pc @ONLY)
- install(FILES ${CMAKE_CURRENT_BINARY_DIR}/tinyxml2.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
- 
--#add_test(test ${SAMPLE_NAME} COMMAND $<TARGET_FILE:${SAMPLE_NAME}>)
-+#add_test(xmltest ${SAMPLE_NAME} COMMAND $<TARGET_FILE:${SAMPLE_NAME}>)
+ configure_file(tinyxml2.pc.in tinyxml2.pc @ONLY)
+ install(FILES ${CMAKE_CURRENT_BINARY_DIR}/tinyxml2.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+ 
+-#add_test(test ${SAMPLE_NAME} COMMAND $<TARGET_FILE:${SAMPLE_NAME}>)
++#add_test(xmltest ${SAMPLE_NAME} COMMAND $<TARGET_FILE:${SAMPLE_NAME}>)
 -- 
 1.9.3
 
