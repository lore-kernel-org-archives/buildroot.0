Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE1EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 22:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFF1140892;
	Sun, 20 Feb 2022 22:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xm5p3DTSq3GT; Sun, 20 Feb 2022 22:25:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E66FE40571;
	Sun, 20 Feb 2022 22:25:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1718A1BF393
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 22:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05F3C81446
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 22:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5fNMsA4UBcxV for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 22:25:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29FF381445
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 22:25:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 41DA082302; Sun, 20 Feb 2022 22:17:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 23:24:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41feca427fdb91b50b442a5c540ba824755ea76b
X-Git-Newrev: f3d0d7e6ff1d1c723c3ab0c338d4ddf1ae415e69
X-Patchwork-Hint: ignore
Message-Id: <20220220221731.41DA082302@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3d0d7e6ff1d1c723c3ab0c338d4ddf1ae415e69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 21 +++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 53 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4cc574d928..31315cad34 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,24 @@
+2022.02-rc2, released February 20th, 2022
+
+	Fixes all over the tree.
+
+	Defconfigs: Friendlyarm Nanopi R2S: Fix U-Boot build, Kontron
+	BL i.MX8M Mini: Fix U-Boot build, PC Engines APU2: Fix Linux
+	build, ROC-RK3399-PC: Bump rootfs size to fix build
+
+	Updated/fixed packages: apache, apparmor, apr-util, arp-scan,
+	binutils, bluez5_utils, connman, cryptsetup, dnsmasq,
+	dovecot-pigeonhole, expat, gdk-pixbuf, gst1-plugins-base,
+	guile, keepalived, kodi, libbpf, libglvnd, libgsasl, libiconv,
+	librsvg, libuhttpd, libusb, libv4l, luasyslog, mongrel2, neon,
+	pcre, perl-netaddr-ip, php, psmisc, python-ipython,
+	python-pycli, python-pygame, python-regex, python-twisted,
+	qt5location, qt5webkit, resiprocate, rygel, safeclib,
+	sdl2_ttf, socketcand, strongswan, sudo, systemd, toolchain,
+	urg, webkitgtk, wireless-regdb, wpewebkit,
+	xdriver_xf86-video-{ati,mach64,mga,r128,savage,tdfx}, xz, zfs,
+	zsh
+
 2022.02-rc1, released February 13th, 2022
 
 	Numerous package updates and many (80) new packages.
diff --git a/Makefile b/Makefile
index a4b7db69a7..d92438166f 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02-rc1
+export BR2_VERSION := 2022.02-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1644782000
+BR2_VERSION_EPOCH = 1645395000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 3d98fe48ee..7d9fad4d9f 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2022.02-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2022.02-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.02-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.02-rc1.tar.gz">buildroot-2022.02-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.02-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.02-rc2.tar.gz">buildroot-2022.02-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.02-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.02-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.02-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.02-rc1.tar.bz2">buildroot-2022.02-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2022.02-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.02-rc2.tar.bz2">buildroot-2022.02-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2022.02-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 109dcb60f5..e571c86a2e 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.02-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 February 2022</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2022.02-rc2 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.02-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.02-rc2.tar.bz2">2022.02-rc2
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
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
