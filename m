Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C8FC88CB9
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 11:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44102412A9;
	Mon, 11 Aug 2025 11:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0V7F_p2x7NHF; Mon, 11 Aug 2025 11:26:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97438412DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97438412DA;
	Mon, 11 Aug 2025 11:26:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B604154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 11:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5205F40989
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 11:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9ctgFx1Iity for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 11:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5861540129
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5861540129
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 11:25:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49798873D4; Mon, 11 Aug 2025 11:25:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 13:22:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbbe5d3343c72bd852fce16409156ccdfaff1d18
X-Git-Newrev: 1349cd6031dcff9bdb30bd9c0bd61641cadc99b9
X-Patchwork-Hint: ignore
Message-Id: <20250811112557.49798873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2025.08-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1349cd6031dcff9bdb30bd9c0bd61641cadc99b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 30 ++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 64 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index e57ccb1c09..82e9ad1878 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,33 @@
+2025.08-rc1, released August 11th, 2025
+
+	Fixes all over the tree and new features.
+
+	Arch: Add LoongArch64 architecture support
+
+	Toolchains:
+	- ARC toolchain updated to 2024.12
+	- Bootlin external toolchains updated to 2025.08-1
+	- GCC 15.1.0 added, 12.x dropped, 14.x is now default
+	- GCC 13.x updated to 13.4.0, 14.x updated to 14.3.0
+	- Default to Linux 6.16.x kernel headers
+
+	Misc:
+	- Various tweaks to utils/generate-cyclonedx for better SBOM
+	  compatibility and project name/version customization
+
+	New defconfigs: BeagleY-AI, CoolPI 4B, Freescale i.MX91
+	Freedom, LoongArch64 EFI, QEMU LoongArch64 Virt, Raspberrypi
+	Compute Module 5 IO
+
+	New packages: containers-image-config, distribution-registry,
+	llvm-runtimes, lua-lrexlib-pcre2, msgpack-c, opencl-headers,
+	opencl-icd-loader, pocketpy, python-apscheduler, python-crc,
+	python-log-rate-limit, python-sdbus-modemmanager, soapy-sdr,
+	vulkan-sdk
+
+	Removed packages: libebur128, libolm, libwebsock,
+	python-dunamai, python-poetry-dynamic-versioning
+
 2025.05, released June 9th, 2025
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index 540183f16e..203d90510d 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.08-git
+export BR2_VERSION := 2025.08-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1749500000
+BR2_VERSION_EPOCH = 1754911000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index df06bf33d4..e21ded6ebd 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2025.05.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2025.05-rc2</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2025.08-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2025.05-rc2.tar.gz">buildroot-2025.05-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.05-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.08-rc1.tar.gz">buildroot-2025.08-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.08-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2025.05-rc2.tar.xz">buildroot-2025.05-rc2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.05-rc2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.08-rc1.tar.xz">buildroot-2025.08-rc1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.08-rc1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 91b3569f12..33cb27d41f 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.08-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 August 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08-rc1/CHANGES">CHANGES</a>
+          file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+          <a href="/downloads/buildroot-2025.08-rc1.tar.xz">2025.08-rc1
+            release</a>, and report any problems found to the
+          <a href="support.html">mailing list</a> or
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
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
