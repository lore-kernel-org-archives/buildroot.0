From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:42:40 +0200
Subject: [Buildroot] [git commit] package/libvncserver: fix build without C++
Message-ID: <20190623104321.DB65081238@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca393d7a5b77d877573cdbb7029949d229bce062
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/16aaa4e86a2dbf1acf95f10d5131b0f7b8a3d61a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-CMakeLists.txt-fix-build-without-C.patch  | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/libvncserver/0001-CMakeLists.txt-fix-build-without-C.patch b/package/libvncserver/0001-CMakeLists.txt-fix-build-without-C.patch
new file mode 100644
index 0000000000..591c97fd6a
--- /dev/null
+++ b/package/libvncserver/0001-CMakeLists.txt-fix-build-without-C.patch
@@ -0,0 +1,33 @@
+From 868f0a9fa60bb45ee6cf762f323c5b3964b2ee69 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 23 Jun 2019 10:18:59 +0200
+Subject: [PATCH] CMakeLists.txt: fix build without C++
+
+Specify that libvncserver is a C project file otherwise build will fail
+if no C++ compiler is found by cmake
+
+Fixes:
+ - http://autobuild.buildroot.org/results/16aaa4e86a2dbf1acf95f10d5131b0f7b8a3d61a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/LibVNC/libvncserver/pull/317]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0d3b4dc..ad609ae 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ cmake_minimum_required(VERSION 3.4)
+ cmake_policy(SET CMP0037 NEW)
+ 
+-project(LibVNCServer)
++project(LibVNCServer C)
+ include(CheckFunctionExists)
+ include(CheckSymbolExists)
+ include(CheckIncludeFile)
+-- 
+2.20.1
+
