From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:31 +0200
Subject: [Buildroot] [PATCH 08/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: use '-' to describe state
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190903211341.10341-8-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 7f92f580b8..3d8f08cac9 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -114,7 +114,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
             self.initialize_level_elements(text)
 
         elif text.startswith("endif") or text.startswith("endmenu"):
-            if self.state.endswith("comment"):
+            if self.state.endswith("-comment"):
                 self.state = self.state[:-8]
 
             if text.startswith("endif"):
-- 
2.17.1
