From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 16:43:36 +0200
Subject: [Buildroot] [git commit] manual: document the new graph-depends
	options
Message-ID: <20140608145131.A86FB9CB8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c67423c331333a0c94fbe6af8658dda0ffef967e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/common-usage.txt |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 16a1351..eb83990 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -94,6 +94,8 @@ to +make+ or set in the environment:
   default), or +png+.
 * +BR2_GRAPH_DEPS_OPTS+ to pass extra options to the dependency graph; see
   xref:graph-depends[] for the accepted options
+* +BR2_GRAPH_DOT_OPTS+ is passed verbatim as options to the +dot+ utility to
+  draw the dependency graph.
 
 An example that uses config files located in the toplevel directory and
 in your $HOME:
@@ -204,8 +206,15 @@ The +graph-depends+ behaviour can be controlled by setting options in the
 * +--depth N+, +-d N+, to limit the dependency depth to +N+ levels. The
   default, +0+, means no limit.
 
+* +--transitive+, +--no-transitive+, to draw (or not) the transitive
+  dependencies. The default is to draw transitive dependencies.
+
+* +--colours R,T,H+, the comma-separated list of colours to draw the
+  root package (+R+), the target packages (+T+) and the host packages
+  (+H+). Defaults to: +lightblue,grey,gainsboro+
+
 --------------------------------
-BR2_GRAPH_DEPS_OPTS='-d 3' make graph-depends
+BR2_GRAPH_DEPS_OPTS='-d 3 --no-transitive --colours=red,green,blue' make graph-depends
 --------------------------------
 
 === Graphing the build duration
