From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:38:57 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/mariadb: security
 bump to 10.3.22
Message-ID: <20200310202812.80EE5907D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=556af5c086d2a5b14ce21e40c443c7141dfa14f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Release notes:
https://mariadb.com/kb/en/library/mariadb-10322-release-notes/

Changelog:
https://mariadb.com/kb/en/library/mariadb-10322-changelog/

Fixes the following security vulnerability (10.3.22):
CVE-2020-2574 - Vulnerability in the MySQL Client product of Oracle MySQL
(component: C API). Supported versions that are affected are 5.6.46 and
prior, 5.7.28 and prior and 8.0.18 and prior. Difficult to exploit
vulnerability allows unauthenticated attacker with network access via
multiple protocols to compromise MySQL Client. Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Client.

Fixes the following security vulnerabilities (10.3.19):
CVE-2019-2974 - Vulnerability in the MySQL Server product of Oracle MySQL
(component: Server: Optimizer). Supported versions that are affected are
5.6.45 and prior, 5.7.27 and prior and 8.0.17 and prior. Easily exploitable
vulnerability allows low privileged attacker with network access via
multiple protocols to compromise MySQL Server. Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2019-2938 - Vulnerability in the MySQL Server product of Oracle MySQL
(component: InnoDB). Supported versions that are affected are 5.7.27 and
prior and 8.0.17 and prior. Difficult to exploit vulnerability allows high
privileged attacker with network access via multiple protocols to compromise
MySQL Server. Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash
(complete DOS) of MySQL Server.

Patch 0002-fix-build-error-with-newer-cmake.patch has been removed as it
has been applied upstream.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4071a7d74328ae0f7002870bf1927db888564847)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-fix-build-error-with-newer-cmake.patch    | 44 ----------------------
 package/mariadb/mariadb.hash                       | 10 ++---
 package/mariadb/mariadb.mk                         |  2 +-
 3 files changed, 6 insertions(+), 50 deletions(-)

diff --git a/package/mariadb/0002-fix-build-error-with-newer-cmake.patch b/package/mariadb/0002-fix-build-error-with-newer-cmake.patch
deleted file mode 100644
index 5ffac688a3..0000000000
--- a/package/mariadb/0002-fix-build-error-with-newer-cmake.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c90ae2ca3dff267b9e21595376d22de397f6f78f Mon Sep 17 00:00:00 2001
-From: Ryan Coe <bluemrp9@gmail.com>
-Date: Tue, 20 Aug 2019 06:22:43 -0700
-Subject: [PATCH] Fix build error with newer cmake
-
-Fixes the following build error:
-
-CMake Error at cmake/os/Linux.cmake:29 (STRING):
-STRING sub-command REPLACE requires at least four arguments.
-Call Stack (most recent call first):
-CMakeLists.txt:101 (INCLUDE)
-
-CMake Error at cmake/os/Linux.cmake:29 (STRING):
-STRING sub-command REPLACE requires at least four arguments.
-Call Stack (most recent call first):
-CMakeLists.txt:101 (INCLUDE)
-
-https://jira.mariadb.org/browse/MDEV-20596
-
-Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
----
- cmake/os/Linux.cmake | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/cmake/os/Linux.cmake b/cmake/os/Linux.cmake
-index 50a2b21c838d8d6ca4cacc0704a9be4da3a57a0a..b871586acc9cfaddc3836cc9afafd85969120420 100644
---- a/cmake/os/Linux.cmake
-+++ b/cmake/os/Linux.cmake
-@@ -26,9 +26,9 @@ SET(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -D_GNU_SOURCE=1)
- 
- # Fix CMake (< 2.8) flags. -rdynamic exports too many symbols.
- FOREACH(LANG C CXX)
--  STRING(REPLACE "-rdynamic" "" 
--  CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS
--  ${CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS}  
-+  STRING(REPLACE "-rdynamic" ""
-+  "CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS"
-+  "${CMAKE_SHARED_LIBRARY_LINK_${LANG}_FLAGS}"
-   )
- ENDFOREACH()
- 
--- 
-2.17.1
-
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index a742d87daa..679643887f 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,8 +1,8 @@
-# From https://downloads.mariadb.org/mariadb/10.3.18
-md5 b3524c0825c3a1c255496daea38304a0  mariadb-10.3.18.tar.gz
-sha1 922a317edd6f44baacc49831ca278e7a9878a363  mariadb-10.3.18.tar.gz
-sha256 69456ca85bf9d96c6d28b4ade2a9f6787d79a602e27ef941f9ba4e0b55dddedc  mariadb-10.3.18.tar.gz
-sha512 817253d18f20c74f9ec8030678fd50a28b1726fd59153023a3a5e9b3f79e1f44d79feb24ae9ed72d8c1c04017110c932aba7be0610fb06245590c7f5610db242  mariadb-10.3.18.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.22
+md5 f712a5e6fde038d0c9c6d2a2cd88b84e  mariadb-10.3.22.tar.gz
+sha1 f92f517fc2ea893ffb3d599ade219bf0a0045265  mariadb-10.3.22.tar.gz
+sha256 3200055dbdc27746981b3bb4bc182e2cb79dcf28ea88014b641a5b81280ccec7  mariadb-10.3.22.tar.gz
+sha512 57a6551b8939f54742963202d50a537e69e8ab9b2dca42ce3d2a09c0f7af368fded71f36af26f6cbd956d54fe43853981ba8fe28b7a3ba97c7d52ea4a0d233f6  mariadb-10.3.22.tar.gz
 
 # Hash for license files
 sha256 a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index d08909d35c..0f2ab5ca76 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.18
+MARIADB_VERSION = 10.3.22
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
