From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:13:09 +0200
Subject: [Buildroot] [git commit] docs/manual: add section about size
	graphing
Message-ID: <20151017141353.43AE07FDF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10f7a256a3e2f22f679d0d06cc6b9b6503dfdc80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Document the new graph-size target and its possibilities.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/common-usage.txt |   41 +++++++++++++++++++++++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 5b27b1f..3ae05c7 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -273,6 +273,47 @@ only other format supported is PNG:
 BR2_GRAPH_OUT=png make graph-build
 ----------------
 
+=== Graphing the filesystem size contribution of packages
+
+When your target system grows, it is sometimes useful to understand
+how much each Buildroot package is contributing to the overall root
+filesystem size. To help with such an analysis, Buildroot collects
+data about files installed by each package and using this data,
+generates a graph and CSVs files detailing the size contribution of
+the different packages.
+
+To generate these data after a build, run:
+
+----------------
+make graph-size
+----------------
+
+This will generate:
+
+* +output/graphs/graph-size.pdf+, a pie chart of the contribution of
+  each package to the overall root filesystem size
+
+* +output/graphs/package-size-stats.csv+, a CSV file giving the size
+  contribution of each package to the overall root filesystem size
+
+* +output/graphs/file-size-stats.csv+, a CSV file giving the size
+  contribution of each installed file to the package it belongs, and
+  to the overall filesystem size.
+
+This +size-stats+ target requires the Python Matplotlib library to be
+installed (+python-matplotlib+ on most distributions), and also the
++argpase+ module if you're using a Python version older than 2.7
+(+python-argparse+ on most distributions).
+
+Just like for the duration graph, a +BR2_GRAPH_OUT+ environment is
+supported to adjust the output file format. See xref:graph-depends[]
+for details about this environment variable.
+
+.Note
+The collected filesystem size data is only meaningful after a complete
+clean rebuild. Be sure to run +make clean all+ before using +make
+size-stats+.
+
 include::eclipse-integration.txt[]
 
 include::advanced.txt[]
