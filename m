From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:59:54 +0100
Subject: [Buildroot] [git commit] manual: add contribute.txt
Message-ID: <20121115230540.E335799E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a79a54a0e7effdc1f06caa01a5441ffbf2ad554b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/contribute.txt   |  126 ++++++++++++++++++++++++++++++++++++++++++
 docs/manual/get-involved.txt |    3 +
 docs/manual/manual.txt       |    2 +
 3 files changed, 131 insertions(+), 0 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
new file mode 100644
index 0000000..ddf790d
--- /dev/null
+++ b/docs/manual/contribute.txt
@@ -0,0 +1,126 @@
+// -*- mode:doc; -*-
+
+Contibuting to Buildroot
+========================
+
+If you want to contribute to Buildroot, you will need a git view of
+the project. Refer to xref:getting-buildroot[] to get it.
+
+Currently, the mailing list is the central place for contribution.
+If you have not already subscribed to it, then refer to
+xref:mailing-list-subscribe[].
+
+Recently, a web interface is also used to manage patches sent to the
+mailing list, see xref:patchwork[].
+
+[NOTE]
+_Please, do not attach patches to bugs, send them to the mailing list
+instead_ (see xref:submitting-patches[]).
+
+[[submitting-patches]]
+Submitting patches
+------------------
+
+When your changes are done, and committed in your local git view,
+_rebase_ your development branch on top of the upstream tree before
+generating the patch set. To do so, run:
+
+---------------------
+ $ git fetch --all --tags
+ $ git rebase origin/master
+---------------------
+
+Here, you are ready to generate then submit your patch set.
+
+To generate it, run:
+
+---------------------
+ $ git format-patch -M -n -s -o outgoing origin/master
+---------------------
+
+This will generate patch files in the +outgoing+ subdirectory,
+automatically adding the +signed-off-by+ line.
+
+If you want to present the whole patch set in a separate mail, add
++--cover-letter --summary+ to the previous command line (+man
+git-format-patch+ for further information).
+
+Once patch files are generated, you can review/edit the commit message
+before submitting them using your favorite text editor.
+
+Lastly, send/submit your patch set to the Buildroot mailing list:
+
+---------------------
+ $ git send-email --to buildroot at busybox.net outgoing/*
+---------------------
+
+Note that +git+ should be configured to use your mail account.
+To configure +git+, see +man git-send-email+ or google it.
+
+Make sure posted *patches are not line-wrapped*, otherwise it cannot
+easily be applied. In such a case, fix your e-mail client, or better,
+use +git send-email+ to send your patches.
+
+Reviewing/Testing patches
+-------------------------
+
+In the review process, do not hesitate to respond to patch submissions
+for remarks, suggestions or anything that will help everyone to
+understand the patches and make them better.
+
+Some tags are used to help following the state of any patch posted on
+the mailing-list:
+
+Acked-by:: Indicates that the patch can be committed.
+
+Tested-by:: Indicates that the patch has been tested. It is useful
+  but not necessary to add a comment about what has been tested.
+
+Autobuild
+---------
+
+The Buildroot community is currently setting up automatic build i
+order to test more and more configuration. All build results are
+available at http://autobuild.buildroot.org[]
+
+A way to contribute is fixing broken builds.
+
+In the commit message of a patch fixing an _autobuild_, add a
+reference to the _build result directory_ (the +dir+ link in the _data
+column_):
+
+---------------------
+Fixes http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
+---------------------
+
+[[reporting-bugs]]
+Reporting issues/bugs, get help
+-------------------------------
+
+Before reporting some issues, please chek
+xref:mailing-list-subscribe[the mailing list archive] in case someone had
+already reported and fixed a similar problem.
+
+Whatever the way you choose to report some bugs or get help,
+xref:bugtracker[opening a bug] or
+xref:mailing-list-subscribe[send a mail to the mailing list], there is
+a number of detail to provide in order to help people reproduce and
+find a solution to the issue.
+
+Try to think as you would be the one who will help someone else; in
+that case, what would you need?
+
+Here is a short list of details to provide in such case:
+
+* host machine (OS/release)
+* version of Buildroot
+* target for which the build fails
+* package(s) which the build fails
+* the command that fails and its output
+* any information you think that may be relevant
+
+Additionnally, your can add the +.config+ file.
+
+If some of these details are too large, do not hesitate to use some
+pastebin service (see
+http://en.wikipedia.org/wiki/Comparison_of_pastebins[]).
diff --git a/docs/manual/get-involved.txt b/docs/manual/get-involved.txt
index 566516b..3a00b1e 100644
--- a/docs/manual/get-involved.txt
+++ b/docs/manual/get-involved.txt
@@ -61,11 +61,14 @@ http://patchwork.buildroot.org[].
 All patches and comments sent through the mailing list are
 automatically indexed in http://patchwork.buildroot.org[patchwork].
 
+[[bugtracker]]
 Bugtracker
 ----------
 
 The Buildroot bugtracker is at https://bugs.busybox.net[].
 
+To open a bug, see xref:reporting-bugs[].
+
 Buildroot wikipage
 ------------------
 
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 3331cbf..4032a6b 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -25,4 +25,6 @@ include::developer-guide.txt[]
 
 include::get-involved.txt[]
 
+include::contribute.txt[]
+
 include::appendix.txt[]
