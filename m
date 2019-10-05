From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sat,  5 Oct 2019 14:22:17 +0200
Subject: [Buildroot] [PATCH v2 03/13] utils/checkpackagelib:
 CommentsMenusPackagesOrder: use '-' to describe state
In-Reply-To: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20191005122227.7297-4-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/checkpackagelib/lib_config.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 06c066c5ca..d1d4a4f549 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -115,7 +115,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
             self.initialize_level_elements(text)
 
         elif text.startswith("endif") or text.startswith("endmenu"):
-            if self.state.endswith("comment"):
+            if self.state.endswith("-comment"):
                 self.state = self.state[:-8]
 
             if text.startswith("endif"):
-- 
2.17.1
