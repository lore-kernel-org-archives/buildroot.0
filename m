From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 14:35:21 +0100
Subject: [Buildroot] [git commit] support/graph-depends: also cut on host-tar
Message-ID: <20190317144806.902368F1D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3311aa8cf4ee5935a50990e02c609606e160219d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When host-tar is needed, it is a mandatory dependency of all packages.
As such, drawing the dependency lines toward host-tar would uselessly
clutter the graph.

So, like for the skeleton and host-skeleton, we cut the dependency chains
toward host-tar.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index c3e5d83ee8..3143c61cc4 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -172,7 +172,7 @@ def remove_transitive_deps(pkg, deps):
 
 # List of dependencies that all/many packages have, and that we want
 # to trim when generating the dependency graph.
-MANDATORY_DEPS = ['toolchain', 'skeleton', 'host-skeleton']
+MANDATORY_DEPS = ['toolchain', 'skeleton', 'host-skeleton', 'host-tar']
 
 
 # This function removes the dependency on some 'mandatory' package, like the
