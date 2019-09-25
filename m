From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 22:24:39 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: rename variable 'm'
Message-ID: <20190925201939.216158F69E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd99dc576340b8d1bcb046fbaee9b75789b23988
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rename variable 'm' for better readability.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
