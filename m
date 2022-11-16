Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F4EC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D5B42B04;
	Mon, 20 Feb 2023 21:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51D5B42B04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28L8X-cSJzyE; Mon, 20 Feb 2023 21:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C818942DA6;
	Mon, 20 Feb 2023 21:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C818942DA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FB541BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 182F16109E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 182F16109E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28_cevdfup3w for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17C9461081
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17C9461081
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A26C86494; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 13:58:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ec9519831ed5d5698c787b48d2ab952525cacb93
X-Git-Newrev: 90f2700c09359b5f7627a1632bdcff911a6c5576
X-Patchwork-Hint: ignore
Message-Id: <20230220205151.0A26C86494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2022.11-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=90f2700c09359b5f7627a1632bdcff911a6c5576
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 26 ++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3090466d2e..abee6d9fac 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,29 @@
+2022.11-rc2, released November 16th, 2022
+
+	Fixes all over the tree.
+
+	Removed defconfigs: Amarule a64 relic, ARM Juno, Bananapi M1 /
+	M1 plus / M2 plus / M64, FriendlyARM NanoPC T4 / A64 / M1 / M1
+	plus / M4 / Neo2 / Neo4 / Neo plus2 / R1 / Orangepi PC2 / Plus
+	/ Prime / rk3399 / Win, Rock PC rk3399 / PI4 / N10.
+
+	Updated/fixed packages: alsa-utils, arm-trusted-firmware,
+	bdwgc, boost, botan, ca-certificates, crun, dbus-broker,
+	docopt-cpp, dracut, efivar, freeipmi, gawk, gensio, gptfdisk,
+	gsl, guile, imagemagick, ipmitool, libidn2, libkcapi,
+	libopenssl, libqb, libuhttpd, libvncserver, linux,
+	linux-tools, lxc, makedumpfile, matchbox-startup-monitor,
+	mdio-tools, multipath-tools, mupdf, ntfs-3g, numactl,
+	perl-net-ssleay, pixman, procps-ng, rpi-userland, rsync,
+	s6-linux-init, socat, strongswan, sudo, swupdate, systemd,
+	udisks, vlc, wavemon, wolfssl, zlib-ng
+
+	Removed packages: libdcadec
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15121: make nconfig failes with nvidia drivers and mesa3d selected
+
 2022.11-rc1, released November 3rd, 2022
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 7c1c07a2e4..b2f342f4a8 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.11-rc1
+export BR2_VERSION := 2022.11-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1667490600
+BR2_VERSION_EPOCH = 1668603000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 98a4d3a28e..9f2a81eb2b 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2022.11-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2022.11-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.11-rc1.tar.gz">buildroot-2022.11-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.11-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.11-rc2.tar.gz">buildroot-2022.11-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.11-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.11-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.11-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.11-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.11-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.11-rc1.tar.xz">buildroot-2022.11-rc1.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.11-rc1.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.11-rc2.tar.xz">buildroot-2022.11-rc2.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.11-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index c228c1f1e6..ba6e85f2e3 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.11-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 November 2022</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2022.11-rc2 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.11-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.11-rc2.tar.xz">2022.11-rc2
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
