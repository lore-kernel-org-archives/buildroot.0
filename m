Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96637ECAAD3
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 08:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A45F60BB1;
	Thu,  1 Sep 2022 08:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A45F60BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0blmbgRC4QFq; Thu,  1 Sep 2022 08:20:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F95460A8D;
	Thu,  1 Sep 2022 08:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F95460A8D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F8CF1BF34A
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 08:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A4EF60A8D
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 08:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4EF60A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SxwQ_JZm7Rw for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 08:20:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1204E60A89
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 08:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1204E60A89
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7B71188220; Thu,  1 Sep 2022 08:05:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 1 Sep 2022 10:19:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02104e86cc799f435632f30e1af80ca50bc90eea
X-Git-Newrev: 1c0da88a83837abaa6b52c7805ea73753caa9625
X-Patchwork-Hint: ignore
Message-Id: <20220901080507.7B71188220@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.08-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c0da88a83837abaa6b52c7805ea73753caa9625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 33 +++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 65 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index e22005540e..ae3929d856 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,36 @@
+2022.08-rc2, released September 1st, 2022
+
+	Fixes all over the tree.
+
+	dependencies: Ensure 'find' and 'xargs' are available on the
+	build host.
+
+	A large number of typo fixes.
+
+	Defconfigs: bananapi m1, olimex a20/a33/lime: Use standard FPU
+	configuration, pine64_sopine: Use mainline ATF to fix build
+
+	Updated/fixed packages: ace, alsa-utils, busybox, cups,
+	dbus-broker, directfb, domoticz, drbd-utils, edk2,
+	edk2-platforms, ffmpeg, freeradius-server, freeswitch, gauche,
+	gcc, gdb, glibc, gnutls, gst1-plugins-bad, gst1-plugins-good,
+	hawktracer, igd-ethercat, imagemagick, intel-mediadriver,
+	jack2, jose, jpeg, jquery-ui-themes, kodi, libcamera, libdill,
+	libgit2, libglvnd, libgpg-error, libgpgme, libinput, libp11,
+	libsepol, libtirpc, libvirtd, libvncserver, libwpe, libzlib,
+	linux, linux-tools-perf, llvm, lshw, makedumpfile,
+	mali-driver, memcached, minetest, mutt, ne10, netsniff-ng,
+	ntpsec, ocrad, ola, opencv4, openocd, opensc, optee-os,
+	pcsc-lite, postgresql, protobuf, pulseaudio, python-autobahn,
+	python-paho-mqtt, python-protobuf, python-pygame, python3, qemu,
+	qoriq-cadence-dp-firmware, qt5doc, qt6base, ranger, rng-tools,
+	rsync, rustc, sconeserver, sdl2, snort, sqlite, squid,
+	stress-ng, strongswan, sunxi-mali-utgard-driver, sysdig,
+	sysklogd, syslinux, syslog-ng, tcf-agent, tcpreplay,
+	tesseract-ocr, uacme, uboot-tools, uclibc, udpcast, usbguard,
+	v4l2loopback, vim, webkitgtk, wolftpm, wpewebkit, xenomai,
+	xserver_xorg-server, zeek, zerofree
+
 2022.08-rc1, released August 12th, 2022
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index b40b7632f5..bd0b906cde 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.08-rc1
+export BR2_VERSION := 2022.08-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1660332552
+BR2_VERSION_EPOCH = 1662020000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index db150ff432..8086878f38 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2022.08-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2022.08-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.08-rc1.tar.gz">buildroot-2022.05-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.08-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.08-rc2.tar.gz">buildroot-2022.08-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.08-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.08-rc1.tar.xz">buildroot-2022.05-rc2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.08-rc1.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.08-rc2.tar.xz">buildroot-2022.08-rc2.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.08-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 75d7a69910..fb62d5a6df 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.08-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 September 2022</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2022.08-rc2 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.08-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.08-rc2.tar.xz">2022.08-rc2
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
