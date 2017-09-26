From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Sep 2017 19:10:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsync: fix build without C++
	support
Message-ID: <20170926171050.16750-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/3ca/3cacb87e39a0ebb9d227fff4be71bea8132bf0ed/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...CMakeLists.txt-Don-t-require-a-C-compiler.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/librsync/0001-CMakeLists.txt-Don-t-require-a-C-compiler.patch

diff --git a/package/librsync/0001-CMakeLists.txt-Don-t-require-a-C-compiler.patch b/package/librsync/0001-CMakeLists.txt-Don-t-require-a-C-compiler.patch
new file mode 100644
index 0000000000..af5d28c5dc
--- /dev/null
+++ b/package/librsync/0001-CMakeLists.txt-Don-t-require-a-C-compiler.patch
@@ -0,0 +1,33 @@
+From c1af3e1b926fa04dbddc2d30586ff26026083134 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 26 Sep 2017 19:06:43 +0200
+Subject: [PATCH] CMakeLists.txt: Don't require a C++ compiler
+
+By default, CMake assumes that the project is using both C and C++.  By
+explicitly passing 'C' as argument of the project() macro, we tell CMake
+that only C is used, which prevents CMake from erroring out if a C++
+compiler doesn't exist.
+
+Patch sent upstream: https://github.com/librsync/librsync/pull/116
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 85536e3..7fe1eda 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -16,7 +16,7 @@
+ # Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ 
+ 
+-project(librsync)
++project(librsync C)
+ cmake_minimum_required(VERSION 2.6)
+ 
+ INCLUDE(CMakeDependentOption)
+-- 
+2.11.0
+
-- 
2.11.0
