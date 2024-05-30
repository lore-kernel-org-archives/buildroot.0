Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CD4C25B74
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 20:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E64284341;
	Thu, 30 May 2024 20:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VuZIk_cpyg2u; Thu, 30 May 2024 20:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0F3784335
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0F3784335;
	Thu, 30 May 2024 20:51:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 431BE1D4B29
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 20:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AB9484335
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 20:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjEQQ50TQpwA for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 20:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D25784333
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D25784333
 for <buildroot@buildroot.org>; Thu, 30 May 2024 20:50:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9AB28778E; Thu, 30 May 2024 20:50:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 May 2024 22:49:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 091ad8455da98fb7abc5af22e7a4c36f64c0783e
X-Git-Newrev: e5173e0131b0e938f787fb03780bc552efc8f5aa
X-Patchwork-Hint: ignore
Message-Id: <20240530205058.E9AB28778E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.05-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5173e0131b0e938f787fb03780bc552efc8f5aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 79 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 +--
 docs/website/download.html | 22 ++++++-------
 docs/website/news.html     | 21 ++++++++++++
 4 files changed, 113 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 13ac108549..b2bdde5069 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,82 @@
+2024.05-rc1, released May 30th, 2024
+
+	Fixes all over the tree and new features.
+
+        Toolchains:
+        - Binutils 2.24 added, 2.39 dropped, 2.41 is now default
+        - GCC 14.x added, 11.x dropped, 13.x is now default
+        - uClibc-ng bumped to 1.0.48
+        - Musl bumped to 1.2.5, adds riscv32 support
+        - Glibc bumped to 2.39, libcrypt no longer available (see
+          libxcrypt package)
+        - External glibc based toolchains no longer install libcrypt
+          files (except for libcrypt.so.1) to not conflict with the
+          libxcrypt package
+        - Bootlin external toolchains updated to 2024.02
+        - Support for external toolchains using GCC version 14
+        - Old external Codesourcery ARM/AARCH64 toolchains removed
+        - Old external Codesourcery niosII toolchain removed
+        - Old external Codescape mips toolchains removed
+        - Support for Linux 6.7 / 6.8 kernel headers added
+
+	Architecture:
+        - Support for riscv32 noMMU added
+        - Internal toolchains for SPARC (re-)added
+        - Support for the Motorola m68k specific shared library
+	  support for the FLAT binary format dropped, as support has
+	  been removed from the Linux kernel as of v5.19.
+
+        Download (notice, Buildroot generated tarballs have changed):
+        - Tar 1.35 is now required (will be automatically built if not
+          available on the host). Notice that tar 1.35 changes the way
+          devmajor/minor is stored, so tarballs created with 1.35 are
+          not binary identical to <1.35
+        - The tarball creation logic has now been extended to
+          correctly handle when ACLs are set on the download
+          directory.
+        - An issue with conflicting git tags between (different
+          versions of) a package has been fixes
+        - Git attributes are now handled correctly
+
+        Security:
+        - The /dev/shm entry in the default /etc/fstab used for
+          busybox and sysv init systems was missing the sticky bit,
+          allowing users to delete and replace other users files.
+
+        Infrastructure:
+        - kconfig/menuconfig can now be built with GCC 14.x
+        - Git is now used to to fetch CVE data from the FKIE
+	  repository to work around an issue with missing meta files
+	  in the releases.
+        - utils/check-package now also checks if defconfigs use
+          BR2_DOWNLOAD_FORCE_CHECK_HASHES to ensure custom
+          bootloader/kernels are correctly downloaded.
+
+        New defconfigs: Beagleboneai64, Orangepi Zero2w, Pine64 star64
+
+	New packages: basu, bats-assert, bats-file, bats-support, bcc,
+	bpftrace, export-subst, flutter-adaptive-scaffold-example,
+	flutter-animations-example, flutter-dynamic-layouts-example,
+	flutter-go-router-example, flutter-image-example,
+	flutter-markdown-example, flutter-packages,
+	flutter-rfw-local-example, go-bootstrap-stage3, igt-gpu-tools,
+	libgpiod2, libxmlb, libzenoh-c, lmdb, lua-lightningmdb,
+	lua-lsdbus, mokutil, python-email-validator,
+	python-expandvars, python-fastui, python-hid, python-jc,
+	python-mpmath, python-poetry-core, python-sympy,
+	python-yamllint, qbee-agent, starfive-spltool, ustreamer
+
+	Removed packages: flutter-gallery, omxplayer, ti-k3-image-gen
+
+	Issues resolved (http://bugs.uclibc.org):
+
+        #14416: Mesa3D missing DRI3 support for various Gallium drivers
+        #15766: BR2_PACKAGE_WESTON_XWAYLAND -- 12.0.1 -- fails to build..
+        #15997: Build Squid with GCC12.3 in Buildroot 2024.02 will fail
+        #16009: 'select' does not work with 'choice'
+        #16036: android-tools version is too old
+        #16075: Cannot use linux kernel extensions from external tree..
+
 2024.02.2, released May 7th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index d1caec63b5..40f862b515 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.05-git
+export BR2_VERSION := 2024.05-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1709640000
+BR2_VERSION_EPOCH = 1717102000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index cc83d42a9f..b6793870a8 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2023.11.2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
-      <h3 style="text-align: center;">Latest release candidate: <b>2024.02-rc2</b></h3>
+-->
+      <h3 style="text-align: center;">Latest release candidate: <b>2024.05-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.02-rc2.tar.gz">buildroot-2024.02-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.02-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.05-rc1.tar.gz">buildroot-2024.05-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.05-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.02-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.02-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.02-rc2.tar.xz">buildroot-2024.02-rc2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.02-rc2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.05-rc1.tar.xz">buildroot-2024.05-rc1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.05-rc1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 072523dd65..e13def66cf 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.05-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 May 2024</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2024.05-rc1">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.05-rc1.tar.xz">2024.05-rc1
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
