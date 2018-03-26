From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 26 Mar 2018 12:39:18 +0100
Subject: [Buildroot] [PATCH 1/1] brotli: disable unneeded check for C++
 compiler
Message-ID: <20180326113918.30054-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a local patch, also submitted upstream, which modifies
CMakeLists.txt to avoid the check for the unneeded C++ compiler.

Fixes:
- http://autobuild.buildroot.net/results/68e05c634e62ba4b6f6eb8dc95eeb16faa58fd60

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...-Tell-CMake-to-not-check-for-a-C-compiler.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/brotli/0001-Tell-CMake-to-not-check-for-a-C-compiler.patch

diff --git a/package/brotli/0001-Tell-CMake-to-not-check-for-a-C-compiler.patch b/package/brotli/0001-Tell-CMake-to-not-check-for-a-C-compiler.patch
new file mode 100644
index 0000000000..410de2830e
--- /dev/null
+++ b/package/brotli/0001-Tell-CMake-to-not-check-for-a-C-compiler.patch
@@ -0,0 +1,31 @@
+From fea0b1e46c486225d57e730cc0f94fa06b5b93fc Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Mon, 26 Mar 2018 12:12:00 +0100
+Subject: [PATCH] Tell CMake to not check for a C++ compiler
+
+By default CMake checks both for C and C++ compilers, while the latter
+is not needed. Setting the list of languages to just "C" in the call to
+project() removes the unneeded check.
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream-Status: Submitted [https://github.com/google/brotli/pull/653]
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2dc7232..3fbcbfb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -4,7 +4,7 @@
+ # support 2.8.7.
+ cmake_minimum_required(VERSION 2.8.6)
+ 
+-project(brotli)
++project(brotli LANGUAGES C)
+ 
+ # If Brotli is being bundled in another project, we don't want to
+ # install anything.  However, we want to let people override this, so
+-- 
+2.16.3
+
-- 
2.16.3
