From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Mon, 23 Jun 2014 10:23:37 -0400
Subject: [Buildroot] [PATCH] graph-build-time: support python3
Message-ID: <1403533417-21463-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is the result of 2to3.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 support/scripts/graph-build-time | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 8ef065f..524c30d 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -80,16 +80,16 @@ class Package:
             self.steps_start[step] = time
         else:
             self.steps_end[step] = time
-        if self.steps_start.has_key(step) and self.steps_end.has_key(step):
+        if step in self.steps_start and step in self.steps_end:
             self.steps_duration[step] = self.steps_end[step] - self.steps_start[step]
 
     def get_duration(self, step=None):
         if step is None:
             duration = 0
-            for step in self.steps_duration.keys():
+            for step in list(self.steps_duration.keys()):
                 duration += self.steps_duration[step]
             return duration
-        if self.steps_duration.has_key(step):
+        if step in self.steps_duration:
             return self.steps_duration[step]
         return 0
 
-- 
2.0.0
