From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:17:07 +0100
Subject: [Buildroot] [git commit] support/scripts/graph-depends: introduce
 MANDATORY_DEPS array
Message-ID: <20181206211327.69E878B48F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e19b837f494a25552b50547862ee52e34589935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This array will be re-used in another function in a follow-up commit,
so it makes sense to factor it out.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index f1b6b142fb..d2b100f385 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -170,10 +170,15 @@ def remove_transitive_deps(pkg, deps):
     return new_d
 
 
+# List of dependencies that all/many packages have, and that we want
+# to trim when generating the dependency graph.
+MANDATORY_DEPS = ['toolchain', 'skeleton']
+
+
 # This function removes the dependency on some 'mandatory' package, like the
 # 'toolchain' package, or the 'skeleton' package
 def remove_mandatory_deps(pkg, deps):
-    return [p for p in deps[pkg] if p not in ['toolchain', 'skeleton']]
+    return [p for p in deps[pkg] if p not in MANDATORY_DEPS]
 
 
 # This function will check that there is no loop in the dependency chain
