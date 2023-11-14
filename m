Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B2EC4332F
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 07:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D4264176E;
	Tue, 14 Nov 2023 07:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D4264176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NdcfbmkYpT2o; Tue, 14 Nov 2023 07:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E958E417AD;
	Tue, 14 Nov 2023 07:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E958E417AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CB861BF364
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 07:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72EE1417AD
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 07:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72EE1417AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3nNZVdKZDO7 for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 07:25:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 136E84176E
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 07:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 136E84176E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E63938711A; Tue, 14 Nov 2023 07:25:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Nov 2023 08:25:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1ee7015a48e7820e74dc99c58708a732e14c0aa
X-Git-Newrev: 5c9f4d64de3b7d87909393c45cf98734645678ba
X-Patchwork-Hint: ignore
Message-Id: <20231114072529.E63938711A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.11-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c9f4d64de3b7d87909393c45cf98734645678ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 88 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 +--
 docs/website/download.html | 22 ++++++------
 docs/website/news.html     | 21 +++++++++++
 4 files changed, 122 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7f31e8793e..585f4e9380 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,91 @@
+2023.11-rc1, released November 14th, 2023
+
+	Fixes all over the tree and new features.
+
+	Architecture: MIPS IV (re-)added. The mutually exclusive ABI
+	selection dropped for PowerPC.
+
+	Toolchain:
+
+	- Support for GDB 13.2, make GDB 12.x the default
+
+	- Glibc bumped to 2.38
+
+	- Bootlin external toolchains updated to 2023.08, bringing
+          support for Aarch64 BE with musl.
+
+	- Motorola 68K w/MMU support added for glibc and musl.
+
+	- License info added for GCC
+
+	Infrastructure:
+
+	- The CMake infrastructure now supports building packages with
+          ninja instead of make (based on <pkg>_CMAKE_BACKEND).
+
+	- The RPATH fixup done at the end of the build is now done in
+          parallel (according to BR2_JLEVEL).
+
+	- Packages downloaded from Subversion repos no longer
+          retrieves svn:externals unless <pkg>_SVN_EXTERNALS is set to
+          YES.
+
+	- Packages where a free-form version/site can be specified
+          (E.G. Linux, U-Boot, ..) can now have the corresponding
+          tarballs of these custom downloads checked by the download
+          infrastructure based on .hash files in the global patch
+          directory. These hashes are optional unless
+          BR2_DOWNLOAD_FORCE_CHECK_HASHES is enabled.
+
+	  A utils/add-custom-hashes helper script has been added to
+          assist in managing such hash files.
+
+	- Various improvements to utils/docker-run to handle external
+          (BR2_DL_DIR defined in environment) download directory,
+          proxy configuration, SELinux and out of tree (O=) builds.
+
+	New defconfigs: AMD Zynq ZC702, ASUS Tinker-s rk3288, ICnova
+	A20-adb4006, Khadas vim3, Libre Computer ROC-RK3399-PC,
+	Microchip PolarFire SoC Icicle Kit, NXP imxrt1050-evk, Pine64
+	pinecube, Sipeed LicheePi Nano, Synopsys ARC700 nSIM, TI
+	SK-AM62 and TI SK-AM64
+
+	New packages: ti-k3-boot-firmware, ti-k3-image-gen,
+	amlogic-boot-fip, criu, cutekeyboard, depot-tools, fft-eval,
+	firewalld, flutter-engine, flutter-gallery, flutter-pi,
+	flutter-sdk-bin, ledmon, libcanberra, libnvme, libsoup3,
+	libspdm, libucontext, libzenoh-pico,
+	microchip-hss-payload-generator, nodejs-bin, nushell,
+	nvidia-persistenced, oatpp, onevpl-intel-gpu, onevpl,
+	python-calver, python-distlib, python-jeepney,
+	python-jsonschema-specifications, python-kmod,
+	python-pysensors, python-referencing, python-segno,
+	python-tftpy, python-trove-classifiers,
+	python-types-python-dateutil, python-versioneer,
+	qoriq-fm-ucode, qt6core5compat, rauc-hawkbit-updater,
+	rust-bindgen, spirv-headers, spirv-tools, vulkan-loader,
+	vulkan-tools
+
+	Removed packages: google-material-design-icons, libtextstyle,
+	python-pyxb
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14366: Nodejs fails with "version `GLIBC_2.34' not found"..
+	#14741: e2fsck is failing during cronjob build where fail...
+	#15628: Missing dependencies in BR2_PACKAGE_PYTHON_MAKO
+	#15733: xfsprogs outdated
+	#15772: lz4 failed to compile with gcc 10.4.0
+	#15778: strace comilation fails on Fedora39/gcc13
+	#15787: atmel_sama5d3_xplained_mmc_defconfig: Missing...
+	#15790: at91sam9x5ek_dev_defconfig: Missing...
+	#15808: connman is not supported on musl
+	#15814: C++ not supported by bootlin toolchain
+	#15820: make linux-menuconfig does not modify correct .config..
+	#15823: Installing nodejs modules with native extensions ...
+	#15826: nodejs modules with native extensions fail to install
+	#15835: Incompatibility between network-manager and libcurl 8.4
+
 2023.08.2, released October 15th, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index b9acd7e650..8e3e745b38 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.11-git
+export BR2_VERSION := 2023.11-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1694030000
+BR2_VERSION_EPOCH = 1699946000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 392c45da29..046674ac7f 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2023.08.2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2023.08-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2023.11-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.08-rc3.tar.gz">buildroot-2023.08-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.08-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.11-rc1.tar.gz">buildroot-2023.11-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.11-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.11-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.11-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.08-rc3.tar.xz">buildroot-2023.08-rc3.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.08-rc3.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.11-rc1.tar.xz">buildroot-2023.11-rc1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.11-rc1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 6ea27cdacd..1604f08e2f 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.11-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>14 November 2023</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.11-rc1">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.11-rc1.tar.xz">2023.11-rc1
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
