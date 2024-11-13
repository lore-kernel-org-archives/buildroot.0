Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C51D637A4
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 18:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A9F40589;
	Wed, 13 Nov 2024 18:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1hm8oH5X-Ge; Wed, 13 Nov 2024 18:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78CC9405A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78CC9405A2;
	Wed, 13 Nov 2024 18:00:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B7E81ED6
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 18:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D95181422
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 18:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ina4DfhNiWV7 for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 18:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51B3F8141B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51B3F8141B
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 18:00:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D77286348; Wed, 13 Nov 2024 18:00:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 18:59:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e53014bcc8c378b8fd0a69ec9419251730d0cdc8
X-Git-Newrev: 46fa2fcb7a32ef28b1ae9f0ebba01ff1a3c6eacb
X-Patchwork-Hint: ignore
Message-Id: <20241113180008.3D77286348@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.11-rc1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=46fa2fcb7a32ef28b1ae9f0ebba01ff1a3c6eacb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  2 +-
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5094e91b5b..0e27c64ba7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2024.11-rc1, released November 11th, 2024
+2024.11-rc1, released November 13th, 2024
 
 	Fixes all over the tree and package updates.
 
diff --git a/Makefile b/Makefile
index 24fe2f42c5..7b3aa3a020 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.11-git
+export BR2_VERSION := 2024.11-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1725627000
+BR2_VERSION_EPOCH = 1731520600
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index b6e4857b10..42a9d5c243 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2024.08-rc3</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2024.11-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.08-rc3.tar.gz">buildroot-2024.08-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.08-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.11-rc1.tar.gz">buildroot-2024.11-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.11-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.11-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.11-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.08-rc3.tar.xz">buildroot-2024.08-rc3.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.08-rc3.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.11-rc1.tar.xz">buildroot-2024.11-rc1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.11-rc1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 74ea4a2167..02a1acb860 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.11-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 November 2024</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+          <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2024.11-rc1">CHANGES</a>
+          file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+          <a href="/downloads/buildroot-2024.11-rc1.tar.xz">2024.11-rc1
+            release</a>, and report any problems found to the
+          <a href="support.html">mailing list</a> or
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
