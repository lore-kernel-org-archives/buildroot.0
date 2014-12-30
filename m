From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Dec 2014 11:19:00 +0100
Subject: [Buildroot] [git commit] package/libxml2: fix libxml2-config.cmake
Message-ID: <20141230102545.25467807CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc9022e48107ef5d28cdcfbbfb234fc28255bccd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch aligns the libxml2-config.cmake module to what the libxml-2.0.pc set.

This patch has already been sent upstream:
  https://mail.gnome.org/archives/xml/2014-December/msg00015.html

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...onfig.cmake.in-update-include-directories.patch |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/libxml2/0001-libxml2-config.cmake.in-update-include-directories.patch b/package/libxml2/0001-libxml2-config.cmake.in-update-include-directories.patch
new file mode 100644
index 0000000..589c8d6
--- /dev/null
+++ b/package/libxml2/0001-libxml2-config.cmake.in-update-include-directories.patch
@@ -0,0 +1,28 @@
+From dd6125f4b58fe7bc270e51bc3fcf41cd228d22fc Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Mon, 29 Dec 2014 20:40:18 +0100
+Subject: [PATCH] libxml2-config.cmake.in: update include directories
+
+Align the include directories on those from the pkg-config module.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ libxml2-config.cmake.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libxml2-config.cmake.in b/libxml2-config.cmake.in
+index ac29329..6b16fc2 100644
+--- a/libxml2-config.cmake.in
++++ b/libxml2-config.cmake.in
+@@ -21,7 +21,7 @@ set(LIBXML2_VERSION_MINOR  @LIBXML_MINOR_VERSION@)
+ set(LIBXML2_VERSION_MICRO  @LIBXML_MICRO_VERSION@)
+ set(LIBXML2_VERSION_STRING "@VERSION@")
+ set(LIBXML2_INSTALL_PREFIX ${_libxml2_rootdir})
+-set(LIBXML2_INCLUDE_DIRS   ${_libxml2_rootdir}/include)
++set(LIBXML2_INCLUDE_DIRS   ${_libxml2_rootdir}/include ${_libxml2_rootdir}/include/libxml2)
+ set(LIBXML2_LIBRARY_DIR    ${_libxml2_rootdir}/lib)
+ set(LIBXML2_LIBRARIES      -L${LIBXML2_LIBRARY_DIR} -lxml2)
+ 
+-- 
+2.2.1
+
