From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 23 Jun 2014 22:11:24 +0200
Subject: [Buildroot] [PATCH 2/2] graph-depends: remove unnecessary redirect
	of stderr
In-Reply-To: <1403554284-4935-1-git-send-email-arnout@mind.be>
References: <1403554284-4935-1-git-send-email-arnout@mind.be>
Message-ID: <1403554284-4935-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It hides any error messages reported by make.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/graph-depends | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 52c16ce..1ecfeda 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -82,7 +82,7 @@ allpkgs = []
 def get_targets():
     sys.stderr.write("Getting targets\n")
     cmd = ["make", "-s", "--no-print-directory", "show-targets"]
-    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
+    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
     output = p.communicate()[0].strip()
     if p.returncode != 0:
         return None
@@ -98,7 +98,7 @@ def get_depends(pkgs):
     cmd = ["make", "-s", "--no-print-directory" ]
     for pkg in pkgs:
         cmd.append("%s-show-depends" % pkg)
-    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
+    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
     output = p.communicate()[0]
     if p.returncode != 0:
         sys.stderr.write("Error getting dependencies %s\n" % pkgs)
-- 
2.0.0
