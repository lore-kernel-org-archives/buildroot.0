From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 14:01:02 +0200
Subject: [Buildroot] [git commit] package/tinyxml2: fix cmake warning
Message-ID: <20150516120130.E10DF7FABD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fa452df185545d3781b3015195bee9431496b5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CMake complains about Policy CMP0037 that reserve some
target name such "test".
So remove the warning by renaming test to xmltest.

Backport an upstream patch:
0b2c22bd46be95b08f234b8b4cb262f72ab3f0e8

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-Rename-test-fixed-cmake-warning.patch     |   38 ++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/tinyxml2/0002-Rename-test-fixed-cmake-warning.patch b/package/tinyxml2/0002-Rename-test-fixed-cmake-warning.patch
new file mode 100644
index 0000000..b712f68
--- /dev/null
+++ b/package/tinyxml2/0002-Rename-test-fixed-cmake-warning.patch
@@ -0,0 +1,38 @@
+From 77631a9cf500a578338a83bc230c419bf2a05b50 Mon Sep 17 00:00:00 2001
+From: xantares <xantares09@hotmail.com>
+Date: Fri, 14 Nov 2014 19:46:18 +0100
+Subject: [PATCH] Rename test, fixed cmake warning.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ CMakeLists.txt | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4375bb9..4a8f91d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -53,10 +53,10 @@ set_target_properties(tinyxml2 PROPERTIES
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
+@@ -76,4 +76,4 @@ endforeach()
+ configure_file(tinyxml2.pc.in tinyxml2.pc @ONLY)
+ install(FILES ${CMAKE_CURRENT_BINARY_DIR}/tinyxml2.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+ 
+-#add_test(test ${SAMPLE_NAME} COMMAND $<TARGET_FILE:${SAMPLE_NAME}>)
++#add_test(xmltest ${SAMPLE_NAME} COMMAND $<TARGET_FILE:${SAMPLE_NAME}>)
+-- 
+1.9.3
+
