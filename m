From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 2 Aug 2019 18:43:52 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: properly initialize levels
Message-ID: <20190802164122.40BB48CA23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5990601bae7729e44d3cc342f290d8a1608e9e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix an issue introduced by Arnout while committing. Jerzy originally
initialized the menu_of_packages, package and print_package_warning
members like they should be, but Arnout thought it wasn't needed and
removed that.

It is actually needed, to make sure the top level (level 0) works.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/264383157

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 26349fb681..225f92af13 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -61,9 +61,9 @@ class AttributesOrder(_CheckFunction):
 
 
 class CommentsMenusPackagesOrder(_CheckFunction):
-    menu_of_packages = []
-    package = []
-    print_package_warning = []
+    menu_of_packages = [""]
+    package = [""]
+    print_package_warning = [True]
 
     def before(self):
         self.state = ""
