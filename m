From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 9 Apr 2017 22:51:23 +0200
Subject: [Buildroot] [PATCH/autobuild 3/8] autobuild-run: use 'olddefconfig'
	instead of 'oldconfig'
In-Reply-To: <20170409205128.11560-1-arnout@mind.be>
References: <20170409205128.11560-1-arnout@mind.be>
Message-ID: <20170409205128.11560-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Back in the days that autobuild-run was created, we didn't have an
olddefconfig target so we had to pipe yes into oldconfig instead.
Nowadays, however, we can use the olddefconfig target.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 2f0463d..42276db 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -558,8 +558,8 @@ def gen_config(**kwargs):
 
     devnull = open(os.devnull, "w")
 
-    ret = subprocess.call(["yes '' 2>/dev/null| make O=%s -C %s oldconfig" % \
-                           (outputdir, srcdir)], shell=True, stdout=devnull, stderr=devnull)
+    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "olddefconfig"],
+                          stdout=devnull, stderr=devnull)
     if ret != 0:
         log_write(log, "ERROR: cannot oldconfig")
         return -1
-- 
2.11.0
