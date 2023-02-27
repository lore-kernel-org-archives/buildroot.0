Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2301CC64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 16:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B1196100C;
	Mon, 27 Feb 2023 16:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B1196100C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0HDF9VQauU6; Mon, 27 Feb 2023 16:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70EF861023;
	Mon, 27 Feb 2023 16:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70EF861023
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F03AA1BF870
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7F1040A60
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7F1040A60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xIGLSlPxDoxY for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 16:43:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1AD8404F5
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 16:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1AD8404F5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB76386C46; Mon, 27 Feb 2023 16:43:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 17:43:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3aa7821d77386b597c7c63d9bdafa3278df60c36
X-Git-Newrev: debec267fc41b1b0ff3e23cbc06d3d4186bd466a
X-Patchwork-Hint: ignore
Message-Id: <20230227164344.AB76386C46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.02-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=debec267fc41b1b0ff3e23cbc06d3d4186bd466a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 20 ++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 21e349f3a8..04b49a94cb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,23 @@
+2023.02-rc2, released February 27th, 2023
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: asterisk, at91dataflashboot, bind,
+	efivar, erlang, flac, fluent-bit, freerdp, gcc, gdal, gerbera,
+	gnuradio, gqrx, haproxy, hawktracer, imx-gpu-g2d,
+	intel-gmmlib, libarchive, libblockdev, libcamera-apps, libjxl,
+	libmodsecurity, libsigrokdecode, lightning, lirc-tools,
+	lttng-babeltrace, modem-manager, modsecurity2,
+	multipath-tools, mutt, mxs-bootlets, netsurf, network-manager,
+	nginx-naxsi, ntpsec, opensbi, optee-client, pcm-tools,
+	php-xdebug, pistache, postgresql, proxychains-ng,
+	python-m2crypto, python-numpy, python-webargs,
+	python-werkzeug, rtl8723bu, rtty, speechd, sudo, systemd,
+	tiff, tmux, wilc-driver, wpa_supplicant, xerces,
+	xtables-addons, xwayland, zabbix
+
+	Removed packages: uccp420wlan
+
 2023.02-rc1, released February 20th, 2023
 
 	Numerous package updates and many (62) new packages.
diff --git a/Makefile b/Makefile
index c97086c09c..8edc90ac50 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.02-rc1
+export BR2_VERSION := 2023.02-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1676923000
+BR2_VERSION_EPOCH = 1677516000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index a6b9a9a7c4..12f967db14 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2023.02-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2023.02-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.02-rc1.tar.gz">buildroot-2023.02-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.02-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.02-rc2.tar.gz">buildroot-2023.02-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.02-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.02-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.02-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.02-rc1.tar.xz">buildroot-2023.02-rc1.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.02-rc1.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.02-rc2.tar.xz">buildroot-2023.02-rc2.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.02-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 8acf454052..0f8bd26702 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.02-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>27 February 2023</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2023.02-rc2 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.02-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.02-rc2.tar.xz">2023.02-rc2
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
