Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5589DC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1BFB70295;
	Tue, 21 Feb 2023 02:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1BFB70295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dMaz3DPlpTWD; Tue, 21 Feb 2023 02:05:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D40D47025B;
	Tue, 21 Feb 2023 02:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D40D47025B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48DD01BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 088F770046
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 088F770046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSloPBLyaN6D for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 974BA70050
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 974BA70050
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 936E7828C8; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 21:13:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4c7fcbbe75de5c535e8d5dd7182900b6d09e2b03
X-Git-Newrev: e8c4b360fd40e5b266c851588a81aff102afaec7
X-Patchwork-Hint: ignore
Message-Id: <20230220205303.936E7828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2023.02-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8c4b360fd40e5b266c851588a81aff102afaec7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 85 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 +--
 docs/website/download.html | 22 ++++++------
 docs/website/news.html     | 21 ++++++++++++
 4 files changed, 119 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9fd8b31350..21e349f3a8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,88 @@
+2023.02-rc1, released February 20th, 2023
+
+	Numerous package updates and many (62) new packages.
+
+	Toolchain:
+
+	- The check for access to "unsafe" (E.G. from the build host)
+	  header files and libraries by the cross compiler is now
+	  unconditionally enabled.
+
+	- Bootlin external toolchains updated to 2022.08
+
+	- The handling of the CCACHE_* environment variables by the
+          toolchain wrapper is now more strict, causing the variables
+          to only be exported when BR2_CCACHE is enabled.
+
+	Infrastructure:
+
+	- Br2-external: Fix make performance issue when many (> 6)
+	  external trees are used together.
+
+	- Legal-info: Stop warning about not saving sources for local
+	  / override packages if <PKG>_REDISTRIBUTE is set to NO.
+
+	- Go: Ensure our go build and module cache is used, even for the
+	  download step.
+
+	- Cargo: CARGO_HOME (the location where cargo stores it
+          downloaded artifacts) is now located under DL_DIR rather
+          than in HOST_DIR/share/cargo, ensuring it is shared between
+          builds.
+
+	Misc:
+
+	- Erofs: Use fixed timestamp and UUID when BR2_REPRODUCIBLE is
+	  used.
+
+	- Ext2: Year 2038+ compatible inodes are now used by default,
+          independently of the filesystem size.
+
+	- Linux: Fix build of < 5.6 kernels with host-gcc >= 10.
+
+	A large number of NXP related packages and defconfigs have
+	been updated as upstream moved the git repositories to Github.
+
+	New defconfigs: i.MX8mn BSH SMM S2 / pro, QEMU ARM EBBR,
+	Sipeed Lichee rv / rv dock, Starfive Visionfive2, Xilinx Versal
+	VCK190.
+
+	New packages: catch2, cli11, dotconf, edk2-non-osi,
+	fluent-bit, fxdiv, hddtemp, highway, imx-vpu-hantro-daemon,
+	libjxl, libsolv, libunibreak, neon-2-sse, open-iscsi,
+	opencv4-contrib, perftest, perl-image-exiftool,
+	python-apispec, python-async-generator, python-cppy,
+	python-dbus-fast, python-dicttoxml2, python-flask-smorest,
+	python-h11, python-hkdf, python-magic-wormhole,
+	python-magic-wormhole-mailbox-server,
+	python-magic-wormhole-transit-relay, python-marshmallow,
+	python-munch, python-outcome, python-pycrate, python-pyspnego,
+	python-reedsolo, python-selenium, python-smbprotocol,
+	python-sniffio, python-spake2, python-trio,
+	python-trio-websocket, python-uhid, python-webargs,
+	python-wsproto, qt5speech, qt6serialbus, rdma-core, reproc,
+	rtl8723ds-bt, rtl8821cu, sexpect, speechd, sscep, stb, sway,
+	termcolor, ti-k3-r5-loader, tl-expected, unifdef,
+	versal-firmware, xwayland, z3
+
+	Removed packages: docker-proxy, elixir, gummiboot,
+	python-bunch, python-m2r, sun20i-d1-spl, ucl,
+	xdriver_xf86-input-keyboard, xdriver_xf86-video-glint,
+	xdriver_xf86-video-imx-viv, xdriver_xf86-video-tga
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14971: Kernel 3.10.108 fail to build in Buildroot 2022.08-rc1
+	#14996: Too many directories in BR2_EXTERNAL causes hang during make
+	#15161: kernel can't support SUBDIR
+	#15196: Setting BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE does not work
+	#15226: lsblk: not found
+	#15271: no start-qemu.sh
+	#15281: Error compiling GDAL library for RPi-64 if libgdal-dev install..
+	#15291: BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS without location
+	#15301: Selecting NAND Flash boot media (NAND_BOOT) breaks the uboot..
+	#15331: Warning on python-flit-core license when generating legal info
+
 2022.11.1, released January 18th, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 4880b426b5..c97086c09c 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.02-git
+export BR2_VERSION := 2023.02-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1669308000
+BR2_VERSION_EPOCH = 1676923000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index a7efef1ef3..a6b9a9a7c4 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,38 +75,38 @@
 	  <p><a href="/downloads/buildroot-2022.11.1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2022.11-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2023.02-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.11-rc3.tar.gz">buildroot-2022.11-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.11-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.02-rc1.tar.gz">buildroot-2023.02-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.02-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.11-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.11-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.02-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.11-rc3.tar.xz">buildroot-2022.11-rc3.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.11-rc3.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.02-rc1.tar.xz">buildroot-2023.02-rc1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.02-rc1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
@@ -114,7 +114,7 @@
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
   </div>
--->
+
   <div class="panel panel-primary">
     <div class="panel-heading">Source code</div>
     <div class="panel-body">
diff --git a/docs/website/news.html b/docs/website/news.html
index 687efeb377..8acf454052 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.02-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 February 2023</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.02-rc1">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.02-rc1.tar.xz">2023.02-rc1
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
