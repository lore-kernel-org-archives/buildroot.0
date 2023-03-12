Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A7AC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 20:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E14F409EB;
	Sun, 12 Mar 2023 20:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E14F409EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QlhZobR_Zqhd; Sun, 12 Mar 2023 20:22:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C391840A05;
	Sun, 12 Mar 2023 20:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C391840A05
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20A981BF4E3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 20:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF91840106
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 20:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF91840106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LdoU2axFxI_T for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 20:22:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3C77400F1
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 20:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3C77400F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFBC086FBA; Sun, 12 Mar 2023 20:22:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 21:20:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1807ef104904912472191114f274042a9cfc9d20
X-Git-Newrev: 8cca1e6de1c69a0a5e876116906bb3f6da4a5bd5
X-Patchwork-Hint: ignore
Message-Id: <20230312202249.BFBC086FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.02
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

commit: https://git.buildroot.net/buildroot/commit/?id=8cca1e6de1c69a0a5e876116906bb3f6da4a5bd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 18 ++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 21 +++++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 53 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 49cf96a853..a03a4876b8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2023.02, released March 12th, 2023
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: ace, apache, audit, bridge-utils,
+	docker-engine, go, gtkmm3, janet, libbpf, libev, libgcrypt,
+	libgpg-error, libmad, linux, mesa3d, network-manager, nut,
+	pcre2, php, rdma-core, rsync, rtl8821cu, rtl_433,
+	s6-linux-utils, speechd, uqmi, xdriver_xf86-video-qxl, znc
+
+	New packages: atkmm2_28, cairomm1_14, glibmm2_66, libsigc2,
+	pangomm2_46, python-glslang
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15306: glibc build fails in Docker container
+	#15321: docker-engine now requires libseccomp by default
+
 2023.02-rc3, released March 8th, 2023
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 3972941328..634780b421 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.02-rc3
+export BR2_VERSION := 2023.02
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1678312000
+BR2_VERSION_EPOCH = 1678652000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 144dae5197..5afc507c52 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,40 +8,40 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest long term support release: <b>2022.02.10</b></h3>
+      <h3 style="text-align: center;">Latest stable / long term support release: <b>2023.02</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2022.02.10.tar.gz">buildroot-2022.02.10.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.02.10.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.02.tar.gz">buildroot-2023.02.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.02.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.02.10.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.02.10.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.02.10.tar.xz">buildroot-2022.02.10.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.02.10.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.02.tar.xz">buildroot-2023.02.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.02.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest stable release: <b>2022.11.2</b></h3>
 
       <div class="row mt centered">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2023.02-rc3.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index fcd67f3924..9fbbe5b0b7 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.02 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 March 2023</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2023.02 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.02">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.02.tar.xz">2023.02 release</a>.</p>
+
+	  <p>Notice that this is a long term support release which will be
+	  supported with security and other important fixes until March 2024.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 63806155a8..a1de170749 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.11.2'
+RELEASE='2023.02'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
