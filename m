From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 23:54:54 +0200
Subject: [Buildroot] [git commit] libcgi: add patch to not require C++
	support
Message-ID: <20170902214828.0490F7FE30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1212fd9cc627851d3679a83cee88cd9f3e58f8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcgi is written in C, there is no need for a C++ compiler, but CMake
by default assumes that both C and C++ are needed. To fix that, this
commit adds a patch, submitted upstream, to adjust the CMakeLists.txt.

Fixes:

  http://autobuild.buildroot.net/results/d0b4740bdbd84ed6fcbba706caf42ebba4c07d15/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-CMakeLists.txt-libcgi-is-in-C.patch       | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/libcgi/0001-CMakeLists.txt-libcgi-is-in-C.patch b/package/libcgi/0001-CMakeLists.txt-libcgi-is-in-C.patch
new file mode 100644
index 0000000..682bfe5
--- /dev/null
+++ b/package/libcgi/0001-CMakeLists.txt-libcgi-is-in-C.patch
@@ -0,0 +1,32 @@
+From 043f7a470e32c036f0fe933ec5cd2003087d6b2e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 2 Sep 2017 23:50:42 +0200
+Subject: [PATCH] CMakeLists.txt: libcgi is in C
+
+By default, CMake checks that both C and C++ compilers are
+available. However, since libcgi is only C, there's no need for a C++
+compiler check. Therefore, this commit adjusts the project() variable
+definition to only require C language support.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Submitted-upstream: https://github.com/rafaelsteil/libcgi/pull/38
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f98a99d..c599ca9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,7 +3,7 @@
+ #
+ cmake_minimum_required(VERSION 2.8.8)
+ 
+-project(cgi)
++project(cgi C)
+ string(TOUPPER ${PROJECT_NAME} PROJECT_NAME_UC)
+ string(TOLOWER ${PROJECT_NAME} PROJECT_NAME_LC)
+ set(LIBPREFIX ${PROJECT_NAME})
+-- 
+2.13.5
+
