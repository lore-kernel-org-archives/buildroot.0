Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E7FC433FE
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 10:38:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCBF461105
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 10:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCBF461105
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9559740249;
	Mon,  8 Nov 2021 10:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShwDSQvikCx2; Mon,  8 Nov 2021 10:38:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9E3940113;
	Mon,  8 Nov 2021 10:38:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30C861BF36C
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 10:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C76740113
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 10:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESRpeEwJnyic for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 10:38:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2354B400FC
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 10:38:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E171B8B61A; Mon,  8 Nov 2021 10:34:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 11:37:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bd07a0cc63c0933fcda5c78fbda6df99c4aaa29
X-Git-Newrev: 0df2928afe536a67619ac19aeca52c3bec5b53f9
X-Patchwork-Hint: ignore
Message-Id: <20211108103424.E171B8B61A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.11-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0df2928afe536a67619ac19aeca52c3bec5b53f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  8 ++++----
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/CHANGES b/CHANGES
index 676f195e01..e611898795 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2021.11-rc1, to be released
+2021.11-rc1, released November 8th, 2021
 
 	Numerous package updates. Notable updates including numerous
 	Python modules, Kodi add-ons, nodejs, OpenJDK.
@@ -28,7 +28,7 @@
 	- support for hybrid ISO9660 images added, which work on
           legacy and EFI BIOS machines
 
-	New defconfigs: stm32mp157c_odyssey
+	New defconfigs: Allwinner nezha, stm32mp157c_odyssey
 
 	Removed defconfigs: qemu_csky
 
@@ -39,8 +39,8 @@
 	python-git, python-pyndiff, python-rsa,
 	python-unitest-xml-reporting, python-xmljson,
 	python3-cryptography, python3-pip, qt5opcua, rwmem,
-	sloci-image, softhsm2, uqmi, vuejs-router, watchdogd,
-	wireplumber
+	sloci-image, softhsm2, sun20i-d1-spl, uqmi, vuejs-router,
+	watchdogd, wireplumber
 
 	Removed packages: canfestival, python-meld3
 
diff --git a/Makefile b/Makefile
index c960b53a6d..4062883cc2 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.11-git
+export BR2_VERSION := 2021.11-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1630749000
+BR2_VERSION_EPOCH = 1636367800
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index c966ac8f4f..0f59e7a007 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2021.08.1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2021.08-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2021.11-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.08-rc3.tar.gz">buildroot-2021.08-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.08-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.11-rc1.tar.gz">buildroot-2021.11-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.11-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.08-rc3.tar.bz2">buildroot-2021.08-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.08-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.11-rc1.tar.bz2">buildroot-2021.11-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.11-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index eeff335a6a..947a39fdb6 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.11-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 November 2021</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.11-rc1">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.11-rc1.tar.bz2">2021.11-rc1
+	  release</a>, and report any problems found to the
+         <a href="support.html">mailing list</a> or
+         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
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
