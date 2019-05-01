From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 1 May 2019 15:09:53 +0200
Subject: [Buildroot] [git commit] package/liburiparser: fix build without C++
Message-ID: <20190501130956.EB20284658@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef228c9be07d56e4be880cee8afa91c16625cac8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/1e191676f28905a81de6282e07978aa5d4f02039

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-CMakeLists.txt-fix-build-without-C.patch  | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/liburiparser/0001-CMakeLists.txt-fix-build-without-C.patch b/package/liburiparser/0001-CMakeLists.txt-fix-build-without-C.patch
new file mode 100644
index 0000000000..9f5e88989a
--- /dev/null
+++ b/package/liburiparser/0001-CMakeLists.txt-fix-build-without-C.patch
@@ -0,0 +1,33 @@
+From 0e385a6b747e967b6724ef3ded944c7da3b16f79 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 1 May 2019 11:18:29 +0200
+Subject: [PATCH] CMakeLists.txt: fix build without C++
+
+Specify that uriparser is a C project (C++ is needed only for the test
+runner) otherwise build will fail if no C++ compiler is found by cmake
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1e191676f28905a81de6282e07978aa5d4f02039
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/uriparser/uriparser/pull/69]
+---
+ CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ceb79e0..40d3b20 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -39,6 +39,8 @@ cmake_minimum_required(VERSION 3.3)
+ project(uriparser
+     VERSION
+         0.9.3
++    LANGUAGES
++        C
+ )
+ 
+ # See https://www.gnu.org/software/libtool/manual/html_node/Updating-version-info.html
+-- 
+2.20.1
+
