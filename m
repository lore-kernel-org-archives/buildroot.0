From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Feb 2017 19:51:30 +0100
Subject: [Buildroot] [PATCH 1/4] Revert "cmake: bump version to 3.7.2"
In-Reply-To: <cover.1488048682.git.yann.morin.1998@free.fr>
References: <cover.1488048682.git.yann.morin.1998@free.fr>
Message-ID: <229c9d3b08b673a6de41958d59c1bbb77997ddb7.1488048682.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cmake 3.7 causes serious regressions in some cmake-based packages,
related to how RPATH is handled.

This reverts commit f8a6990c92451dab2ff9e14f3e94fdecbd79b604.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: J?rg Krause <joerg.krause@embedded.rocks>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 13c0237..7a22f21 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.7/cmake-3.7.2-SHA-256.txt
-sha256 dc1246c4e6d168ea4d6e042cfba577c1acd65feea27e56f5ff37df920c30cae0  cmake-3.7.2.tar.gz
+# From http://www.cmake.org/files/v3.7/cmake-3.7.1-SHA-256.txt
+sha256 449a5bce64dbd4d5b9517ebd1a1248ed197add6ad27934478976fd5f1f9330e1  cmake-3.7.1.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 0fd7139..107715c 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CMAKE_VERSION_MAJOR = 3.7
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.7.4
