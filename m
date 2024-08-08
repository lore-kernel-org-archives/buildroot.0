Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38947C52D71
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 20:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C0881E7C;
	Thu,  8 Aug 2024 20:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODL0-9Z3vrPt; Thu,  8 Aug 2024 20:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8129881E5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8129881E5B;
	Thu,  8 Aug 2024 20:58:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8B71BF86C
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BDF340BF7
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tm0UifvGCIVG for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 20:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8D8340226
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8D8340226
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 20:58:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAD02849F4; Thu,  8 Aug 2024 20:58:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Aug 2024 22:55:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdbc8d97cb166ce721df96acda6d291f6f2c4aa9
X-Git-Newrev: 32161a3c4e0c238e0e44ccfcadffc62f72f5c4e4
X-Patchwork-Hint: ignore
Message-Id: <20240808205823.CAD02849F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.08-rc1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32161a3c4e0c238e0e44ccfcadffc62f72f5c4e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES                    | 79 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 +--
 docs/website/download.html | 22 ++++++-------
 docs/website/news.html     | 21 ++++++++++++
 4 files changed, 113 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6567a41545..eef042823a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,82 @@
+2024.08-rc1, released August 8th, 2024
+
+	Fixes all over the tree (especially related to GCC 14.x
+	compatibility) and package updates.
+
+	Toolchains:
+	- uClibc updated to 1.0.49
+	- GDB 15.x added, GDB 14.x now the default
+	- GCC 14.x updated to GCC 14.2.0
+	- Support for Linux 6.9/6.10 headers added
+
+	Infrastructure:
+	- Patches on packages are now applied with -F0, which means no
+	  fuzz is accepted anymore.
+	- Improvements to the canonical example of SysV init script
+
+	New defconfigs: arm_fvp_ebbr, beaglev_fire, cubieboard1,
+	imx6ulz_bsh_smm_m2_defconfig, spike_riscv32,
+
+	Removed defconfigs: beagleboardx15, beaglev, imx8mpico
+
+	New packages: blake3, chicken, cloudfared, docker-cli-buildx,
+	espflash, fd, freescale-imx/firmware-upower, fwupd, fwupd-efi,
+	gtkiostream, graphene, kmon, libavif, libdex, libgtk4,
+	libjcat, libopenmpt, libtpms, mxt-app, nethogs, openconnect,
+	parsec-tool, pico-sdk, picotool, python-aerich,
+	python-autocommand, python-betterproto, python-configobj,
+	python-grpclib, python-inflect, python-jaraco-collections,
+	python-jaraco-context, python-jaraco-text, python-pyasynchat,
+	python-pyasyncore, python-dictdiffer, python-pkgconfig,
+	python-pypika-tortoise, python-ruamel-yaml-clib,
+	python-tomlkit, python-tomli-w, python-tpm2-pytss,
+	python-tortoise-orm, python-uswid, qt6declarative,
+	qt6languageserver, qt6mqtt, qt6opcua, qt6shadertools,
+	qt6tools, qt6virtualkeyboard, qt6wayland, qt6websockets,
+	skopeo, sqlitecpp, swipl, swtpm, tig, tipidee, tpm2-openssl,
+	xilinx-prebuilt, zoxide
+
+	Removed packages: beaglev-ddrinit, beaglev-secondboot,
+	beecrypt, cgic, dvb-apps, gamin
+
+	New runtime tests: 4th, attr, atftp, bcc, btrfs, btrfsprogs,
+	dmidecode, go, gpsd, iproute2, kmod, lame, make, mariadb,
+	mawk, mosquitto, nmap, ntp, python-asn1crypto, python-pymupdf,
+	python-ruamel-yaml, rt-tests, swipl, vorbis-tools, xfsprogs
+
+	Issues resolved:
+	- Are there plans to add raspberrypizero2w_64_defconfig config?
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/1
+	- Some folders can't visit and some file is missing while running
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/2
+	- wpewebkit build fails on ARM Neon
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/3
+	- TAR-1.35 will not build for target (host-variant will build)
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/4
+	- package/xz without shared libraries breaks Python build
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/5
+	- unable to build - 404 at sources.buildroot.net
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/10
+	- OpenSSH 9.8 broken
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/11
+	- Update Openssh to Version 9.8p1 (CVE-2024-6387) in Long Term
+	  Support Release 2024.02.x
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/14
+	- Toolchain (host-gcc-final-14.1.0) build failure with
+	  y2038/BR2_TIME_BITS_64 enabled
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/16
+	- building go/golang gives error
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/18
+	- GCC 13.3 is missing
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/20
+	- package containerd update to avoid hanging docker exec
+	  commands
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/21
+	- "BR2_EXTERNAL broken missing srctree error Config.in"
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/24
+	- Can't subscribe buildroot mailing list
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/25
+
 2024.05.1, released July 13th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index f51e8f690f..284a0bb20e 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.08-git
+export BR2_VERSION := 2024.08-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1718188000
+BR2_VERSION_EPOCH = 1723149000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index ce859c43b5..9a36d5c5d8 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2024.05.1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2024.05-rc2</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2024.08-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.05-rc2.tar.gz">buildroot-2024.05-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.05-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.08-rc1.tar.gz">buildroot-2024.08-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.08-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.05-rc2.tar.xz">buildroot-2024.05-rc2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.05-rc2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.08-rc1.tar.xz">buildroot-2024.08-rc1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.08-rc1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 6b0d4c721a..001b471d4c 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.08-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 August 2024</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+          <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2024.08-rc1">CHANGES</a>
+          file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+          <a href="/downloads/buildroot-2024.08-rc1.tar.xz">2024.08-rc1
+            release</a>, and report any problems found to the
+          <a href="support.html">mailing list</a> or
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
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
