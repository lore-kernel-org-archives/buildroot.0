Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F499C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 19:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2B77402BD;
	Sun, 13 Feb 2022 19:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1MyLHv6ettCS; Sun, 13 Feb 2022 19:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C238E402B3;
	Sun, 13 Feb 2022 19:52:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 837841BF29A
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 19:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72605813BB
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 19:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vNzH6Eyu3gP4 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 19:51:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E541813BD
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 19:51:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 91A7C82A50; Sun, 13 Feb 2022 19:44:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 20:50:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35e2f68c30515598014a9ef4daf7c8f6134aeb74
X-Git-Newrev: 5ee6be2bdc8882eb04b5480b61d3c369c06972b8
X-Patchwork-Hint: ignore
Message-Id: <20220213194421.91A7C82A50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ee6be2bdc8882eb04b5480b61d3c369c06972b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 68 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 +--
 docs/website/download.html | 22 +++++++--------
 docs/website/news.html     | 21 ++++++++++++++
 4 files changed, 102 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4fa4e12b9f..4cc574d928 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,71 @@
+2022.02-rc1, released February 13th, 2022
+
+	Numerous package updates and many (80) new packages.
+
+	Toolchain:
+	- glibc: Optional support for compatibility shims for running
+          on older kernels than what glibc has been built against
+	- uClibc: Use uClibc-ng 1.0.40
+	- External toolchains: Update Bootlin toolchains to 2021.11-1
+          version
+
+	Python 2.7 and python 2.x specific packages removed as python
+	2.x is EOL since April 2020. Likewise a number of python3
+	specific host packages has been renamed (host-python-foo
+	instead of host-python3-foo) now host-python is always python
+	3.x.
+
+	Cargo (Rust) package infrastructure added. Vendoring support
+	added to golang package infrastructure.
+
+	New defconfigs: FriendlyARM NanoPi R2S, Kontron BL i.MX8M
+	Mini, Microchip Sama7g7ek, Olimex STMP157 OlinuXino LIME2,
+	QEMU PPC Bamboo, PPC64 PowerNV, Raspberry Pi Zero 2W, Spike
+	Riscv64, Xilinx zcu102
+
+	Removed defconfigs: Synopsys arch38 VDK, aarch64 VDK
+
+	New packages: ace, alchemy, alfred, bat, bento4, bmx7,
+	bpftool, brcmfmac_sdio-firmware-rpi, cfm, cups-pk-helper,
+	davinci-bootcount, dbus-cxx, embiggen-disk, freeipmi,
+	gocryptfs, kodi-pvr-plutotv, kodi-pvr-waipu, ksmbd-tools,
+	libcamera-apps, libest, libexecinfo, libfutils, libglvnd,
+	libks, libmd, libopenaptx, libpeas, libshdata, liburing, lilv,
+	lua-argon2, lua-cffi, lua-inotify, lv2, mali-driver,
+	moby-buildkit, modsecurity2, networkd-dispatcher, pahole,
+	php-apcu, php-lua, php-pam, python-argon2-cffi-bindings,
+	python-cssselect2, python-distro, python-fonttools,
+	python-gnupg, python-installer, python-memory-profiler,
+	python-mpd2, python-pep517, python-pydyf, python-pypa-build,
+	python-pyphen, python-tinycss2, python-tomli,
+	python-weasyprint, python-zopfli, qoriq-cadence-dp-firmware,
+	riscv-isa-sim, rockchip-mali, rpi-rgb-led-matrix, sdbus-cpp,
+	sentry-cli, serd, simple-mail, sord, sratom,
+	sunxi-mali-utgard, sunxi-mali-utgard-driver, tinifier, ulog,
+	vulkan-headers, xlib_libxcvt, zabbix, zchunk, zynaddsubfx
+
+	Removed packages: gstreamer1-mm, python, python-backports-abc,
+	python-backports-functools-lru-cache,
+	python-backports-shutil-get-terminal-size,
+	python-backports-ssl-match-hostname, python-configobj,
+	python-dialog, python-enum, python-enum34, python-functools32,
+	python-futures, python-id3, python-ipaddr, python-ipaddress,
+	python-mad, python-nfc, python-pam, python-pathlib2,
+	python-pycap, python-pyro, python-singledispatch,
+	python-subprocess32, python-typing, python-yieldfrom,
+	qt5webkit-examples, rpi-bt-firmware, rpi-wifi-firmware,
+	sunxi-mali-mainline, sunxi-mali-mainline-driver, zynq-boot-bin
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12271: python-iptables runtime dependencies
+	#13436: PPP 2.4.9 is out
+	#14351: needs to mount sysfs before mount -a
+	#14451: nodejs won't build on Fedora 35
+	#14471: alsa_utils wrong deployment
+	#14501: lttng-modules v2.11 package fails to build
+	#14531: Package EFL - build error
+
 2021.11.1, released January 29th, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 8a4ec4ef85..a4b7db69a7 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02-git
+export BR2_VERSION := 2022.02-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1638734000
+BR2_VERSION_EPOCH = 1644782000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 2d082062a2..3d98fe48ee 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2021.11.1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2021.11-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2022.02-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.11-rc3.tar.gz">buildroot-2021.11-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.11-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.02-rc1.tar.gz">buildroot-2022.02-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.02-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.11-rc3.tar.bz2">buildroot-2021.11-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.11-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.02-rc1.tar.bz2">buildroot-2022.02-rc1.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2022.02-rc1.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index d1dbc582a6..109dcb60f5 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.02-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>13 February 2022</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.02-rc1">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.02-rc1.tar.xz">2022.02-rc1
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
