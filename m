From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 21:54:33 +0100
Subject: [Buildroot] [git commit] docs/manual: add section about dependency
	graphs
Message-ID: <20140223213139.1471B96E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e78cc3af5187ed662de2e66939f64248d0c85e14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/common-usage.txt |   52 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 9a8c92a..bef42c6 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -149,3 +149,55 @@ of an ext2 filesystem may be corrupted; or, if you have sparse files in
 your filesystem, those parts may not be all-zeroes when read back). You
 should only use sparse files when handling files on the build machine, not
 when transferring them to an actual device that will be used on the target.
+
+Graphing the dependencies between packages
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+[[graph-depends]]
+
+One of Buildroot's jobs is to know the dependencies between packages,
+and make sure they are built in the right order. These dependencies
+can sometimes be quite complicated, and for a given system, it is
+often not easy to understand why such or such package was brought into
+the build by Buildroot.
+
+In order to help understanding the dependencies, and therefore better
+understand what is the role of the different components in your
+embedded Linux system, Buildroot is capable of generating dependency
+graphs.
+
+To generate a dependency graph of the full system you have compiled,
+simply run:
+
+------------------------
+make graph-depends
+------------------------
+
+You will find the generated graph in
++output/graphs/graph-depends.pdf+.
+
+If your system is quite large, the dependency graph may be too complex
+and difficult to read. It is therefore possible to generate the
+dependency graph just for a given package:
+
+------------------------
+make <pkg>-graph-depends
+------------------------
+
+You will find the generated graph in
++output/graph/<pkg>-graph-depends.pdf+.
+
+Note that the dependency graphs are generated using the +dot+ tool
+from the _Graphviz_ project, which you must have installed on your
+system to use this feature. In most distributions, it is available as
+the +graphviz+ package.
+
+By default, the dependency graphs are generated in the PDF
+format. However, by passing the +GRAPH_OUT+ environment variable, you
+can switch to other output formats, such as PNG, PostScript or
+SVG. All formats supported by the +-T+ option of the +dot+ tool are
+supported.
+
+--------------------------------
+GRAPH_OUT=svg make graph-depends
+--------------------------------
