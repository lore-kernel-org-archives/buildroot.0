From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Mar 2020 20:25:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/linphone: fix powerpc build
Message-ID: <20200315192529.151801-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/d90bca02c2771df8dfbf39892d529fb5f9069656

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...re-paths-paths.cpp-fix-powerpc-build.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch

diff --git a/package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch b/package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch
new file mode 100644
index 0000000000..1655fa59a1
--- /dev/null
+++ b/package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch
@@ -0,0 +1,35 @@
+From d5d528e7562f358b9564e64cea0678020c51479a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 15 Mar 2020 18:56:19 +0100
+Subject: [PATCH] src/core/paths/paths.cpp: fix powerpc build
+
+Fix the following build failure on powerpc:
+
+/home/test/autobuild/run/instance-2/output-1/build/linphone-4.3.1/src/core/paths/paths.cpp:32:3: error: #error "Unsupported system."
+  #error "Unsupported system."
+   ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d90bca02c2771df8dfbf39892d529fb5f9069656
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/core/paths/paths.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/paths/paths.cpp b/src/core/paths/paths.cpp
+index 0442282fe..2c6508a51 100644
+--- a/src/core/paths/paths.cpp
++++ b/src/core/paths/paths.cpp
+@@ -26,7 +26,7 @@
+ 	#include "paths-android.h"
+ #elif defined(_WIN32)
+ 	#include "paths-windows.h"
+-#elif defined(__linux)
++#elif defined(__linux) || defined(__linux__)
+ 	#include "paths-linux.h"
+ #else
+ 	#error "Unsupported system."
+-- 
+2.25.1
+
-- 
2.25.1
