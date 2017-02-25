From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Feb 2017 19:51:32 +0100
Subject: [Buildroot] [PATCH 3/4] Revert "cmake: bump version to 3.7.1"
In-Reply-To: <cover.1488048682.git.yann.morin.1998@free.fr>
References: <cover.1488048682.git.yann.morin.1998@free.fr>
Message-ID: <b4323eec8c32b257a62fabe5f2ea22df3cbc839b.1488048682.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cmake 3.7 causes serious regressions in some cmake-based packages,
related to how RPATH is handled.

This reverts commit d96fafc3d346af8790df45557b16069d6ce81e79.

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
index 7a22f21..687e5a4 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.7/cmake-3.7.1-SHA-256.txt
-sha256 449a5bce64dbd4d5b9517ebd1a1248ed197add6ad27934478976fd5f1f9330e1  cmake-3.7.1.tar.gz
+# From http://www.cmake.org/files/v3.7/cmake-3.7.0-SHA-256.txt
+sha256 ed63e05c41aeb6c036e503114ab15847f29c312f9f21f5f1a7060a4b4ec2fb31  cmake-3.7.0.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 107715c..e4904fc 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CMAKE_VERSION_MAJOR = 3.7
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.7.4
