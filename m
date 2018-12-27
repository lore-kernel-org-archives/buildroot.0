From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 17:45:33 +0100
Subject: [Buildroot] [PATCH] docs/manual: update package-make-target.txt
 with more targets
Message-ID: <20181227164533.21663-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit updates package-make-target.txt with a few additional
useful per-package targets that have been added in recent times.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/package-make-target.txt | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index c91106e8e9..fd5f9e8e7f 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -59,14 +59,28 @@ Additionally, there are some other useful make targets:
 |===================================================
 | command/target    | Description
 
-| +show-depends+    | Displays the dependencies required to build the
+| +show-depends+    | Displays the first order dependencies required to build the
 package
 
+| +show-recursive-depends+ | Recursively displays the dependencies
+  required to build the package
+
+| +show-rdepends+   | Displays the first order reverse dependencies of
+  the package (i.e packages that directly depend on it)
+
+| +show-recursive-rdepends+ | Recursively displays the reverse
+  dependencies of the package (i.e the packages that depend on it,
+  directly or indirectly)
+
 | +graph-depends+   | Generate a dependency graph of the package, in the
 context of the current Buildroot configuration. See
 xref:graph-depends[this section] for more details about dependency
 graphs.
 
+| +graph-rdepends+  | Generate a graph of this package reverse
+  dependencies (i.e the packages that depend on it, directly or
+  indirectly)
+
 | +dirclean+        | Remove the whole package build directory
 
 | +reinstall+       | Re-run the install commands
-- 
2.20.1
