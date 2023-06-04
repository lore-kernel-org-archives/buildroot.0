Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A39DC7EE23
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 11:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3E7641B92;
	Sun,  4 Jun 2023 11:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3E7641B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TsTxd10iua5b; Sun,  4 Jun 2023 11:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 549A441B87;
	Sun,  4 Jun 2023 11:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 549A441B87
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B91201BF2B1
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 11:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 909CF41B87
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 11:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 909CF41B87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnKuyvOKspv8 for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 11:11:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F1A141B77
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 11:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F1A141B77
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27DC886B16; Sun,  4 Jun 2023 11:11:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Jun 2023 13:10:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb940ab43d6ec8b0703182fd491e3ef9c57acc6e
X-Git-Newrev: 25e485f462b7459dda6793d7eaa385c8617febff
X-Patchwork-Hint: ignore
Message-Id: <20230604111152.27DC886B16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.05-rc3
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

commit: https://git.buildroot.net/buildroot/commit/?id=25e485f462b7459dda6793d7eaa385c8617febff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 12 ++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index b0875759ff..1f540b8f4b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,15 @@
+2023.05-rc3, released June 4th, 2023
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: bird, containerd, earlyoom, gcc,
+	ipython, kexec, kodi-skin-confluence, libcurl, libopenssl,
+	mesa3d, minidlna, mpd, openjdk, openjdk-bin,
+	python-matplotlib, sdl2_net, vdr
+
+	New packages: python-asttokens, python-executing,
+	python-pure-eval, python-stack-data
+
 2023.05-rc2, released May 28th, 2023
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 2e1eff2f3c..ce2f34dc5e 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.05-rc2
+export BR2_VERSION := 2023.05-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1685305000
+BR2_VERSION_EPOCH = 1685877000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 75b445d069..5e9280626d 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 -->
-      <h3 style="text-align: center;">Latest release candidate: <b>2023.05-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2023.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.05-rc2.tar.gz">buildroot-2023.05-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.05-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.05-rc3.tar.gz">buildroot-2023.05-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.05-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.05-rc2.tar.xz">buildroot-2023.05-rc2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.05-rc2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.05-rc3.tar.xz">buildroot-2023.05-rc3.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.05-rc3.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 28d0b83952..7523bc57d9 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.05-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 June 2023</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2023.05-rc3 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.05-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.05-rc3.tar.xz">2023.05-rc3
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
