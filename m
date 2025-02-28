Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58F7C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6757E41807;
	Fri, 28 Feb 2025 16:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6z_d9O-_ea3; Fri, 28 Feb 2025 16:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC76F417FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC76F417FB;
	Fri, 28 Feb 2025 16:28:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C50268
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8EBD811C6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cddpJFFebGCU for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7C9D811C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7C9D811C2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:28:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBEBE87AF5; Fri, 28 Feb 2025 16:28:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 17:27:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89d63110f917fad22b9c2a01549ee77cd4c61dfa
X-Git-Newrev: a031b51637622570609807418d47d8441fdf2501
X-Patchwork-Hint: ignore
Message-Id: <20250228162822.BBEBE87AF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2025.02-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a031b51637622570609807418d47d8441fdf2501
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++----------
 docs/website/news.html     | 21 ++++++++++++++++++
 4 files changed, 89 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index c8b7cd0492..cfd963a03e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,58 @@
+2025.02-rc1, released February 28th, 2025
+
+	Fixes all over the tree and new features.
+
+        Nios2 architecture support removed.
+
+	Toolchain:
+
+        - binutils 2.44 added, binutils 2.43.1 becomes the default.
+
+        - gdb 16.1 added, gdb 15.1 becomes the default.
+
+        - Synopsys external ARC toolchains marked as broken as they
+          are not "bare" toolchains, causing various build issues
+
+        - ARM external toolchains bumped to 12.4.rel1 and are now also
+          available for Aarch64 build machines
+
+        Infrastructure:
+
+        - utils/generate-cyclonedx script added to generate SBOM in
+          CycloneDX format. To use it, run
+
+            make show-info | utils/generate-cyclonedx > sbom.json
+
+        new defconfigs: FriendlyARM NanoPi R3S, NXP imx8mm-evk /
+        imx8mm-ddr4 /imx8mp-evk / imx93-evk / ls1043a-rdb /
+        ls1046a-rdb, Orangepi 5 plus, Polyhex Debix model A,
+        Raspberrypi zero 2w 64bit, Raxda rock 4SE, STM STM32MP135F-DK
+
+	New packages: bmap-writer, cpuinfo, cross-ldd, farmhash,
+	fft2d, fp16, gemmlowp, libecoli, libglib2-bootstrap, lynis,
+	nxp-bt-wifi-firmware, nxp-mwifiex, panel-mipi-dbi-firmware,
+	parsec, psimd, pthreadpool, python-aiohttp-sse-client,
+	python-asyncclick, python-changelog-chug, python-telnetlib3,
+	python-waitress, qt6graphs, qt6multimedia, qt6quick3d,
+	rnnoise, ruy, snooze, tensorflow-lite, usbip, utfcpp,
+	wlr-randr, xilinx-embeddedsw, xnnpack
+
+        Removed packages: angularjs, angular-websocket, directfb,
+        directfb-examples, fconfig, genromfs, giblib, gst-omx,
+        hiwatha, latencytop, libhid, linux-fusion, lite, mimic,
+        mongodb, obsidian-cursors, python-m2crypto, quagga, ramsmp,
+        w_scan
+
+	Issues resolved:
+	- bluetooth.service cannot connect to D-BUS
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/65
+        - gdb package doesn't have a licence hash in the gdb.hash file
+          https://gitlab.com/buildroot.org/buildroot/-/issues/66
+	- package/libsha1: Build failure with GCC 14 [-Wimplicit-int]
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/69
+	- samba4 build failed in master
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/86
+
 2024.11.2, released February 21st, 2025
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index c876f8a54c..824fba06bf 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02-git
+export BR2_VERSION := 2025.02-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1733653000
+BR2_VERSION_EPOCH = 1740760000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 2b9d8030ce..9d27cf8a08 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2024.11.2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2024.11-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2025.02-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.11-rc3.tar.gz">buildroot-2024.11-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.11-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.02-rc1.tar.gz">buildroot-2025.02-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.02-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.11-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.02-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.11-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.02-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.11-rc3.tar.xz">buildroot-2024.11-rc3.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.11-rc3.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.02-rc1.tar.xz">buildroot-2025.02-rc1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.02-rc1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 88ac274e59..b4e72ac1f2 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 February 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02-rc1/CHANGES">CHANGES</a>
+          file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+          <a href="/downloads/buildroot-2025.02-rc1.tar.xz">2025.02-rc1
+            release</a>, and report any problems found to the
+          <a href="support.html">mailing list</a> or
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
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
