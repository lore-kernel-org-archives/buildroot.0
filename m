Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD366CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 06:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21A4560856;
	Thu, 28 Aug 2025 06:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68oUVCWLRT7q; Thu, 28 Aug 2025 06:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 780AE60850
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 780AE60850;
	Thu, 28 Aug 2025 06:02:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DEBBB8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 06:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B3AF40A99
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 06:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlV813sX_Qa4 for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 06:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32D794021B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32D794021B
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 06:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2695187C10; Thu, 28 Aug 2025 06:02:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 08:01:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e13a3c95c111168b1bfe0ec9fdb0879a83490b18
X-Git-Newrev: 56d9d5e8f0872737fd79abf6a60e66920bb7861c
X-Patchwork-Hint: ignore
Message-Id: <20250828060229.2695187C10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2025.08-rc3
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

commit: https://git.buildroot.net/buildroot/commit/?id=56d9d5e8f0872737fd79abf6a60e66920bb7861c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 20 ++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 39a3113334..f622f8d387 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,23 @@
+2025.08-rc3, released August 28th, 2025
+
+	Fixes all over the tree, mainly GCC 15.x build fixes
+
+        support/misc/pkg-stats: Be more robust when parsing CVEs
+
+        Fixed defconfigs: canaan_kd233, sipeed_maix*: Correct Linux
+        image name configuration, ci20: Needs host-openssl,
+        imx6ulz_bsh_smm_m2: Use correct FPU configuration
+
+        Removed defconfigs: kontron_pitx_imx8m
+
+	Updated/fixed packages: binutils, cpp-httplib, dtach,
+	dump1090, ffmpeg, gdbm, gpm, libjwt, liblog4c-localtime,
+	libv4l, lrzsz, mesa3d, p11-kit, php-lua, proftpd,
+	python-aexpect, python-pyroute2, python3, rpi-userland, sdl,
+	vim, wayland, weston, wpewebkit, xvisor
+
+        Removed packages: liboauth
+
 2025.08-rc2, released August 21th, 2025
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index cfa66d773c..d4ad4629c0 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.08-rc2
+export BR2_VERSION := 2025.08-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1755760000
+BR2_VERSION_EPOCH = 1756360000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 1c5f5902b2..ee466e3d85 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2025.08-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2025.08-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2025.08-rc2.tar.gz">buildroot-2025.08-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.08-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.08-rc3.tar.gz">buildroot-2025.08-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.08-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2025.08-rc2.tar.xz">buildroot-2025.08-rc2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.08-rc2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.08-rc3.tar.xz">buildroot-2025.08-rc3.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.08-rc3.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 210338473a..f36ac5894a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.08-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 August 2025</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08-rc3/CHANGES">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.08-rc3.tar.xz">2025.08-rc3
+	  release</a>, and report any problems found to the
+         <a href="support.html">mailing list</a> or
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
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
