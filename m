From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:34 +0200
Subject: [Buildroot] [PATCH 11/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: add more Config.in files to check
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190903211341.10341-11-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index f1c709388c..a356702ca8 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -85,8 +85,11 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
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
