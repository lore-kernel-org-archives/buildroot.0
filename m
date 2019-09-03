From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:32 +0200
Subject: [Buildroot] [PATCH 09/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: drop function get_line
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190903211341.10341-9-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because function get_line() has only one line so use it inline.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 3d8f08cac9..f39a4b0599 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -69,9 +69,6 @@ class CommentsMenusPackagesOrder(_CheckFunction):
         self.state = ""
         self.new_package = ""
 
-    def get_level(self):
-        return len(self.state.split('-')) - 1
-
     def initialize_package_level_elements(self, text):
         try:
             self.menu_of_packages[self.level] = text[:-1]
@@ -83,7 +80,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
             self.print_package_warning.append(True)
 
     def initialize_level_elements(self, text):
-        self.level = self.get_level()
+        self.level = len(self.state.split('-')) - 1
         self.initialize_package_level_elements(text)
 
     def check_line(self, lineno, text):
@@ -123,7 +120,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
             elif text.startswith("endmenu"):
                 self.state = self.state[:-5]
 
-            self.level = self.get_level()
+            self.level = len(self.state.split('-')) - 1
 
         elif source_line:
             self.new_package = source_line.group(1)
-- 
2.17.1
