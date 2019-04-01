From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  1 Apr 2019 18:21:58 +0200
Subject: [Buildroot] [PATCH 3/3] package/waylandpp: bump version to 0.2.5
In-Reply-To: <20190401162158.29819-1-bernd.kuhls@t-online.de>
References: <20190401162158.29819-1-bernd.kuhls@t-online.de>
Message-ID: <20190401162158.29819-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://github.com/NilsBrause/waylandpp/commit/242c2c9a188b1a972978fc05dbe70d102bc7c4e1

Bundled pugixml was removed:
https://github.com/NilsBrause/waylandpp/commit/433ce65b681c27d54e1e6b9a602f1c8291aabd54
Use host-pugixml instead.

Updated license hash due to upstream commit:
https://github.com/NilsBrause/waylandpp/commit/f255d61ffd982614c0659be1742383dab06710a2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...iler-error-missing-stdexcept-to-use-.patch | 28 -------------------
 package/waylandpp/waylandpp.hash              |  4 +--
 package/waylandpp/waylandpp.mk                |  5 ++--
 3 files changed, 5 insertions(+), 32 deletions(-)
 delete mode 100644 package/waylandpp/0001-scanner-Fix-compiler-error-missing-stdexcept-to-use-.patch

diff --git a/package/waylandpp/0001-scanner-Fix-compiler-error-missing-stdexcept-to-use-.patch b/package/waylandpp/0001-scanner-Fix-compiler-error-missing-stdexcept-to-use-.patch
deleted file mode 100644
index ad5b84257f..0000000000
--- a/package/waylandpp/0001-scanner-Fix-compiler-error-missing-stdexcept-to-use-.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 85b61589b0c73f6c6974862af678ed2f82806ac5 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Thu, 9 Aug 2018 21:44:46 +0200
-Subject: [PATCH] [scanner] Fix compiler error: missing <stdexcept> to use
- std::runtime_error
-
-Patch sent upstream as PR 50.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- scanner/scanner.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/scanner/scanner.cpp b/scanner/scanner.cpp
-index 9c97b7c..7019e0a 100644
---- a/scanner/scanner.cpp
-+++ b/scanner/scanner.cpp
-@@ -22,6 +22,7 @@
- #include <sstream>
- #include <cctype>
- #include <cmath>
-+#include <stdexcept>
- 
- #include "pugixml.hpp"
- 
--- 
-2.18.0
-
diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
index 1b14814c47..fb88573ee5 100644
--- a/package/waylandpp/waylandpp.hash
+++ b/package/waylandpp/waylandpp.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 ebd4a8447bb65f288cad0e04538f6ec704e155213fc2b9cc1a851534c70aacac  waylandpp-0.2.3.tar.gz
-sha256 49aa6d728fd13226952c9e3a5a9cae46379b2a501010064760172b5ce7cd94bb  LICENSE
+sha256 5a4361f73d2bee65bfe54b954ce085c9bfc7bc4429ac2bdc97c10e3b84660907  waylandpp-0.2.5.tar.gz
+sha256 8ff91f682a38f8a603b173222a60e8dc71754a79a522a316fb6b76ce138c542c  LICENSE
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  scanner/gpl-3.0.txt
diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
index ff17c35c1e..bb532103a2 100644
--- a/package/waylandpp/waylandpp.mk
+++ b/package/waylandpp/waylandpp.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-WAYLANDPP_VERSION = 0.2.3
+WAYLANDPP_VERSION = 0.2.5
 WAYLANDPP_SITE = $(call github,NilsBrause,waylandpp,$(WAYLANDPP_VERSION))
 WAYLANDPP_LICENSE = MIT, GPL-3.0+ (wayland_scanner)
 WAYLANDPP_LICENSE_FILES = LICENSE scanner/gpl-3.0.txt
 WAYLANDPP_INSTALL_STAGING = YES
-HOST_WAYLANDPP_DEPENDENCIES = host-pkgconf host-wayland
+# pugixml is needed only to build the host version of wayland-scanner++
+HOST_WAYLANDPP_DEPENDENCIES = host-pugixml host-pkgconf host-wayland
 WAYLANDPP_DEPENDENCIES = libegl host-pkgconf wayland host-waylandpp
 
 # host variant of wayland-scanner++ is needed for building the target
-- 
2.20.1
