From: Zoltan at osuosl.org <Zoltan@osuosl.org>
Date: Tue, 13 Nov 2012 13:05:10 +0100
Subject: [Buildroot] [PATCH 1/1] grantlee: fix lpthread build error
Message-ID: <1352808310-6303-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Zoltan Gyarmati" <mr.zoltan.gyarmati@gmail.com>


Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 .../grantlee-0.2.0-fix-lphread-link-error.patch    |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch

diff --git a/package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch b/package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch
new file mode 100644
index 0000000..8293172
--- /dev/null
+++ b/package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch
@@ -0,0 +1,13 @@
+diff -rupN grantlee-0.2.0_orig/templates/tests/CMakeLists.txt grantlee-0.2.0/templates/tests/CMakeLists.txt
+--- grantlee-0.2.0_orig/templates/tests/CMakeLists.txt	2012-11-13 12:11:44.583379820 +0100
++++ grantlee-0.2.0/templates/tests/CMakeLists.txt	2012-11-13 11:35:18.000000000 +0100
+@@ -68,7 +68,8 @@ macro(GRANTLEE_TEMPLATES_UNIT_TESTS)
+                   ${_testresource_rcc_src}
+     )
+     add_test(${_testname} ${_testname}_exec )
+-    target_link_libraries(${_testname}_exec ${QT_QTTEST_LIBRARY} grantlee_core )
++    find_package (Threads)
++    target_link_libraries(${_testname}_exec ${QT_QTTEST_LIBRARY} ${CMAKE_THREAD_LIBS_INIT}  grantlee_core )
+ 
+     set_property(GLOBAL APPEND PROPERTY TEST_COVERAGE "${CMAKE_CURRENT_BINARY_DIR}/${_testname}_exec" )
+   endforeach(_testname)
-- 
1.7.9.5
