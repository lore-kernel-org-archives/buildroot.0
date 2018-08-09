From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  9 Aug 2018 21:53:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/waylandpp: fix build error with gcc
 4.4/4.9
Message-ID: <20180809195355.22877-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/51a/51afcd6d3c3c4839d8216b7b0dba35c8e38211f4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...iler-error-missing-stdexcept-to-use-.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/waylandpp/0001-scanner-Fix-compiler-error-missing-stdexcept-to-use-.patch

diff --git a/package/waylandpp/0001-scanner-Fix-compiler-error-missing-stdexcept-to-use-.patch b/package/waylandpp/0001-scanner-Fix-compiler-error-missing-stdexcept-to-use-.patch
new file mode 100644
index 0000000000..ad5b84257f
--- /dev/null
+++ b/package/waylandpp/0001-scanner-Fix-compiler-error-missing-stdexcept-to-use-.patch
@@ -0,0 +1,28 @@
+From 85b61589b0c73f6c6974862af678ed2f82806ac5 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 9 Aug 2018 21:44:46 +0200
+Subject: [PATCH] [scanner] Fix compiler error: missing <stdexcept> to use
+ std::runtime_error
+
+Patch sent upstream as PR 50.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ scanner/scanner.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/scanner/scanner.cpp b/scanner/scanner.cpp
+index 9c97b7c..7019e0a 100644
+--- a/scanner/scanner.cpp
++++ b/scanner/scanner.cpp
+@@ -22,6 +22,7 @@
+ #include <sstream>
+ #include <cctype>
+ #include <cmath>
++#include <stdexcept>
+ 
+ #include "pugixml.hpp"
+ 
+-- 
+2.18.0
+
-- 
2.18.0
