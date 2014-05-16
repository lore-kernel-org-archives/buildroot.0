From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 May 2014 23:05:17 +0200
Subject: [Buildroot] [PATCH 5/8] graph-depends: document the max_depth
	variable
In-Reply-To: <cover.1400273945.git.yann.morin.1998@free.fr>
References: <cover.1400273945.git.yann.morin.1998@free.fr>
Message-ID: <77ef0e4acd2da331895bf92aa03593bb284dbe62.1400273945.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Although unnecessary (we already have initialisation via the parser),
initialise the max_depth option, and document it at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 support/scripts/graph-depends | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index c3dcbf1..dc6b98f 100755
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
