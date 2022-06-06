Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BA8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 20:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB36284093;
	Mon,  6 Jun 2022 20:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNMEIzPN5ytM; Mon,  6 Jun 2022 20:14:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABF4584090;
	Mon,  6 Jun 2022 20:14:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EF1B1BF297
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BCBA415B1
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-nizcBpx-Pk for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 20:14:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDCFE415A2
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 20:14:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1528086DD3; Mon,  6 Jun 2022 20:02:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 22:14:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 487f4b0da9c2ffb0328b3a7d4b59384d29b395b9
X-Git-Newrev: 730baf05bfebac721bf5002d72787937a4da6378
X-Patchwork-Hint: ignore
Message-Id: <20220606200229.1528086DD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.05
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

commit: https://git.buildroot.net/buildroot/commit/?id=730baf05bfebac721bf5002d72787937a4da6378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 23 +++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 26 +++++++++++++-------------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5d8eb2f563..801af5b950 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2022.05, released June 6th, 2022
+
+	Fixes all over the tree.
+
+	Rework BR2_STATIC_LIBS handling to ensure it can only be
+	enabled if a suitable C library is available.
+
+	Updated/fixed packages: arm-trusted-firmware, at91bootstap,
+	boinc, boost, cpulimit, diffutils, edk2, eigen, fbv, gcr,
+	gensio, glibc, go, gtest, iucode-tool, kvm-unit-tests, libcec,
+	libcurl, libks, linux, linux-tools, lttng-modules, mariadb,
+	memcached, mono, musl, mutt, netdata, network-manager, nginx,
+	ogre, openjpeg, openvpn, pipewire, python-crossbar, qemu,
+	qpid-proton, rauc, rockchip-mali, rsyslog,
+	rtl8812au-aircrack-ng, ruby, runc, rustc, samba4, tiff,
+	uclibc, unrar, vim, webkitgtk, wpewebkit,
+	xdriver_xf86-video-ati, xml-security-c, zchunk, zlib-ng
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14821: Samba server is failing to compile
+	#14826: make qemu_x86_64_defconfig stopped working
+
 2022.05-rc2, released May 30th, 2022
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 24f8a7338f..27b8051710 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.05-rc2
+export BR2_VERSION := 2022.05
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1653928000
+BR2_VERSION_EPOCH = 1654546000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 1405e9b6e1..a30a186e6a 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -8,7 +8,7 @@
     <div class="panel-heading">Download</div>
     <div class="panel-body">
 
-      <h3 style="text-align: center;">Latest stable / long term support release: <b>2022.02.2</b></h3>
+      <h3 style="text-align: center;">Latest long term support release: <b>2022.02.2</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -41,41 +41,41 @@
 	  <p><a href="/downloads/buildroot-2022.02.2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-<!--
-      <h3 style="text-align: center;">Latest stable release: <b>2021.11.2</b></h3>
+
+      <h3 style="text-align: center;">Latest stable release: <b>2022.05</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.11.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.05.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2021.11.2.tar.gz">buildroot-2021.11.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.11.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.05.tar.gz">buildroot-2022.05.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.05.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.11.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.05.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.11.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.05.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.11.2.tar.xz">buildroot-2021.11.2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.11.2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.05.tar.xz">buildroot-2022.05.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.05.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2022.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2022.05-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 4b75b68a83..691e3bfd88 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.05 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 June 2022</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2022.05 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.05">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.05.tar.xz">2022.05 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index e343cf432e..21e3455ae1 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.02.2'
+RELEASE='2022.05'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
