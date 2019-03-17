From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 14:35:30 +0100
Subject: [Buildroot] [git commit] support/graph-depends: also cut on
 host-gzip
Message-ID: <20190317144806.9713D8F1DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=132aa296f9f6661095c57464973052a09db178c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When host-gzip is needed, it is a mandatory dependency of all packages.
As such, drawing the dependency lines toward host-gzip would uselessly
clutter the graph.

So, like for the skeleton, host-skeleton, and host-tar, we cut the
dependency chains toward host-gzip.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 3143c61cc4..29134c8237 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -172,7 +172,7 @@ def remove_transitive_deps(pkg, deps):
 
 # List of dependencies that all/many packages have, and that we want
 # to trim when generating the dependency graph.
-MANDATORY_DEPS = ['toolchain', 'skeleton', 'host-skeleton', 'host-tar']
+MANDATORY_DEPS = ['toolchain', 'skeleton', 'host-skeleton', 'host-tar', 'host-gzip']
 
 
 # This function removes the dependency on some 'mandatory' package, like the
