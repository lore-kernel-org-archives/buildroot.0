Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0EFC25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 21:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBD48409DB;
	Tue,  4 Jun 2024 21:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUdd-571iW6o; Tue,  4 Jun 2024 21:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36042410D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36042410D7;
	Tue,  4 Jun 2024 21:45:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECBF51BF82F
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 21:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41C4B401A2
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 21:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTtFcX9DVnXc for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 21:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A22C940151
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A22C940151
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 21:45:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BE9B87B36; Tue,  4 Jun 2024 21:45:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Jun 2024 23:45:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f39676bdbd4936669a128c544ade514b3afef6a
X-Git-Newrev: e19ae5ecad7a12673d61781f9090c2610f2dcf18
X-Patchwork-Hint: ignore
Message-Id: <20240604214554.8BE9B87B36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.05-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e19ae5ecad7a12673d61781f9090c2610f2dcf18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 32 ++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 64 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index b2bdde5069..8978a2ba7e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2024.05-rc2, released June 4th, 2024
+
+	Fixes all over the tree.
+
+	Download:
+	- Dropped the (noop) --passive-ftp option from default wget
+	  options for compatibility with wget2
+
+	- Fixed an issue with the generated archives (for
+	  git/svn/cargo/go) when multiple packages share an archive
+	  (E.G. linux vs linux-headers).
+
+	Defconfigs: Fix build issue with binutils 2.41+ for
+	Acmesystems Aria / Arietta, add download hashes for a number
+	of defconfigs. Fix FIT external position for i.MX8 boards
+
+	Updated/fixed packages: dnsmasq, docker-compose, doom-wad,
+	ebtables, esp-hosted, file, freeradius-client,
+	freeradius-server, go, kmod, libmnl, libnetfilter_acct,
+	libnetfilter_log, linux, luarocks, lynx, makedumpfile,
+	micropython, mtd, ncftp, newlib-bare-metal, nfacct, ntp,
+	octave, proftpd, qt5base, systemd, tpm2-tss, uboot-tools,
+	ulogd, vala, zip
+
+	Removed packages: at91bootstrap, at91dataflashboot,
+	on2-8170-libs, on2-8170-modules
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15973: imx8m bootloader image generation broken since update..
+	#16093: kmod and gcc-14 build error
+
 2024.05-rc1, released May 30th, 2024
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 40f862b515..3bef434466 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.05-rc1
+export BR2_VERSION := 2024.05-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1717102000
+BR2_VERSION_EPOCH = 1717537000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index b6793870a8..33b9b63537 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 -->
-      <h3 style="text-align: center;">Latest release candidate: <b>2024.05-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2024.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.05-rc1.tar.gz">buildroot-2024.05-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.05-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.05-rc2.tar.gz">buildroot-2024.05-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.05-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.05-rc1.tar.xz">buildroot-2024.05-rc1.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.05-rc1.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.05-rc2.tar.xz">buildroot-2024.05-rc2.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.05-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index e13def66cf..f817c0ef74 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.05-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 June 2024</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2024.05-rc2">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.05-rc2.tar.xz">2024.05-rc2
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
