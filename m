From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Dec 2018 10:04:39 +0100
Subject: [Buildroot] [PATCH 07/11] support/graph-depends: also cut on
 host-tar
In-Reply-To: <cover.1543741464.git.yann.morin.1998@free.fr>
References: <cover.1543741464.git.yann.morin.1998@free.fr>
Message-ID: <930f15e91d1ff70c76a7cead98edef8adfe16f01.1543741464.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When host-tar is needed, it is a mandatory dependency of all packages.
As such, drawing the dependency lines toward host-tar would uselessly
clutter the graph.

So, like for the skeleton and host-skeleton, we cut the dependency chains
toward host-tar.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.14.1
