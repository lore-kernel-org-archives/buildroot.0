From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 23:24:59 +0200
Subject: [Buildroot] [git commit] package/liburiparser: bump to version 0.9.4
Message-ID: <20200602212438.EA5E682B66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f653d5d75965c610ce7892b6ceeb588fc4975d07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update hash of COPYING (BSD-3 license fixed with
  https://github.com/uriparser/uriparser/commit/a3e81383591de85c65918a42e68fbe736832f7c1)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-CMakeLists.txt-fix-build-without-C.patch  | 33 ----------------------
 package/liburiparser/liburiparser.hash             |  4 +--
 package/liburiparser/liburiparser.mk               |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/package/liburiparser/0001-CMakeLists.txt-fix-build-without-C.patch b/package/liburiparser/0001-CMakeLists.txt-fix-build-without-C.patch
deleted file mode 100644
index 9f5e88989a..0000000000
--- a/package/liburiparser/0001-CMakeLists.txt-fix-build-without-C.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0e385a6b747e967b6724ef3ded944c7da3b16f79 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 1 May 2019 11:18:29 +0200
-Subject: [PATCH] CMakeLists.txt: fix build without C++
-
-Specify that uriparser is a C project (C++ is needed only for the test
-runner) otherwise build will fail if no C++ compiler is found by cmake
-
-Fixes:
- - http://autobuild.buildroot.org/results/1e191676f28905a81de6282e07978aa5d4f02039
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/uriparser/uriparser/pull/69]
----
- CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ceb79e0..40d3b20 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -39,6 +39,8 @@ cmake_minimum_required(VERSION 3.3)
- project(uriparser
-     VERSION
-         0.9.3
-+    LANGUAGES
-+        C
- )
- 
- # See https://www.gnu.org/software/libtool/manual/html_node/Updating-version-info.html
--- 
-2.20.1
-
diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index 4216f1f17f..feb5945849 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  28af4adb05e811192ab5f04566bebc5ebf1c30d9ec19138f944963d52419e28f  uriparser-0.9.3.tar.bz2
-sha256  ee90029e62d11f48faa59360d15c3ad8e7c094c74cc25b055716d92340da561f  COPYING
+sha256  b7cdabe5611408fc2c3a10f8beecb881a0c7e93ff669c578cd9e3e6d64b8f87b  uriparser-0.9.4.tar.bz2
+sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 4a68814e00..e333354ecc 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.9.3
+LIBURIPARSER_VERSION = 0.9.4
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.bz2
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
