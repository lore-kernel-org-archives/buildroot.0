From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 16:43:13 +0200
Subject: [Buildroot] [git commit] graph-depends: handle the depth argument
	in a more pythonic way
Message-ID: <20140608145131.85A8B9CF1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e347bee02ca7696e17d482f163c999d8d705be7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add some comment as well, enhance help text.

[thanks to Samuel for the hints to make it even more pythonic]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 3560a15..2b46040 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -33,13 +33,15 @@ FULL_MODE = 1
 PKG_MODE  = 2
 
 mode = 0
+
+# Limit drawing the dependency graph to this depth. 0 means 'no limit'.
 max_depth = 0
 
 parser = argparse.ArgumentParser(description="Graph pacakges dependencies")
 parser.add_argument("--package", '-p', metavar="PACKAGE",
                     help="Graph the dependencies of PACKAGE")
-parser.add_argument("--depth", '-d', metavar="DEPTH",
-                    help="Limit the dependency graph to DEPTH levels")
+parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, default=0,
+                    help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
 parser.add_argument("--transitive", dest="transitive", action='store_true',
                     default=True)
 parser.add_argument("--no-transitive", dest="transitive", action='store_false',
@@ -52,8 +54,7 @@ else:
     mode = PKG_MODE
     rootpkg = args.package
 
-if args.depth is not None:
-    max_depth = int(args.depth)
+max_depth = args.depth
 
 transitive = args.transitive
 
