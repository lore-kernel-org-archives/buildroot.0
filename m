From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 21:50:40 +0100
Subject: [Buildroot] [git commit] jasper: bump version to 2.0.12
Message-ID: <20170310205213.1239882552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88db82cf937db08634e0232c6bc5da582f8dffa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove 0001-Disable-C-compiler-check.patch since it's already included
in this release. Upstream commit:

  https://github.com/mdadams/jasper/commit/4212e7e826e1f72c2f01391a80667c88fa2eb517

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jasper/0001-Disable-C-compiler-check.patch | 28 ----------------------
 package/jasper/jasper.hash                         |  2 +-
 package/jasper/jasper.mk                           |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/package/jasper/0001-Disable-C-compiler-check.patch b/package/jasper/0001-Disable-C-compiler-check.patch
deleted file mode 100644
index c1f7271..0000000
--- a/package/jasper/0001-Disable-C-compiler-check.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e4ed3e2c3fd5a859567f510deeb49a915d96700f Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sat, 14 Jan 2017 21:06:25 +0200
-Subject: [PATCH] Disable C++ compiler check
-
-jasper does not use C++ code. Allow use of toolchains without C++ support.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/mdadams/jasper/pull/110
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6c99b3e7df31..3ac166b060ad 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,6 @@
- cmake_minimum_required (VERSION 2.8.11)
- 
--project(JasPer)
-+project(JasPer C)
- 
- set(CMAKE_MODULE_PATH
-   ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/build/cmake/modules/")
--- 
-2.11.0
-
diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 6c3ab47..15e9829 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 54d85428e35263642358a11c312d61cbc054170546fae780e11271df5d1502e8 jasper-2.0.10.tar.gz
+sha256 5b24faf5ed38670d6286e45ab7516b26458d05e7929b435afe569176765f4dda  jasper-2.0.12.tar.gz
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index a243b9a..dbb3875 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.10
+JASPER_VERSION = 2.0.12
 JASPER_SITE = http://www.ece.uvic.ca/~frodo/jasper/software
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer License Version 2.0
