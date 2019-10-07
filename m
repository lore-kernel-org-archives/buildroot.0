From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Oct 2019 23:39:21 +0200
Subject: [Buildroot] [git commit] utils/checkpackagelib:
 CommentsMenusPackagesOrder: add more Config.in files to check
Message-ID: <20191007213952.268008B4FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31fc6a1fe489edbd4e4c0493ed5ca9e79840fe48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Arnout: remove boot/Config.in, it is not ordered correctly yet.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_config.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 3a84828902..55c8589d71 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -88,8 +88,10 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
     def check_line(self, lineno, text):
         # We only want to force sorting for the top-level menus
-        if self.filename not in ["package/Config.in",
-                                 "package/Config.in.host"]:
+        if self.filename not in ["fs/Config.in",
+                                 "package/Config.in",
+                                 "package/Config.in.host",
+                                 "package/kodi/Config.in"]:
             return
 
         source_line = re.match(r'^\s*source ".*/([^/]*)/Config.in(.host)?"', text)
