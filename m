From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 Oct 2019 14:22:20 +0200
Subject: [Buildroot] [PATCH v2 06/13] utils/checkpackagelib:
 CommentsMenusPackagesOrder: add more Config.in files to check
In-Reply-To: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20191005122227.7297-7-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/checkpackagelib/lib_config.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 3a84828902..142e8f745d 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -88,8 +88,11 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
     def check_line(self, lineno, text):
         # We only want to force sorting for the top-level menus
-        if self.filename not in ["package/Config.in",
-                                 "package/Config.in.host"]:
+        if self.filename not in ["boot/Config.in",
+                                 "fs/Config.in",
+                                 "package/Config.in",
+                                 "package/Config.in.host",
+                                 "package/kodi/Config.in"]:
             return
 
         source_line = re.match(r'^\s*source ".*/([^/]*)/Config.in(.host)?"', text)
-- 
2.17.1
