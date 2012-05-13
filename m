From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 13 May 2012 12:38:21 +0200
Subject: [Buildroot] [PATCH v2 11/11] manual: add contribute.txt
In-Reply-To: <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
References: <4FAEEFA8.2070005@mind.be>
 <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1336905501-9757-12-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel MARTIN <s.martin49@gmail.com>


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 docs/manual/contribute.txt

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
new file mode 100644
index 0000000..d80e79a
--- /dev/null
+++ b/docs/manual/contribute.txt
@@ -0,0 +1,63 @@
+Contibuting to Buildroot
+========================
+
+If you want to contribute to Buildroot, you will need a git view of
+the project. Refer to xref:getting-buildroot[] to get it.
+
+Currently, the mailing list is the central place for contribution.
+If you have not already subscribe to it, then refer to
+xref:mailing-list-subscribe[].
+
+Submiting patches
+-----------------
+
+When your changes are done, and commited in your local git view,
+_rebase_ your development branch on top of the upstream tree before
+generating the patch set. To do so, run:
+
+---------------------
+ $ git fetch --all --tags
+ $ git rebase origin/master
+---------------------
+
+Here, your are ready to generate then submit your patch set.
+
+To generate it, run:
+
+---------------------
+ $ git format-patch -M -n -s -o outgoing origin/master
+---------------------
+
+This will generate patch files in the +outgoing+ subdirectory,
+automatically adding the +signed-of-by+ line.
+
+If you want to present the whole patch set in a separate mail, add
++--cover-letter --summary+ to the previous command line (+man
+git-format-patch+ for further information).
+
+Once patch files are generated, you can review/edit the commit message
+before submitting them using your favourite text editor.
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
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index b23e9c1..3e7a7ef 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -27,6 +27,8 @@ include::developer-guide.txt[]
 
 include::get-involved.txt[]
 
+include::contribute.txt[]
+
 include::legal-notice.txt[]
 
 
-- 
1.7.10.2
