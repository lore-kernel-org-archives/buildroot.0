From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 22:24:42 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: get value of variable 'level'
Message-ID: <20190925201939.31B1A8F60B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e88b372744a8ccd29b6a4a44add6870aa0ed6b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Get value of variable 'level' only just after the state change.

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/checkpackagelib/lib_config.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 8f7b13a866..d12653f080 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -115,8 +115,9 @@ class CommentsMenusPackagesOrder(_CheckFunction):
             elif text.startswith("endmenu"):
                 self.state = self.state[:-5]
 
-        elif source_line:
             self.level = self.get_level()
+
+        elif source_line:
             new_package = source_line.group(1)
 
             # We order _ before A, so replace it with .
