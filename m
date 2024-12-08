Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C866DE77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 10:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A93D81193;
	Sun,  8 Dec 2024 10:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5Bn2FD3xCi5; Sun,  8 Dec 2024 10:18:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27CBE81184
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27CBE81184;
	Sun,  8 Dec 2024 10:18:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7FD56F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 10:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7585340647
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 10:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxf76bM8Ln6a for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 10:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1BA440636
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1BA440636
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 10:18:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A396F86B55; Sun,  8 Dec 2024 10:18:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Dec 2024 11:18:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6561a5d773d8e159556e2b911b315e3b5a0b89b1
X-Git-Newrev: 8f9ce0c913bc00127126456df89379daf9c1e03a
X-Patchwork-Hint: ignore
Message-Id: <20241208101835.A396F86B55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f9ce0c913bc00127126456df89379daf9c1e03a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 11 +++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6951720a8b..cf49ce56b3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,14 @@
+2024.11, released December 8th, 2024
+
+	Various fixes.
+
+	Updated/fixed packages: eza, foot, gnutls, ibm-sw-tpm2,
+	mosquitto, pixman
+
+	Issues resolved:
+        - procps-ng: builderror in 2024.08
+          https://gitlab.com/buildroot.org/buildroot/-/issues/38
+
 2024.11-rc3, released Decemmber 5th, 2024
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 2787cd38fc..764148f715 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.11-rc3
+export BR2_VERSION := 2024.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1733418000
+BR2_VERSION_EPOCH = 1733653000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 9be40f5d58..3dd4351e1e 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,40 +42,40 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2024.08.2</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2024.11</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.08.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.08.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2024.08.2.tar.gz">buildroot-2024.08.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.08.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.11.tar.gz">buildroot-2024.11.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.11.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.08.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.11.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.08.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.11.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.08.2.tar.xz">buildroot-2024.08.2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.08.2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.11.tar.xz">buildroot-2024.11.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.11.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2024.11-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2024.11-rc3.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 103e77650a..c646f1c37a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.11 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 December 2024</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2024.11 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11/CHANGES">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.11.tar.xz">2024.11 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index c3cb15d727..00592a7839 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.08.2'
+RELEASE='2024.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
