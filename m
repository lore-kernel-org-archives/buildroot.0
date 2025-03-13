Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0089AC28B28
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 10:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1A3660E1D;
	Thu, 13 Mar 2025 10:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZpKqqALAk_F; Thu, 13 Mar 2025 10:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F0D760E63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F0D760E63;
	Thu, 13 Mar 2025 10:11:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7064BE0
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 603668384B
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8OHqMRdkJ0h for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 10:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43D5881934
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43D5881934
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:11:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3775D87F72; Thu, 13 Mar 2025 10:11:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 11:09:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac300757f612e5153b767ae37cffaedfb386e789
X-Git-Newrev: 53f74f49c039a41c97875b3e6fe871b8e82a013b
X-Patchwork-Hint: ignore
Message-Id: <20250313101117.3775D87F72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2025.02-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=53f74f49c039a41c97875b3e6fe871b8e82a013b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 15 +++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index e8b2eb312a..83859bb47a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,18 @@
+2025.02-rc2, released March 13th 28th, 2025
+
+	Fixes all over the tree.
+
+        Linux: Support device tree overlays and support custom device
+        tree files with Linux >= 6.12, which changed the build
+        logic. For this a new BR2_LINUX_KERNEL_CUSTOM_DTS_DIR option
+        has been introduced and the existing _CUSTOM_DTS_PATH option
+        deprecated.
+
+	Updated/fixed packages: compiler-rt, elfutils, fluidsynth,
+	freescale-imx, go, jbig2dec, libcamera, libcdio, libjxl, musl,
+	optee-os, postgresql, prboom, sqlite, systemd, util-linux,
+	webkitgtk
+
 2025.02-rc1, released February 28th, 2025
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 824fba06bf..30222c9747 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02-rc1
+export BR2_VERSION := 2025.02-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1740760000
+BR2_VERSION_EPOCH = 1741860000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 9d27cf8a08..263b03309a 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2025.02-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2025.02-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2025.02-rc1.tar.gz">buildroot-2025.02-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.02-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.02-rc2.tar.gz">buildroot-2025.02-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.02-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.02-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.02-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.02-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.02-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2025.02-rc1.tar.xz">buildroot-2025.02-rc1.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.02-rc1.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.02-rc2.tar.xz">buildroot-2025.02-rc2.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.02-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index b4e72ac1f2..03fcae660a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 March 2025</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another 2 weeks, another release candidate with more cleanups and build fixes. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02-rc2/CHANGES">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02-rc2.tar.xz">2025.02-rc2
+	  release</a>, and report any problems found to the
+         <a href="support.html">mailing list</a> or
+         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
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
