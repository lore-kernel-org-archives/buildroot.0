Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F6AC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 08:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7352181E6F;
	Mon,  4 Dec 2023 08:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7352181E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lr2kBA7BPLwi; Mon,  4 Dec 2023 08:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E89B81E65;
	Mon,  4 Dec 2023 08:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E89B81E65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DECB41BF2CA
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 08:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4C8B81E65
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 08:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4C8B81E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsuGQNBWRoMq for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 08:08:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 953CE81E61
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 08:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 953CE81E61
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81E5C8795C; Mon,  4 Dec 2023 08:08:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Dec 2023 09:08:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6517a7f4bcccab6f75e0df4e0e1bec03ffc273c4
X-Git-Newrev: 954aeb7c721bf7edd56832650e8ebfb3b5c6fbd3
X-Patchwork-Hint: ignore
Message-Id: <20231204080859.81E5C8795C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=954aeb7c721bf7edd56832650e8ebfb3b5c6fbd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 13 +++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index c1b5651b74..f927b7df65 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,16 @@
+2023.11, released December 4th, 2023
+
+	Various fixes.
+
+	Defconfigs: Toradex apalis i.mx6: Add download hashes for
+	Linux and U-Boot.
+
+	Updated/fixed packages: cog, freescale-imx, imagemagick,
+	libde265, libmemcached, libpjsip, libusb-compat,
+	libzenoh-pico, linux-tools, lttng-modules, mariadb, monit,
+	openfpgaloader, perl, putty, python-numpy, rtty, speechd,
+	wireshark, xenomai, xtables-addons, zfs
+
 2023.11-rc2, released November 29th, 2023
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 04d24b9a35..e422e97214 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.11-rc2
+export BR2_VERSION := 2023.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1701295000
+BR2_VERSION_EPOCH = 1701677000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 7cc2ff7ccd..e673fa655b 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,40 +42,40 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2023.08.3</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2023.11</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.08.3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.08.3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2023.08.3.tar.gz">buildroot-2023.08.3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.08.3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.11.tar.gz">buildroot-2023.11.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.11.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.08.3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.11.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.08.3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.11.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.08.3.tar.xz">buildroot-2023.08.3.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.08.3.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.11.tar.xz">buildroot-2023.11.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.11.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2023.11-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2023.11-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index b3dda4c629..6db4712d19 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.11 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 December 2023</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2023.11 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.11">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.11.tar.xz">2023.11 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 250a8810e5..61eb743659 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.08.3'
+RELEASE='2023.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
