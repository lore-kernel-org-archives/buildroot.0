From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 09:17:58 +0200
Subject: [Buildroot] [git commit] docs/manual: add new section about the
	DEVELOPERS file and get-developer
Message-ID: <20160921071839.DFEE48225B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=589cbc61b0913891fd00019365e52b9e50ff7250
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: tweak wording and add xref as suggested by Arnout]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt | 11 +++++++++--
 docs/manual/developers.txt | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 docs/manual/manual.txt     |  2 ++
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index d4ec2e1..c2c8a90 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -258,6 +258,12 @@ removed, preferably with the upstream commit ID. Also any other
 required changes should be explained explicitly, like configure
 options that no longer exist or are no longer needed.
 
+If you are interested in getting notified of build failures and of
+further changes in the packages you added or modified, please add
+yourself to the DEVELOPERS file. This should be done in a separate
+patch of the series. See xref:DEVELOPERS[the DEVELOPERS file] for more
+information.
+
 ==== Preparing a patch series
 
 Starting from the changes committed in your local git view, _rebase_
@@ -284,8 +290,9 @@ Once patch files are generated, you can review/edit the commit message
 before submitting them, using your favorite text editor.
 
 Buildroot provides a handy tool to know to whom your patches should be
-sent, called +get-developers+. This tool reads your patches and
-outputs the appropriate +git send-email+ command to use:
+sent, called +get-developers+ (see xref:DEVELOPERS[] for more
+information). This tool reads your patches and outputs the appropriate
++git send-email+ command to use:
 
 ---------------------
 $ ./support/scripts/get-developers outgoing/*
diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
new file mode 100644
index 0000000..ea1f894
--- /dev/null
+++ b/docs/manual/developers.txt
@@ -0,0 +1,46 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[DEVELOPERS]]
+== DEVELOPERS file and get-developers
+
+The main Buildroot directory contains a file named +DEVELOPERS+ that
+list the developers involved with various areas of Buildroot. Thanks to
+this file, the +get-developer+ tool allows to:
+
+- Calculate the list of developers to whom patches should be sent, by
+  parsing the patches and matching the modified files with the
+  relevant developers. See xref:submitting-patches[] for details.
+
+- Find which developers are taking care of a given architecture or
+  package, so that they can be notified when a build failure occurs on
+  this architecture or package. This is done in interaction with
+  Buildroot's autobuild infrastructure.
+
+We ask developers adding new packages, new boards, or generally new
+functionality in Buildroot, to register themselves in the +DEVELOPERS+
+file. As an example, we expect a developer contributing a new package
+to include in his patch the appropriate modification to the
++DEVELOPERS+ file.
+
+The +DEVELOPERS+ file format is documented in detail inside the file
+itself.
+
+The +get-developer+ tool, located in +support/scripts+ allows to use
+the +DEVELOPERS+ file for various tasks:
+
+- When passing one or several patches as command line argument,
+  +get-developer+ will return the appropriate +git send-email+
+  command.
+
+- When using the +-a <arch>+ command line option, +get-developer+ will
+  return the list of developers in charge of the given architecture.
+
+- When using the +-p <package>+ command line option, +get-developer+
+  will return the list of developers in charge of the given package.
+
+- When using the +-c+ command line option, +get-developer+ will look
+  at all files under version control in the Buildroot repository, and
+  list the ones that are not handled by any developer. The purpose of
+  this option is to help completing the +DEVELOPERS+ file.
+
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 3c531e3..7630ea6 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -64,6 +64,8 @@ include::debugging-buildroot.txt[]
 
 include::contribute.txt[]
 
+include::developers.txt[]
+
 = Appendix
 
 include::appendix.txt[]
