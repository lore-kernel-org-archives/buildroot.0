Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C52C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 20:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E10640BF6;
	Wed, 28 May 2025 20:08:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCa3d-czlGXJ; Wed, 28 May 2025 20:08:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC41140BDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC41140BDD;
	Wed, 28 May 2025 20:08:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9428BB66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 829B040589
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCzn4qf9jcCz for <buildroot@buildroot.org>;
 Wed, 28 May 2025 20:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEADC4031D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEADC4031D
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:08:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7DB7876DF; Wed, 28 May 2025 20:08:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 May 2025 22:05:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fc34cea2e1fe1edeeb29005d61a25f03f50eeb5
X-Git-Newrev: 1bdb79ba786c2043b080fe4a7ec1a2dfa9e4e1bb
X-Patchwork-Hint: ignore
Message-Id: <20250528200802.A7DB7876DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2025.05-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=1bdb79ba786c2043b080fe4a7ec1a2dfa9e4e1bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 14 ++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0f36dc70a1..aff62f7a68 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,17 @@
+2025.05-rc2, released May 28th, 2025
+
+	Fixes all over the tree.
+
+        Defconfigs: imx8mn-bsh-smm-s2: Unbreak boot after move to
+        U-Boot 2025.04.
+
+	Updated/fixed packages: assimp, atkmm, atkmm2_28, binutils,
+	casync-nano, esp-hosted, gmrender-resurrect, gtkmm3, kmsxx,
+	libcamera, libglade, linux, lzo, python-click, python-django,
+	python-flask-restx, python-pydantic, python-pydantic-core,
+	python-referencing, python-tornado, sane-airscan, systemd,
+	uacme, uuu
+
 2025.05-rc1, released May 19th, 2025
 
 	Fixes all over the tree and package updates.
diff --git a/Makefile b/Makefile
index c14023fd98..f90b834ed2 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.05-rc1
+export BR2_VERSION := 2025.05-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1747650000
+BR2_VERSION_EPOCH = 1748462400
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 5e04c347c3..5a2af8aff2 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 -->
-      <h3 style="text-align: center;">Latest release candidate: <b>2025.05-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2025.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2025.05-rc1.tar.gz">buildroot-2025.05-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.05-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.05-rc2.tar.gz">buildroot-2025.05-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.05-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2025.05-rc1.tar.xz">buildroot-2025.05-rc1.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.05-rc1.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.05-rc2.tar.xz">buildroot-2025.05-rc2.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.05-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 6d638c889e..dfc10020ad 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.05-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 May 2025</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05-rc2/CHANGES">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.05-rc2.tar.xz">2025.05-rc2
+	  release</a>, and report any problems found to the
+         <a href="support.html">mailing list</a> or
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
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
