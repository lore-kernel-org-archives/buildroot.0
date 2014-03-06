From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 18:26:12 +0100
Subject: [Buildroot] [git commit] manual: contributing: move and expand
	autobuild section
Message-ID: <20140306172752.E05A89BDCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7d5d9717311c29cd67668e8ea9b8c192cccdc83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch moves the section about autobuild fixing up, and expands it with
more details about what autobuilds are, and how you can help with it.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt |   63 ++++++++++++++++++++++++++++++++------------
 1 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 44e155f..d4056a3 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -33,6 +33,52 @@ help in reproducing, analyzing and fixing reported bugs is more than
 welcome. Don't hesitate to add a comment to bug reports reporting your
 findings, even if you don't yet see the full picture.
 
+Analyzing and fixing autobuild failures
+---------------------------------------
+
+The Buildroot autobuilders are a set of build machines that continuously
+run Buildroot builds based on random configurations. This is done for
+all architectures supported by Buildroot, with various toolchains, and
+with a random selection of packages. With the large commit activity on
+Buildroot, these autobuilders are a great help in detecting problems
+very early after commit.
+
+All build results are available at http://autobuild.buildroot.org[],
+statistics are at http://autobuild.buildroot.org/stats.php[]. Every day,
+an overview of all failed packages is sent to the mailing list.
+
+Detecting problems is great, but obviously these problems have to be
+fixed as well. Your contribution is very welcome here! There are
+basically two things that can be done:
+
+- Analyzing the problems. The daily summary mails do not contain details
+  about the actual failures: in order to see what's going on you have to
+  open the build log and check the last output. Having someone doing
+  this for all packages in the mail is very useful for other developers,
+  as they can make a quick initial analysis based on this output alone.
+
+- Fixing a problem. When fixing autobuild failures, you should follow
+  these steps:
+  . Check if you can reproduce the problem by building with the same
+    configuration. You can do this manually, or use the
+    http://git.buildroot.org/buildroot-test/tree/utils/br-reproduce-build[br-reproduce-build]
+    script that will automatically clone a Buildroot git repository,
+    checkout the correct revision, download and set the right
+    configuration, and start the build.
+  . Analyze the problem and create a fix.
+  . Verify that the problem is really fixed by starting from a clean
+    Buildroot tree and only applying your fix.
+  . Send the fix to the Buildroot mailing list (see
+    xref:submitting-patches[]). In case you created a patch against the
+    package sources, you should also send the patch upstream so that the
+    problem will be fixed in a later release, and the patch in Buildroot
+    can be removed.
+    In the commit message of a patch fixing an autobuild failure, add a
+    reference to the build result directory, as follows:
+---------------------
+Fixes http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
+---------------------
+
 [[submitting-patches]]
 Submitting patches
 ------------------
@@ -210,23 +256,6 @@ Buildroot's Patchwork website can be used to pull in patches for testing
 purposes. Please see xref:apply-patches-patchwork[] for more
 information on using Buildroot's Patchwork website to apply patches.
 
-Autobuild
----------
-
-The Buildroot community is currently setting up automatic builds in
-order to test more and more configurations. All build results are
-available at http://autobuild.buildroot.org[]
-
-A good way to contribute is by fixing broken builds.
-
-In the commit message of a patch fixing an _autobuild_, add a
-reference to the _build result directory_ (the +dir+ link in the _data
-column_):
-
----------------------
-Fixes http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
----------------------
-
 [[reporting-bugs]]
 Reporting issues/bugs, get help
 -------------------------------
