From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Mon, 15 Jul 2019 08:52:53 +0200
Subject: [Buildroot] [PATCH 1/1] utils/checkpackagelib:
 CommentsMenusPackagesOrder: fix order of packages checking
Message-ID: <20190715065253.6072-1-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 utils/checkpackagelib/lib_config.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index f0edb9993d..a135355f9a 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -72,8 +72,8 @@ class CommentsMenusPackagesOrder(_CheckFunction):
         return len(self.state.split('-')) - 1
 
     def check_line(self, lineno, text):
-        if text.startswith("comment") or text.startswith("if") or \
-           text.startswith("menu"):
+        if text.startswith("comment ") or text.startswith("if ") or \
+           text.startswith("menu "):
 
             if text.startswith("comment"):
                 if not self.state.endswith("-comment"):
@@ -103,7 +103,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
         elif text.startswith('\tsource "package/'):
             level = self.get_level()
-            new_package = text[17: -(len(self.filename)-5):]
+            new_package = text[17: -(len(self.filename)-self.filename.index("Config")+3):]
 
             # We order _ before A, so replace it with .
             new_package_ord = new_package.replace('_', '.')
-- 
2.17.1
