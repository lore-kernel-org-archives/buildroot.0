Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27E4C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 16:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2121E40252;
	Thu, 22 Aug 2024 16:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIVgMWLnvg9W; Thu, 22 Aug 2024 16:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF21D40269
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF21D40269;
	Thu, 22 Aug 2024 16:21:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 894DB1BF39A
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 16:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7534360E18
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 16:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORzbBnPpAwDO for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 16:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 131386066B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 131386066B
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 16:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F19A7862CA; Thu, 22 Aug 2024 16:21:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 18:21:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91cd1bef728c8d2850504a66fdae89af5c0ef258
X-Git-Newrev: 106a098b7bd5520385981366abf5ef423deb7517
X-Patchwork-Hint: ignore
Message-Id: <20240822162153.F19A7862CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.08-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=106a098b7bd5520385981366abf5ef423deb7517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 23 +++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index d5c5badaf1..076d6162e1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2024.08-rc2, released August 22nd, 2024
+
+	Fixes all over the tree.
+
+	Infrastructure: use "-ztext" rather than "-z text" in LDFLAGS
+	to work around buggy build systems
+
+	Defconfigs: Beaglev fire / Microchip mpfs icicle: Correct
+	Linux/U-Boot tarballs, Raspberryi 5: Correct CPU setting,
+	Zynqmp zcu106: use v1.0 DDR config, Zynqmp zcu10* / kria*:
+	Correct U-Boot dependency
+
+	Updated/fixed packages: aer-inject, asterisk, atop, aumix,
+	avahi, botan, chicken, dc3dd, ffmpeg, flashrom, gnuradio,
+	gnu-efi, gnutls, hiawatha, iperf3, iproute2, ledmon, libffi,
+	libgpg-error, libkcapi, libpcap, mariadb, mdadm, ncurses,
+	nginx, ntpsec, python-huepy, python-tpm2-pytss,
+	python-unittest-xml-reporting, qt6base, qt6tools, skopeo,
+	strongswan, systemd, uboot, uclibc, unbound, vboot-utils,
+	wpa_supplicant, wpebackend-fdo
+
+	Removed packages: fan-ctrl
+
 2024.08-rc1, released August 8th, 2024
 
 	Fixes all over the tree (especially related to GCC 14.x
diff --git a/Makefile b/Makefile
index 284a0bb20e..55aeafde23 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.08-rc1
+export BR2_VERSION := 2024.08-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1723149000
+BR2_VERSION_EPOCH = 1724343000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index cbf0db6bb9..207ba08c8b 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2024.08-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2024.08-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.08-rc1.tar.gz">buildroot-2024.08-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.08-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.08-rc2.tar.gz">buildroot-2024.08-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.08-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.08-rc1.tar.xz">buildroot-2024.08-rc1.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.08-rc1.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.08-rc2.tar.xz">buildroot-2024.08-rc2.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.08-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 487586a894..285dfbfdde 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.08-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 August 2024</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another 2 weeks, another release candidate with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2024.08-rc2">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.08-rc2.tar.xz">2024.08-rc2
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
