Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BC9C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:00:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B354260F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B354260F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8264840588;
	Tue,  3 Aug 2021 23:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3XUUv22AFxG6; Tue,  3 Aug 2021 23:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11ADB40488;
	Tue,  3 Aug 2021 23:00:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CFFF1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D681340642
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrQx9ynxBtTC for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A78D40613
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D19DC843F5; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 23:21:08 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 15bb2aba8a779a801eed2dd3685be9c16a9f0955
X-Git-Newrev: 69f79f2a2ee1417e19c1ead2c9226e11753c06cb
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.D19DC843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2021.05
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=69f79f2a2ee1417e19c1ead2c9226e11753c06cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 19 +++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 26 +++++++++++++-------------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 53 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index 95b3a38024..c7ae5fbfc3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,22 @@
+2021.05, released June 6th, 2021
+
+	Various fixes.
+
+	Disable PIC/PIE support for Nios2 because of glibc issues
+
+	Defconfigs: Minnowboard max: Fix X11 and mesa3d configuration
+
+	Updated/fixed packages: apache, beaglev-ddrinit,
+	beaglev-secondboot, capnproto, dc3dd, directfb, efibootmgr,
+	ffmpeg, gptfdisk, go, gupnp, hostapd, iftop,
+	intel-mediadriver, libcamera, libcutl, libesmtp, libkcapi,
+	libraw, lttng-tools, lvm2, mimic, mono-gtksharp3, mpv,
+	netperf, odb, qt5base, uclibc, uftrace, unscd, vlc,
+	xdriver_xf86-video-fbturbo
+
+	New packages: python3-cffi, python3-cryptography, python3-pip,
+	python3-pycparser, python3-six
+
 2021.05-rc3, released May 31th, 2021
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 29250a232d..08e4a4104d 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.05-rc3
+export BR2_VERSION := 2021.05
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1622496000
+BR2_VERSION_EPOCH = 1623014000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index ea3af3bfb0..540b973e13 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,7 +8,7 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable / long term support release: <b>2021.02.2</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2021.02.2</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -41,41 +41,41 @@
 	  <p><a href="/downloads/buildroot-2021.02.2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest stable release: <b>2020.11.3</b></h3>
+
+      <h3 style="text-align: center;">Latest stable release: <b>2021.05</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.11.3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.11.3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2020.11.3.tar.gz">buildroot-2020.11.3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2020.11.3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.05.tar.gz">buildroot-2021.05.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.05.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2020.11.3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2020.11.3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.05.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2020.11.3.tar.bz2">buildroot-2020.11.3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2020.11.3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.05.tar.bz2">buildroot-2021.05.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.05.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2021.05-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2021.05-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index d2099adc18..2a27508bde 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.05 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 June 2021</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2021.05 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.05">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.05.tar.bz2">2021.05 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 3c1f55033d..84803ed250 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.2'
+RELEASE='2021.05'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
