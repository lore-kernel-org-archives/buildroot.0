Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D0AC54E41
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 11:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFFA981FAF;
	Sun, 25 Feb 2024 11:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7lGBnxCEZ-i; Sun, 25 Feb 2024 11:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACE5681FA8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACE5681FA8;
	Sun, 25 Feb 2024 11:44:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA8241BF4E6
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 11:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95F5740688
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 11:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0L2c-HEdnmu6 for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 11:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37BD94072E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37BD94072E
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 11:44:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBF5887A9B; Sun, 25 Feb 2024 11:44:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 12:43:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bedcd1cd39c7654d1243e2cb0f4a68870f67782c
X-Git-Newrev: 7a9ba7a71e49f11e2c8d28a578ddef3a1ad96064
X-Patchwork-Hint: ignore
Message-Id: <20240225114420.CBF5887A9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.02-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a9ba7a71e49f11e2c8d28a578ddef3a1ad96064
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 59 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 ++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++
 4 files changed, 93 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index f3c38e7d03..3abd4b2281 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,62 @@
+2024.02-rc1, released February 25th, 2024
+
+	Fixes all over the tree and new features.
+
+	Toolchain:
+
+	- GDB: Add version 14.1, default to 13.2.
+
+	- uClibc-ng updated to 1.0.45
+
+	- Bootlin external toolchains updated to 2023.11-1, moving the
+          stable toolchains to GCC 12.3 / binutils 2.40 / GDB 13.2 /
+          glibc 2.38 / musl 1.2.4 / uClibc-ng 1.0.45
+
+	- Add support for building a bare metal toolchain suitable for
+	  building firmware for certain (co-)processors, possibly
+	  using a different CPU architecture than the main Buildroot
+	  configuration.
+
+	Default optimization level changed from optimize for size
+        (-Os) to optimize for speed (-O2).
+
+	Support: Use the Fraunhofer FKIE JSON files for CVE matching
+	now that NVD is about to deprecate its feeds.
+
+	New defconfigs: AMD Zynqmp kria kd240 and kr260, zcu104, Avnet
+	RZBoard V2L, Mangopi MQ1RDW2, NXP i.MX 93 11x11 EVK, QEMU
+	Riscv64 virt-efi, TI AM574x Industrial Development Kit
+
+	Removed defconfigs: Zynq qmtech
+
+	New packages: binutils-bare-metal, dmenu-wayland, fcft, foot,
+	firmware-ele-imx, ivi-homescreen, libjwt, libtraceevent,
+	libtracefs, libutempter, lua-ansicolors, lua-argparse,
+	lua-conciseserialization, lua-ubjson, minisign,
+	newlib-bare-metal, python-aiosqlite, python-annotated-types,
+	python-anyio, python-asyncssh, python-bitarray,
+	python-cachetools, python-contourpy, python-decouple,
+	python-fastapi-sessions, python-fastapi,
+	python-google-api-core, python-google-auth,
+	python-googleapis-common-protos, python-grpc-requests,
+	python-grpcio-reflection, python-grpcio, python-httpcore,
+	python-httpx, python-matplotlib-inline, python-ml-dtypes,
+	python-multipart, python-pydantic-core, python-pypng,
+	python-starlette, python-tcolorpy, python-trafaret,
+	python-urwid-readline, python-uvicorn, rlwrap, tllist
+
+	Removed packages: davinci-bootcount (renamed to
+	uboot-bootcount), flickcurl, gmpc, libmpd, micropython-lib,
+	python-crossbar, python-pygame, tinymembench
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10096: SH4 toolchain does not build Linux kernel magicpanelr2_..
+	#15889: please update meson
+	#15898: Unable to boot syslinux.efi produced by buildroot (EFI 64-..
+	#15910: USB keyboard is not working by default "raspberrypicm4io_..
+	#15952: Grub fails to load large rootfs files
+
 2023.11.1, released January 15th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index ac625152c6..dc1271825e 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02-git
+export BR2_VERSION := 2024.02-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1701677000
+BR2_VERSION_EPOCH = 1708860000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index e13d94cc5a..ece22e409d 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2023.11.1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2023.11-rc2</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2024.02-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.11-rc2.tar.gz">buildroot-2023.11-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.11-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.02-rc1.tar.gz">buildroot-2024.02-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.02-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.11-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.02-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.11-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.02-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.11-rc2.tar.xz">buildroot-2023.11-rc2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.11-rc2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.02-rc1.tar.xz">buildroot-2024.02-rc1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.02-rc1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index e052c99803..89dc740699 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.02-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>25 February 2024</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2024.02-rc1">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.02-rc1.tar.xz">2024.02-rc1
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
