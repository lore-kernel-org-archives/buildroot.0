From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  9 May 2014 16:58:24 +0200
Subject: [Buildroot] [PATCH 4/7] graph-depends: document the max_depth
	variable
In-Reply-To: <cover.1399647182.git.yann.morin.1998@free.fr>
References: <cover.1399647182.git.yann.morin.1998@free.fr>
Message-ID: <3bc4c9ae2a0cba55eabe50b430d391d6b8a01851.1399647182.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Although unnecessary (we already have initialisation via the parser),
initialise the max_depth option, and document it at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/graph-depends | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index dd8b549..3bffec0 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -37,6 +37,9 @@ mode = 0
 # Limit drawing the dependency graph to this depth. 0 means 'no limit'.
 max_depth = 0
 
+# Whether to draw the transitive dependencies
+transitive = True
+
 parser = argparse.ArgumentParser(description="Graph pacakges dependencies")
 parser.add_argument("--package", '-p', metavar="PACKAGE",
                     help="Graph the dependencies of PACKAGE")
-- 
1.8.3.2
