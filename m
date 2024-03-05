Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53626C54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 13:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E233982383;
	Tue,  5 Mar 2024 13:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mr6ntUyRGVCD; Tue,  5 Mar 2024 13:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8C668238F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8C668238F;
	Tue,  5 Mar 2024 13:47:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10C431BF309
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 13:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AB5D60A43
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 13:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iq5MysivMCZA for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 13:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC2A3608DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC2A3608DD
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 13:47:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3AA48810E; Tue,  5 Mar 2024 13:47:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Mar 2024 14:46:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06026055fcef1d36f586c5e808ca595b9ab782f2
X-Git-Newrev: 87e979e4572449ecb7d2058b02d642b38cc3b0f8
X-Patchwork-Hint: ignore
Message-Id: <20240305134709.A3AA48810E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.02
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

commit: https://git.buildroot.net/buildroot/commit/?id=87e979e4572449ecb7d2058b02d642b38cc3b0f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 16 ++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 21 +++++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 51 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index d5f1bf5794..8f0b4042fa 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,19 @@
+2024.02, released March 5th, 2024
+
+	Various fixes.
+
+	Updated/fixed packages: botan, conmon, dash, efivar, expat,
+	fluent-bit, gcc, gst1-vaapi, libcoap, libselinux, liburing,
+	libva, libxml2, ltp-testsuite, luvi, newlib-bare-metal,
+	nginx-naxsi, octave, openblas, openvmtools, parted, poco,
+	powertop, python-aiohttp, python-cheroot, python-django,
+	python-grpcio, rauc, rauc-hawkbit-updater, rtl8822cs, rust,
+	sdl2, shadow, spirv-tools, strace, strongswan, tar, tllist,
+	vim
+
+	Removed packages: mysql (virtual), oracle-mysql,
+	python-setuptools-scm-git-archive
+
 2024.02-rc2, released March 1st, 2024
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 3389da2852..6d5e9a7972 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02-rc2
+export BR2_VERSION := 2024.02
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1709318000
+BR2_VERSION_EPOCH = 1709640000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 70a1de5b6d..c1393134df 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,40 +8,40 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest long term support release: <b>2023.02.10</b></h3>
+      <h3 style="text-align: center;">Latest stable / long term support release: <b>2024.02</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2023.02.10.tar.gz">buildroot-2023.02.10.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.02.10.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.02.tar.gz">buildroot-2024.02.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.02.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.02.10.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.02.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.02.10.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.02.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.02.10.tar.xz">buildroot-2023.02.10.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.02.10.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.02.tar.xz">buildroot-2024.02.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.02.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest stable release: <b>2023.11.2</b></h3>
 
       <div class="row mt centered">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2024.02-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index f142515889..a51da7f4bb 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.02 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 March 2024</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2024.02 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2024.02">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.02.tar.xz">2024.02 release</a>.</p>
+
+	  <p>Notice that this is a long term support release which will be
+	  supported with security and other important fixes until March 2025.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index ba06c5f5fd..73bdcc8b5e 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.11.2'
+RELEASE='2024.02'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
