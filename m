From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 22:01:45 +0100
Subject: [Buildroot] [git commit] docs/manual: add section about build time
	graphing
Message-ID: <20140223213139.1BE7D96E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43f25ee0554fcb799b79aeb55a0403774c1e4ed8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/common-usage.txt |   47 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index bef42c6..76e4023 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -201,3 +201,50 @@ supported.
 --------------------------------
 GRAPH_OUT=svg make graph-depends
 --------------------------------
+
+Graphing the build duration
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+[[graph-duration]]
+
+When the build of a system takes a long time, it is sometimes useful
+to be able to understand which packages are the longest to build, to
+see if anything can be done to speed up the build. In order to help
+such build time analysis, Buildroot collects the build time of each
+step of each package, and allows to generate graphs from these data.
+
+To generate the build time graph after a build, run:
+
+----------------
+make graph-build
+----------------
+
+This will generate a set of files in +output/graphs+ :
+
+* +build.hist-build.pdf+, an histogram of the build time for each
+  package, ordered in the build order.
+
+* +build.hist-duration.pdf+, an histogram of the build time for each
+  package, ordered by duration (longest first)
+
+* +build.hist-name.pdf+, an histogram of the build time for each
+  package, order by package name.
+
+* +build.pie-packages.pdf+, a pie chart of the build time per package
+
+* +build.pie-steps.pdf+, a pie chart of the global time spent in each
+  step of the packages build process.
+
+This +graph-build+ target requires the Python Matplotlib and Numpy
+libraries to be installed (+python-matplotlib+ and +python-numpy+ on
+most distributions), and also the +argparse+ module if you're using a
+Python version older than 2.7 (+python-argparse+ on most
+distributions).
+
+By default, the output format for the graph is PDF, but a different
+format can be selected using the +GRAPH_OUT+ environment variable. The
+only other format supported is PNG:
+
+----------------
+GRAPH_OUT=png make graph-build
+----------------
