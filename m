Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EF6C7EE25
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 21:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BDA940993;
	Wed,  7 Jun 2023 21:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BDA940993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Muzmq1kedOpd; Wed,  7 Jun 2023 21:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DD91403C4;
	Wed,  7 Jun 2023 21:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DD91403C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F29E91BF95E
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 21:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAE1041DE5
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 21:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAE1041DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2EyuX8zzrkEM for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 21:08:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7959D41D74
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 21:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7959D41D74
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61DE086D82; Wed,  7 Jun 2023 21:08:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Jun 2023 23:07:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17393a78e53a3b56aa0416369604ccb1dde414ef
X-Git-Newrev: dbb0b4274cdbd74cf22fb4da4c1e43084f3d3125
X-Patchwork-Hint: ignore
Message-Id: <20230607210807.61DE086D82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.05
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbb0b4274cdbd74cf22fb4da4c1e43084f3d3125
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 14 ++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 26 +++++++++++++-------------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 48 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1f540b8f4b..fec806a215 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,17 @@
+2023.05, released June 7th, 2023
+
+	Fixes all over the tree.
+
+	Infrastructure: Add BR2_HOST_CMAKE_AT_LEAST_* for packages
+	needing a newer host-cmake than what is currently enforced
+	(3.18) - Up to the version provided by the cmake package (3.22).
+
+	Defconfigs: QEMU s390x: Bump rootfs size to 120MB to make room
+	for kernel modules.
+
+	Updated/fixed packages: at-spi2-core, go, libdeflate, libjxl,
+	perl-http-message, php, redis
+
 2023.05-rc3, released June 4th, 2023
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index ce2f34dc5e..3187791d9b 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.05-rc3
+export BR2_VERSION := 2023.05
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1685877000
+BR2_VERSION_EPOCH = 1686172000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 5e9280626d..2af7db1861 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,7 +8,7 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable / long term support release: <b>2023.02.1</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2023.02.1</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -41,41 +41,41 @@
 	  <p><a href="/downloads/buildroot-2023.02.1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest stable release: <b>2022.11.2</b></h3>
+
+      <h3 style="text-align: center;">Latest stable release: <b>2023.05</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2022.11.2.tar.gz">buildroot-2022.11.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.11.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.05.tar.gz">buildroot-2023.05.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.05.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.11.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.11.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.11.2.tar.xz">buildroot-2022.11.2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.11.2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.05.tar.xz">buildroot-2023.05.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.05.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2023.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2023.05-rc3.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 7523bc57d9..32e9273215 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.05 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>7 June 2023</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2023.05 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.05">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.05.tar.xz">2023.05 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index d1b75ed405..eaac13e32b 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.02.1'
+RELEASE='2023.05'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
