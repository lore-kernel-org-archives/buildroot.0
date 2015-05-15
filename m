From: Lionel Orry <lionel.orry@gmail.com>
Date: Fri, 15 May 2015 14:26:40 +0200
Subject: [Buildroot] [PATCH 1/1] zmqpp: fix compilation with some toolchains
Message-ID: <1431692800-15539-1-git-send-email-lionel.orry@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d9ec39dc5829aac1b25bfea7484458fcebd68412/

add cstdlib header to ensure EXIT_FAILURE presence

Using some cross-compiling toolchains, EXIT_FAILURE is not always
properly defined without this inclusion.

Patch is upstream:
https://github.com/zeromq/zmqpp/pull/109

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
---
 package/zmqpp/0001-add-ctsdlib-header.patch | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/zmqpp/0001-add-ctsdlib-header.patch

diff --git a/package/zmqpp/0001-add-ctsdlib-header.patch b/package/zmqpp/0001-add-ctsdlib-header.patch
new file mode 100644
index 0000000..a4ae16e
--- /dev/null
+++ b/package/zmqpp/0001-add-ctsdlib-header.patch
@@ -0,0 +1,23 @@
+commit 57a27ccebdc2bc375267fcf0b82f5a66b20f86fa
+Author: Lionel Orry <lionel.orry@gmail.com>
+Date:   Fri May 15 14:13:22 2015 +0200
+
+    add cstdlib header to ensure EXIT_FAILURE presence
+    
+    Using some cross-compiling toolchains, EXIT_FAILURE is not always
+    properly defined without this inclusion.
+    
+    Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
+
+diff --git a/src/client/main.cpp b/src/client/main.cpp
+index 082c06b..760f01a 100644
+--- a/src/client/main.cpp
++++ b/src/client/main.cpp
+@@ -3,6 +3,7 @@
+  *      Author: @benjamg
+  */
+ 
++#include <cstdlib>
+ #include <array>
+ #include <iostream>
+ #include <tuple>
-- 
2.1.0
