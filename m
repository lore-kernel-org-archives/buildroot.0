From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  1 Oct 2019 18:34:58 +0200
Subject: [Buildroot] [PATCH] support/graph-depends: cut on host-ccache
Message-ID: <20191001163458.25296-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When selected, host-ccache is a dependency of almost all packages.
As such, it clutters the dependency graph uselessly.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/graph-depends | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 3de09b1209..d42bebce9d 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -115,7 +115,7 @@ def remove_transitive_deps(pkg, deps):
 
 # List of dependencies that all/many packages have, and that we want
 # to trim when generating the dependency graph.
-MANDATORY_DEPS = ['toolchain', 'skeleton', 'host-skeleton', 'host-tar', 'host-gzip']
+MANDATORY_DEPS = ['toolchain', 'skeleton', 'host-skeleton', 'host-tar', 'host-gzip', 'host-ccache']
 
 
 # This function removes the dependency on some 'mandatory' package, like the
-- 
2.20.1
