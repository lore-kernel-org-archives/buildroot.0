From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Nov 2019 22:29:22 +0100
Subject: [Buildroot] [git commit] package/uvw: disable documentation
Message-ID: <20191102212232.71C6A8E580@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e360d763dda16184081313e136c31300396384a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to disable documentation through BUILD_DOC which is already
passed by cmake-infrastructure

Fixes:
 - http://autobuild.buildroot.org/results/f58a1d1a4ffdaf94fd0fcb4dbebe1e898f95638d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-CMakeLists.txt-add-BUILD_DOC-option.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/uvw/0001-CMakeLists.txt-add-BUILD_DOC-option.patch b/package/uvw/0001-CMakeLists.txt-add-BUILD_DOC-option.patch
new file mode 100644
index 0000000000..ae52362fa1
--- /dev/null
+++ b/package/uvw/0001-CMakeLists.txt-add-BUILD_DOC-option.patch
@@ -0,0 +1,28 @@
+From 8038b6343466b9a58fd5ef5f13d3255ecbfce5aa Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 31 Oct 2019 13:41:04 +0100
+Subject: [PATCH] CMakeLists.txt: add BUILD_DOC option
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/skypjack/uvw/pull/165]
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9fc5538..da6a02d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -62,7 +62,8 @@ find_package(Doxygen 1.8)
+ # Referenced directories and targets
+ #
+ 
+-if(DOXYGEN_FOUND)
++option(BUILD_DOC "Build documentation" ON)
++if(BUILD_DOC AND DOXYGEN_FOUND)
+     add_subdirectory(docs)
+ endif()
+ 
+-- 
+2.23.0
+
