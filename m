From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 09:21:56 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] package/waylandpp: fix
 build error with gcc 4.4/4.9
Message-ID: <20180824071414.D6EF28E560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70ccee73cae57f7ca1f0aaf5e0234d03a0949def
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Fixes
http://autobuild.buildroot.net/results/51a/51afcd6d3c3c4839d8216b7b0dba35c8e38211f4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c4a3cdd06a7a4acd08036ff3a77d107bb41592e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-compiler-error-missing-stdexcept-to-use-.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

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
