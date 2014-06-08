From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jun 2014 16:03:50 +0200
Subject: [Buildroot] [PATCH 6/9] graph-depends: document the 'transitive'
	variable
In-Reply-To: <cover.1402236171.git.yann.morin.1998@free.fr>
References: <cover.1402236171.git.yann.morin.1998@free.fr>
Message-ID: <33d46f82ca02a0c4f1d5696581dc66522c7a0218.1402236171.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Although unnecessary (we already have initialisation via the parser),
initialise the 'transitive' option, and document it at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>

---
Changes v3 -> v4:
  - fix commit log s/max_depth/transitive/  (Thomas)
---
 support/scripts/graph-depends | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 0dafd77..07b9c22 100755
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
