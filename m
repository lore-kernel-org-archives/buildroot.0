From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 Aug 2020 18:20:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/supertux: fix build with boost
 1.73.0
Message-ID: <20200814162054.1406222-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/0f02877a665b2281266df4b23c72a7c113906c31

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-Fix-build-with-boost-1-73.patch      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/supertux/0002-Fix-build-with-boost-1-73.patch

diff --git a/package/supertux/0002-Fix-build-with-boost-1-73.patch b/package/supertux/0002-Fix-build-with-boost-1-73.patch
new file mode 100644
index 0000000000..000e5abcab
--- /dev/null
+++ b/package/supertux/0002-Fix-build-with-boost-1-73.patch
@@ -0,0 +1,25 @@
+From 4221d54385b69d6c40eff2c67bc6bad7ed165a44 Mon Sep 17 00:00:00 2001
+From: Lars Wendler <polynomial-c@gentoo.org>
+Date: Sat, 9 May 2020 03:04:02 +0200
+Subject: [PATCH] Fix build with boost-1.73
+
+[Retrieved from:
+https://github.com/SuperTux/supertux/commit/4221d54385b69d6c40eff2c67bc6bad7ed165a44]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/editor/object_settings.hpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/editor/object_settings.hpp b/src/editor/object_settings.hpp
+index bc9049a94e..15b77b1e46 100644
+--- a/src/editor/object_settings.hpp
++++ b/src/editor/object_settings.hpp
+@@ -22,6 +22,8 @@
+ 
+ #include "editor/object_option.hpp"
+ 
++#include <algorithm>
++
+ class Color;
+ enum class Direction;
+ enum class WalkMode;
-- 
2.27.0
