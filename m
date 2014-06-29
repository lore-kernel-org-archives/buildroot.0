From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:44:00 +0200
Subject: [Buildroot] [git commit] graph-depends: remove unnecessary redirect
	of stderr
Message-ID: <20140629084431.362419CDAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfb6bf5ee91183291c91e960c9f57e846fdcd231
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It hides any error messages reported by make.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
