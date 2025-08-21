Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C274CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 07:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E24B812EB;
	Thu, 21 Aug 2025 07:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVobNh3vCYEB; Thu, 21 Aug 2025 07:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CA26812F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CA26812F3;
	Thu, 21 Aug 2025 07:09:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E9B447AD
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 07:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBA954088C
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 07:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgveWaPkhZGU for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 07:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 026F440861
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 026F440861
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 07:09:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4E2B87791; Thu, 21 Aug 2025 07:09:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 09:08:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9f4328ef4e12852e1cde814d919186846131765
X-Git-Newrev: 5d46144eb34770586a8928cb366e0d86fd3c82c4
X-Patchwork-Hint: ignore
Message-Id: <20250821070926.E4E2B87791@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2025.08-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d46144eb34770586a8928cb366e0d86fd3c82c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 16 ++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 48 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 70fecf46e8..39a3113334 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,19 @@
+2025.08-rc2, released August 21th, 2025
+
+	Fixes all over the tree.
+
+	The release tarballs are now built reproducibly.
+
+	Updated/fixed packages: bash, bcusdk, ed, elfutils, gcc,
+	gcc-bare-metal, go, grub, gst1-devtools, gst1-libav,
+	gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
+	gst1-plugins-ugly, gst1-python, gst1-rtsp-server, gst1-vaapi,
+	gstreamer1, gstreamer1-editing-services, hwdata, iperf3, jq,
+	libcue, libtracefs, modem-manager, ofono, openconnect,
+	openjpeg, openocd, prboom, python-numpy, rpcbind, rrdtool,
+	rt-tests, rtl8812au-aircrack-ng, setserial, start-stop-daemon,
+	tinyssh, trace-cmd, vorbis-tools
+
 2025.08-rc1, released August 11th, 2025
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index c740c6783d..cfa66d773c 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.08-rc1
+export BR2_VERSION := 2025.08-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1754911000
+BR2_VERSION_EPOCH = 1755760000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index ecb0216d97..1c5f5902b2 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2025.08-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2025.08-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2025.08-rc1.tar.gz">buildroot-2025.08-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.08-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.08-rc2.tar.gz">buildroot-2025.08-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.08-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2025.08-rc1.tar.xz">buildroot-2025.08-rc1.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.08-rc1.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.08-rc2.tar.xz">buildroot-2025.08-rc2.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.08-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index d0c1594b79..210338473a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.08-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 August 2025</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08-rc2/CHANGES">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.08-rc2.tar.xz">2025.08-rc2
+	  release</a>, and report any problems found to the
+         <a href="support.html">mailing list</a> or
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
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
