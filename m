From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:24 +0200
Subject: [Buildroot] [PATCH 01/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: rename variable 'm'
Message-ID: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename variable 'm' for better readability.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 225f92af13..a3fbd0e69e 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -77,7 +77,8 @@ class CommentsMenusPackagesOrder(_CheckFunction):
                                  "package/Config.in.host"]:
             return
 
-        m = re.match(r'^\s*source ".*/([^/]*)/Config.in(.host)?"', text)
+        source_line = re.match(r'^\s*source ".*/([^/]*)/Config.in(.host)?"', text)
+
         if text.startswith("comment ") or text.startswith("if ") or \
            text.startswith("menu "):
 
@@ -113,9 +114,9 @@ class CommentsMenusPackagesOrder(_CheckFunction):
             elif text.startswith("endmenu"):
                 self.state = self.state[:-5]
 
-        elif m:
+        elif source_line:
             level = self.get_level()
-            new_package = m.group(1)
+            new_package = source_line.group(1)
 
             # We order _ before A, so replace it with .
             new_package_ord = new_package.replace('_', '.')
-- 
2.17.1
