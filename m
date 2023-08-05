Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08D4C001DE
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 21:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3528C60D68;
	Sat,  5 Aug 2023 21:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3528C60D68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3I13iB4wp2Jz; Sat,  5 Aug 2023 21:14:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 428AE60812;
	Sat,  5 Aug 2023 21:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 428AE60812
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FB931BF28F
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07E2660BC1
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07E2660BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQAlJtMn5Si6 for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 21:14:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31A3660B8B
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 21:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31A3660B8B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EB0183DB8; Sat,  5 Aug 2023 21:14:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Aug 2023 23:03:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 837ab4708cbfb8f44ec2da23ef23e0a0dfa8eb7c
X-Git-Newrev: 0473a9b521f13b56ee0745e7364e392e8740110b
X-Patchwork-Hint: ignore
Message-Id: <20230805211423.1EB0183DB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.08-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0473a9b521f13b56ee0745e7364e392e8740110b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES                    | 33 +++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 67 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6ca8a2c58d..5ed0568bec 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,36 @@
+2023.08-rc1, released August 5, 2023
+
+	Numerous package updates and fixes, additional runtime tests.
+
+	Toolchain:
+	- Toolchains from ARM (for ARM, AArch64 and AArch64 BE)
+          updated to 12.2.
+	- Support for binutils 2.40 and 2.41 added, binutils 2.37 and
+          2.38 removed, binutils 2.40 is now the default
+	- Support for gcc 13 added, gcc 10 removed, gcc 12 is now the
+          default
+
+	Architectures:
+	- Additional x86-64 variants added
+	- RISC-V vector extension support added
+
+	Infrastructure:
+	- Go now built in 3 stages to be able to update to Go 1.20.x.
+
+	New defconfigs: rock5b
+
+	Removed defconfigs: qemu_sparc_ss10
+
+	New packages: composer, conmon, dfu-programmer, esp-hosted,
+	kodi-imagedecoder-heif, kodi-imagedecoder-raw, libde2654,
+	libdisplay-info, libheif, llvm-cmake, llvm-libunwind,
+	lua-dkjson, mbpoll, mdnsd, mhz, opencsd, python-libconf,
+	python-blinker, python-midiutil, python-rdps-py, python-wheel,
+	qt6svg, redis-plus-plus, rockchip-rkbin, rtl8822cs, swaybg,
+	swugenerator
+
+	Removed packages: libasplib, ocf-linux, tovid
+
 2023.05.1, released July 17th, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 09b2066f05..080136bc9a 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.08-git
+export BR2_VERSION := 2023.08-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1686172000
+BR2_VERSION_EPOCH = 1691269000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 732554233e..3d5e2b37de 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2023.05.1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest release candidate: <b>2023.05-rc3</b></h3>
+
+      <h3 style="text-align: center;">Latest release candidate: <b>2023.08-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.05-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.05-rc3.tar.gz">buildroot-2023.05-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.05-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.08-rc1.tar.gz">buildroot-2023.08-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.08-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.05-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.05-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.05-rc3.tar.xz">buildroot-2023.05-rc3.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.05-rc3.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.08-rc1.tar.xz">buildroot-2023.08-rc1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.08-rc1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index acd3ffeee4..a338b15acf 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.08-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 August 2023</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over
+	  the tree, see
+	  the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.08-rc1">CHANGES</a>
+	  file for more details.</p>
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+          <a href="/downloads/buildroot-2023.08-rc1.tar.xz">2023.08-rc1
+            release</a>, and report any problems found to the
+          <a href="support.html">mailing list</a> or
+          <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
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
