From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 Oct 2019 14:22:19 +0200
Subject: [Buildroot] [PATCH v2 05/13] utils/checkpackagelib:
 CommentsMenusPackagesOrder: initialize 'menu_of_packages' array
In-Reply-To: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20191005122227.7297-6-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

'source' without a previous 'menu' is common in package/Config.in in
br2-externals.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/checkpackagelib/lib_config.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index c5d0dc0fdb..3a84828902 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -63,7 +63,7 @@ class AttributesOrder(_CheckFunction):
 class CommentsMenusPackagesOrder(_CheckFunction):
     def before(self):
         self.level = 0
-        self.menu_of_packages = [""]
+        self.menu_of_packages = ["The top level menu"]
         self.new_package = ""
         self.package = [""]
         self.print_package_warning = [True]
-- 
2.17.1
