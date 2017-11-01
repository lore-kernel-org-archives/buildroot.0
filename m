From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 10:36:49 +0100
Subject: [Buildroot] [git commit] package/openjpeg: fix static library
	install
Message-ID: <20171101092952.CABEE80FE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84ec4f15ebbc3fb0691c7775766864c5a5039ff5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/c35/c35599e6bf09aebe456ea959d7c238f82090fc62/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openjpeg/0004-install-static-lib.patch | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/openjpeg/0004-install-static-lib.patch b/package/openjpeg/0004-install-static-lib.patch
new file mode 100644
index 0000000..4a3bbfa
--- /dev/null
+++ b/package/openjpeg/0004-install-static-lib.patch
@@ -0,0 +1,27 @@
+From 66297f07a43d2770a97c8456d20202f3d051d980 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Mon, 9 Oct 2017 11:40:43 +0200
+Subject: [PATCH] Unix build: fix regression of 2.3.0 where a shared-only or
+ static-only build lacks the installation target for the library (#1019, fixes
+ regression introduced by 3dfc6ca2bcf06fd1adb6b6b4cecc6c092f08ba0b)
+
+Downloaded from upstream commit
+https://github.com/uclouvain/openjpeg/commit/66297f07a43d2770a97c8456d20202f3d051d980
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/lib/openjp2/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lib/openjp2/CMakeLists.txt b/src/lib/openjp2/CMakeLists.txt
+index 0b4520384..f8990ccf0 100644
+--- a/src/lib/openjp2/CMakeLists.txt
++++ b/src/lib/openjp2/CMakeLists.txt
+@@ -99,6 +99,7 @@ else()
+     set(INSTALL_LIBS ${OPENJPEG_LIBRARY_NAME} openjp2_static)
+   else()
+     add_library(${OPENJPEG_LIBRARY_NAME} ${OPENJPEG_SRCS})
++    set(INSTALL_LIBS ${OPENJPEG_LIBRARY_NAME})
+   endif()
+ endif()
+ 
