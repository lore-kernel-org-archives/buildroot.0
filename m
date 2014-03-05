From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Mar 2014 17:24:29 +0100
Subject: [Buildroot] [PATCH 3 of 8] manual: contributing: move and expand
	autobuild section
In-Reply-To: <patchbomb.1394036666@argentina>
References: <patchbomb.1394036666@argentina>
Message-ID: <c4b2d44a034a256298c8.1394036669@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch moves the section about autobuild fixing up, and expands it with
more details about what autobuilds are, and how you can help with it.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/contribute.txt |  59 +++++++++++++++++++++++++++++------------
 1 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -33,6 +33,48 @@ help in reproducing, analyzing and fixin
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
+    configuration.
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
@@ -210,23 +252,6 @@ Buildroot's Patchwork website can be use
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
