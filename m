Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A449C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 21:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F586410B8;
	Mon, 28 Feb 2022 21:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xguKAiSGTSec; Mon, 28 Feb 2022 21:39:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B550410A3;
	Mon, 28 Feb 2022 21:39:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7113E1BF2FF
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E8CF405E3
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aWrpi2YDldLO for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 21:39:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1019E40273
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 21:39:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2B29A837B6; Mon, 28 Feb 2022 21:31:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 22:38:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7af7acabe051c1b394f53fd02084be7b97d8a8d8
X-Git-Newrev: 5b6e2ee8b7924419e13625c20ae34f656be3f7b4
X-Patchwork-Hint: ignore
Message-Id: <20220228213103.2B29A837B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02-rc3
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b6e2ee8b7924419e13625c20ae34f656be3f7b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 11 +++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7c1f014e13..8e8ecd1a72 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,14 @@
+2022.02-rc3, released February 28th, 2022
+
+	Fixes all over the tree.
+
+	Defconfigs: Xilinx zynqmp zcu102/zcu106: Fix U-Boot DTS config
+
+	Updated/fixed packages: bluez5_utils, bpftool, dbus, exempi,
+	flac, freerdp, frr, gnutls, libpjsip, libxml2, mariadb,
+	openssh, python-twisted, qt5webkit, samba4, vim, weston,
+	wireshark, wolfssl, xdg-dbus-proxy, xterm,
+
 2022.02-rc2, released February 20th, 2022
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 0ed93e600d..4f693d40a9 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02-rc2
+export BR2_VERSION := 2022.02-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1645395000
+BR2_VERSION_EPOCH = 1646083800
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index a1b2bc9632..891221e155 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2022.02-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2022.02-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.02-rc2.tar.gz">buildroot-2022.02-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.02-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.02-rc3.tar.gz">buildroot-2022.02-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.02-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.02-rc2.tar.bz2">buildroot-2022.02-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2022.02-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.02-rc3.tar.bz2">buildroot-2022.02-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2022.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 3d979877e0..88885a058f 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.02-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 February 2022</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2022.02-rc3 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.02-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.02-rc3.tar.bz2">2022.02-rc3
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
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
