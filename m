From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Oct 2019 23:39:21 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: initialize in before()
Message-ID: <20191007213952.1247C8B4F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b47590fdb02e1fe74ff832428f2e154cc7d960e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes sure the state from a previous run (previous file) can never
leak over into the next file.

Also order the initializations alphabetically.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Acked-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
