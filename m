From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Mar 2019 11:16:31 +0100
Subject: [Buildroot] [PATCH 3/8 v2] support/graph-depends: also cut on
 host-skeleton
In-Reply-To: <cover.1551608168.git.yann.morin.1998@free.fr>
References: <cover.1551608168.git.yann.morin.1998@free.fr>
Message-ID: <f92a4760d2a7b763e6e8943a4e22bb480191cab0.1551608168.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-skeleton is a dependency of almost all packages, except a very few.
As such, it clutters the dependency graph uselessly.

Do with it as we do for the skeleton: cut the dependency chains.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 5c5de7dd0b..c3e5d83ee8 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -172,7 +172,7 @@ def remove_transitive_deps(pkg, deps):
 
 # List of dependencies that all/many packages have, and that we want
 # to trim when generating the dependency graph.
-MANDATORY_DEPS = ['toolchain', 'skeleton']
+MANDATORY_DEPS = ['toolchain', 'skeleton', 'host-skeleton']
 
 
 # This function removes the dependency on some 'mandatory' package, like the
-- 
2.14.1
