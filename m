Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB0CCE7B08
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 13:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC85A80C75;
	Fri,  6 Sep 2024 13:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2ad80_Swuqz; Fri,  6 Sep 2024 13:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C23F980D50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C23F980D50;
	Fri,  6 Sep 2024 13:01:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E98A1BF3F7
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 13:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 894C980D50
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 13:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRGe0lhxxfEX for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 13:01:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3725280C75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3725280C75
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 13:01:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21C9186EB1; Fri,  6 Sep 2024 13:01:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Sep 2024 15:01:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87bdffd543a1e52ea2cfe6b67618e310bcd96a52
X-Git-Newrev: 769d71ae84c7a3d43ee92a1d126b2937713cc811
X-Patchwork-Hint: ignore
Message-Id: <20240906130156.21C9186EB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.08
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

commit: https://git.buildroot.net/buildroot/commit/?id=769d71ae84c7a3d43ee92a1d126b2937713cc811
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 15 +++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index fd4851be57..544931921b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,18 @@
+2024.08, released September 6th, 2024
+
+	Various fixes.
+
+        Fixed defconfigs: imx8mqevk: Bump TF-A, U-Boot and Linux to
+        fix build with gcc 13.x
+
+	Removed defconfigs: pandaboard
+
+	Updated/fixed packages: aer-inject, arm-trusted-firmware,
+	armadillo, babeld, cache-calibrator, clamav, fbdump, gerbera,
+	libgtk4, libopenssl, mender, p910nd, tllist, wpa_supplicant
+
+        Removed packages: midori
+
 2024.08-rc3, released September 1st, 2024
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 50cfbcbcf4..43730c02b2 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.08-rc3
+export BR2_VERSION := 2024.08
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1725220000
+BR2_VERSION_EPOCH = 1725627000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index dd3327577d..60b84cc941 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,37 +42,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2024.05.2</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2024.08</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.05.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.05.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2024.05.2.tar.gz">buildroot-2024.05.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.05.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.08.tar.gz">buildroot-2024.08.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.08.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.05.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.05.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.05.2.tar.xz">buildroot-2024.05.2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.05.2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.08.tar.xz">buildroot-2024.08.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.08.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index f43881614a..c09db758a6 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.08 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 September 2024</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2024.08 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2024.08">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.08.tar.xz">2024.08 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 1f4c1b85e2..2251a992dc 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.05.2'
+RELEASE='2024.08'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
