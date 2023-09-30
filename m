Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A96E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06E0583DC2;
	Sat, 30 Sep 2023 13:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E0583DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ObIOl6HvjeYB; Sat, 30 Sep 2023 13:56:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7EBF83DB6;
	Sat, 30 Sep 2023 13:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7EBF83DB6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D63C91BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFAAC60E09
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFAAC60E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m9oGQcQZBPqf for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:56:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C99F560D90
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C99F560D90
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4D8483A25; Sat, 30 Sep 2023 13:56:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 15:55:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72c9362103b2f5157b82249280d7250a80db592c
X-Git-Newrev: ea8fc3182797e3691705a9c45e83a16496367904
X-Patchwork-Hint: ignore
Message-Id: <20230930135603.B4D8483A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: simplify section on Git repo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ea8fc3182797e3691705a9c45e83a16496367904
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the snapshot tarball section is gone, the "Source code" block
has only one sub-block "Repository" which makes it look odd. So bring
the sub-block content into the parent block, and rename this parent
block "Git repository".

As this requires re-indenting the whole HTML soup, take advantage of
this to use <p>...</p> in a more correct manner.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: fix "git pull" layout]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/website/download.html | 76 +++++++++++++++++++---------------------------
 1 file changed, 32 insertions(+), 44 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 91ad4c7547..af39ddc9eb 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -116,53 +116,41 @@
   </div>
 
   <div class="panel panel-primary">
-    <div class="panel-heading">Source code</div>
+    <div class="panel-heading">Git repository</div>
     <div class="panel-body">
 
-      <div class="row">
-	<div class="col-sm-7">
-	  <div class="panel panel-success">
-	    <div class="panel-heading">Repository</div>
-	    <div class="panel-body">
-	      <P>The buildroot repository can be browsed online at
-		<a href="https://gitlab.com/buildroot.org/buildroot/">https://gitlab.com/buildroot.org/buildroot/</a>.
-		To grab a copy of the repository use</p>
-
-
-	      <div class="input-group" style="width: 100%;">
-		<input class="form-control" style="width: 85%;" id="giturl"
-		       value="git clone https://gitlab.com/buildroot.org/buildroot.git" type="text" readonly></input>
-		<span class="input-group-button">
-		  <button class="btn pull-right" type="button" data-clipboard-target="#giturl"
-			  data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="Copied!">
-		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
-		  </button>
-		</span>
-	      </div><br>
-
-	      <p>
-
-		If you are not already familiar with using Git, we recommend you visit <a
-											  href="http://git-scm.org">the Git website</a>.
-
-	      <p>
-
-		Once you've checked out a copy of the source tree, you can update your source
-		tree at any time so it is in sync with the latest and greatest by entering your
-		buildroot directory and running the command:
-
-<pre>
-git pull
-</pre>
-
-		Because you've only been granted anonymous access to the tree, you won't be
-		able to push your changes to the repo. Changes can instead be submitted for
-		inclusion by posting them to the buildroot mailing list.
-	    </div>
-	  </div>
-	</div>
+      <p>The buildroot repository can be browsed online at
+	<a href="https://gitlab.com/buildroot.org/buildroot/">https://gitlab.com/buildroot.org/buildroot/</a>.</p>
+
+      <p>To grab a copy of the repository use</p>
+
+      <div class="input-group" style="width: 100%;">
+	<input class="form-control" style="width: 85%;" id="giturl"
+	       value="git clone https://gitlab.com/buildroot.org/buildroot.git" type="text" readonly></input>
+	<span class="input-group-button">
+	  <button class="btn pull-right" type="button" data-clipboard-target="#giturl"
+		  data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="Copied!">
+	    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
+	  </button>
+	</span>
+      </div><br>
+
+      <p>If you are not already familiar with using Git, we recommend
+	you visit <a href="http://git-scm.org">the Git
+	website</a>.</p>
+
+      <p>Once you've checked out a copy of the source tree, you can
+	update your source tree at any time so it is in sync with the
+	latest and greatest by entering your buildroot directory and
+	running the command:</p>
+
+      <pre>git pull</pre>
+
+      <p>Because you've only been granted anonymous access to the
+	tree, you won't be able to push your changes to the
+	repo. Changes can instead be submitted for inclusion by
+	posting them to the buildroot mailing list.</p>
 
-      </div>
     </div>
   </div>
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
