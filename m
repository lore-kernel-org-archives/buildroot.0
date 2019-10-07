From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Oct 2019 23:39:21 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: initialize 'menu_of_packages' array
Message-ID: <20191007213952.1ED018B4F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16271ec3569cf7e306a5809a6023579dbe20070c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'source' without a previous 'menu' is common in package/Config.in in
br2-externals.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
