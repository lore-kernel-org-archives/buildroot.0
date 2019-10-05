From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 Oct 2019 14:22:18 +0200
Subject: [Buildroot] [PATCH v2 04/13] utils/checkpackagelib:
 CommentsMenusPackagesOrder: use package arrays initialize in before()
In-Reply-To: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20191005122227.7297-5-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also order them alphabetically.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/checkpackagelib/lib_config.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index d1d4a4f549..c5d0dc0fdb 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -61,14 +61,13 @@ class AttributesOrder(_CheckFunction):
 
 
 class CommentsMenusPackagesOrder(_CheckFunction):
-    menu_of_packages = [""]
-    package = [""]
-    print_package_warning = [True]
-
     def before(self):
-        self.state = ""
         self.level = 0
+        self.menu_of_packages = [""]
         self.new_package = ""
+        self.package = [""]
+        self.print_package_warning = [True]
+        self.state = ""
 
     def get_level(self):
         return len(self.state.split('-')) - 1
-- 
2.17.1
