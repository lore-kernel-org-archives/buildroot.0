From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Jan 2016 13:43:52 +0100
Subject: [Buildroot] [PATCH v2 1/2] manual: minor fixes in the graph-size
	documentation
Message-ID: <1453207433-32589-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Fix some typos and references to a size-stats 'target' (the script is called
'size-stats' but the make target is 'graph-size').

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 docs/manual/common-usage.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index bca99f4..8d0ba63 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -282,7 +282,7 @@ When your target system grows, it is sometimes useful to understand
 how much each Buildroot package is contributing to the overall root
 filesystem size. To help with such an analysis, Buildroot collects
 data about files installed by each package and using this data,
-generates a graph and CSVs files detailing the size contribution of
+generates a graph and CSV files detailing the size contribution of
 the different packages.
 
 To generate these data after a build, run:
@@ -303,9 +303,9 @@ This will generate:
   contribution of each installed file to the package it belongs, and
   to the overall filesystem size.
 
-This +size-stats+ target requires the Python Matplotlib library to be
+This +graph-size+ target requires the Python Matplotlib library to be
 installed (+python-matplotlib+ on most distributions), and also the
-+argpase+ module if you're using a Python version older than 2.7
++argparse+ module if you're using a Python version older than 2.7
 (+python-argparse+ on most distributions).
 
 Just like for the duration graph, a +BR2_GRAPH_OUT+ environment is
@@ -315,7 +315,7 @@ for details about this environment variable.
 .Note
 The collected filesystem size data is only meaningful after a complete
 clean rebuild. Be sure to run +make clean all+ before using +make
-size-stats+.
+graph-size+.
 
 include::eclipse-integration.txt[]
 
-- 
2.4.10
