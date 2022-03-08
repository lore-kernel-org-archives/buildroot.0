Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1557C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 22:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83D4E417B6;
	Tue,  8 Mar 2022 22:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJiw9xZmzL96; Tue,  8 Mar 2022 22:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86EC7417BA;
	Tue,  8 Mar 2022 22:09:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6A71BF588
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 22:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 193DE80BE7
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 22:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQyG9nJKIPGV for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 22:08:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 111D880BE6
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 22:08:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EAA1883874; Tue,  8 Mar 2022 22:00:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Mar 2022 23:08:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d8c29e7ac8ff2558656340bb88a7d044279d302
X-Git-Newrev: 08967921c4a91eb7d966c31f755a0720914e8bff
X-Patchwork-Hint: ignore
Message-Id: <20220308220031.EAA1883874@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02
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

commit: https://git.buildroot.net/buildroot/commit/?id=08967921c4a91eb7d966c31f755a0720914e8bff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 33 +++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 21 +++++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 68 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8e8ecd1a72..59ae8f15ce 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,36 @@
+2022.02, released March 8th, 2022
+
+	Various fixes.
+
+	Fixes to cargo and golang packaging infrastructure.
+
+	Defconfigs: OrangePi RK3399: Fix genimage format
+
+	Updated/fixed packages: azure-iot-sdk-c, bpftool, cog,
+	directfb, directfb-examples, dnsmasq, docker-engine, expat,
+	freerdp, frr, gdb, ghostscript, glib-networking, go, haproxy,
+	hostapd, kf5-extra-cmake-modules, kf5-kcoreaddons,
+	kf5-modemmanager-qt, kf5-networkmanager-qt, libcamera-apps,
+	libgee, libglfw, librstp, libtorrent, libvirt, libxslt, linux,
+	mariadb, oprofile, osm2pgsql, pulseview, python-cryptography,
+	python-gnupg, python-treq, qt5base, qt5webkit, rauc, re2,
+	rygel, safeclib, sconeserver, seatd, sord, upmpdcli,
+	util-linux, weston, wpa_supplicant, xdriver_xf86-video-mach64,
+	xdriver_xf86-video-nouveau, xdriver_xf86-video-qxl,
+	xscreensaver, zabbix
+
+	New packages: gdk-pixbuf-xlib
+
+	Removed packages: python-pycli
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13126: make fails - bzip2-1.0.6.tar.gz and DirectFB-1.7.7.tar..
+	#14611: 2022.02-rc2: Build of BR2_x86_64 with BR2_LINUX_KERNEL_..
+	#14631: host-go-bootstrap: go not being built for package in ..
+	#14636: azure-iot-sdk-c: Installed headers do not compile
+	#14641: oprofile can not find the events files
+
 2022.02-rc3, released February 28th, 2022
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 4f693d40a9..71f8096b71 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02-rc3
+export BR2_VERSION := 2022.02
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1646083800
+BR2_VERSION_EPOCH = 1646777000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 891221e155..18a9254cbf 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,40 +8,40 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest long term support release: <b>2021.02.10</b></h3>
+      <h3 style="text-align: center;">Latest stable / long term support release: <b>2022.02</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.02.10.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2021.02.10.tar.gz">buildroot-2021.02.10.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.02.10.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.02.tar.gz">buildroot-2022.02.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.02.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.02.10.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.02.10.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.02.10.tar.bz2">buildroot-2021.02.10.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.02.10.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.02.tar.xz">buildroot-2022.02.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.02.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest stable release: <b>2021.11.2</b></h3>
 
       <div class="row mt centered">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2022.02-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 88885a058f..de80a5f23d 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.02 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 March 2022</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2022.02 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.02">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.02.tar.xz">2022.02 release</a>.</p>
+
+	  <p>Notice that this is a long term support release which will be
+	  supported with security and other important fixes until March 2023.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 37981d7932..a5a0e3f41a 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.11.2'
+RELEASE='2022.02'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
