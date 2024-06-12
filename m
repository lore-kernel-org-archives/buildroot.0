Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0126AC27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 10:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28CAD606CC;
	Wed, 12 Jun 2024 10:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BW98UZNXWKjO; Wed, 12 Jun 2024 10:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5B40607AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5B40607AE;
	Wed, 12 Jun 2024 10:31:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 945AB1BF376
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 10:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D00A404CB
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 10:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUIARk4dy0eO for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 10:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D3A1404AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D3A1404AA
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 10:31:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73B9987EC8; Wed, 12 Jun 2024 10:31:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 12:30:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85736a27c8cdddcc65ff769852fde60834f302c7
X-Git-Newrev: 6a1f9b3c0c87814f9aa624c4271f1e33ec45f0af
X-Patchwork-Hint: ignore
Message-Id: <20240612103108.73B9987EC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.05
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a1f9b3c0c87814f9aa624c4271f1e33ec45f0af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 18 ++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 26 +++++++++++++-------------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 52 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index c5c71bd6ef..4916eb0bf4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2024.05, released June 12th, 2024
+
+	Various fixes.
+
+	Infrastructure: Ensure a custom tar program specified with
+	make TAR=/path/to/custom/tar is used everwhere.
+
+	Defconfigs: Fix build issues and runtime warnings for
+	Beaglebone qt5, Qemu ppc64/le pseries, TI am62x/am64x.
+
+	Add hashes for Beaglebone qt5, imx8mn bsh sm s2 / pro,
+	stm32f429 disco XIP, stm32f769 disco sd.
+
+	Updated/fixed packages: bc, collectd, composer, cvs,
+	docker-compose, flutter-engine, git, liblockfile, libzenoh-c,
+	lightning, nginx, p11-kit, python-lxml, python3, qt6base,
+	rrdtool, sofia-sip, syslog-ng, systemd, uclibc, unixodbc
+
 2024.05-rc2, released June 4th, 2024
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 3bef434466..4320eeb1b7 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.05-rc2
+export BR2_VERSION := 2024.05
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1717537000
+BR2_VERSION_EPOCH = 1718188000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 127c004e36..5737878cd4 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,7 +8,7 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable / long term support release: <b>2024.02.3</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2024.02.3</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -41,41 +41,41 @@
 	  <p><a href="/downloads/buildroot-2024.02.3.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest stable release: <b>2023.11.2</b></h3>
+
+      <h3 style="text-align: center;">Latest stable release: <b>2024.05</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2023.11.2.tar.gz">buildroot-2023.11.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.11.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.05.tar.gz">buildroot-2024.05.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.05.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.11.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.05.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.11.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.05.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.11.2.tar.xz">buildroot-2023.11.2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.11.2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.05.tar.xz">buildroot-2024.05.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.05.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2024.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2024.05-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index c57a8e3175..691d27071a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.05 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>12 June 2024</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2024.05 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2024.05">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.05.tar.xz">2024.05 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 983f2f58b3..ce57bc0719 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.02.3'
+RELEASE='2024.05'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
