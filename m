From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Dec 2018 10:04:35 +0100
Subject: [Buildroot] [PATCH 03/11] support/scripts/graph-depends: introduce
 MANDATORY_DEPS array
In-Reply-To: <cover.1543741464.git.yann.morin.1998@free.fr>
References: <cover.1543741464.git.yann.morin.1998@free.fr>
Message-ID: <370d36d0c5085f498bb16dedf8ac0a21becb4aa8.1543741464.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This array will be re-used in another function in a follow-up commit,
so it makes sense to factor it out.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
2.14.1
