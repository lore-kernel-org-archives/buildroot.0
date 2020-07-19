From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jul 2020 22:54:30 +0200
Subject: [Buildroot] [git commit] package/avro-c: fix build without C++
Message-ID: <20200719205035.5843187A47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c351877a6ec9436bbce46cfe355501f980e6a89f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/cfa91db53cf5502cbb6f902d1e7ad6397c8d70fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-Build-failure-without-a-C-compiler-again.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/avro-c/0001-cmake-Build-failure-without-a-C-compiler-again.patch b/package/avro-c/0001-cmake-Build-failure-without-a-C-compiler-again.patch
new file mode 100644
index 0000000000..8f7e59cf62
--- /dev/null
+++ b/package/avro-c/0001-cmake-Build-failure-without-a-C-compiler-again.patch
@@ -0,0 +1,34 @@
+From 8f5633a29b083a84876c00b88fba6d3e8dbbf1a8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 19 Jul 2020 09:35:09 +0200
+Subject: [PATCH] cmake: Build failure without a C++ compiler (again)
+
+avro-c fails to build (again) without a C++ compiler because commit
+664c2fc7fba19709c1f974055f9cf4c8a799e108 reverted the change made by
+commit 414a51fdc1856083bb16851f09a4c61a48796132
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cfa91db53cf5502cbb6f902d1e7ad6397c8d70fd
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://issues.apache.org/jira/browse/AVRO-2898]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6c8d7aaf..aa923e18 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # under the License.
+ #
+ cmake_minimum_required(VERSION 3.1)
+-project(AvroC)
++project(AvroC C)
+ enable_testing()
+ 
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR})
+-- 
+2.27.0
+
