Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E684EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 15:33:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36D3A61AFB
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 15:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36D3A61AFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0F9382730;
	Fri, 19 Nov 2021 15:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCVx8r8DFXBA; Fri, 19 Nov 2021 15:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EABC28272C;
	Fri, 19 Nov 2021 15:33:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECB661BF346
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 15:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E892E4094D
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 15:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ToDjk1f9j-yU for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 15:33:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FAF6408BF
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 15:33:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1DB618DB1F; Fri, 19 Nov 2021 15:29:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Nov 2021 16:33:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33edb17410ffbaff7ff2f68eec12dfd14a58db7c
X-Git-Newrev: 62ba22f312018eef1d46d04cd30680e3fbc2f099
X-Patchwork-Hint: ignore
Message-Id: <20211119152901.1DB618DB1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.11-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=62ba22f312018eef1d46d04cd30680e3fbc2f099
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 26 ++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 14914919f2..ee37a625a3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,29 @@
+2021.11-rc2, released November 19th, 2021
+
+	Fixes all over the tree.
+
+	Coding style fixes for a large number of board genimage
+	configuration files for clarity and consistency.
+
+	Defconfigs: Acmesystems Aria/Arietta g25, Armadeus
+	apf28/apf51, beagleboneai, Olimx a64, rock64, sheevaplug: Fix
+	build with hostcc >= 10, Nezha: Correct U-Boot dependencies
+
+	Updated/fixed packages: alsa-lib, apparmor, binutils,
+	bluez5_utils, botan, diffutils, firmware-utils, gdb, glmark2,
+	glog, gpu-amd-bin-mx51, gst1-interpipe, imx-vpuwrap, iperf,
+	isl, janet, libdnet, libglib2, libhtp, liburcu, log4cxx,
+	luajit, luvi, meson, mksh, mongodb, mosquitto, mpd, mupdf,
+	opencv4, oracle-mysql, pipewire, postgresql, python-aiohttp,
+	python-pudb, python-ujson, qhull, samba4, seatd, sg3_utils,
+	suricata, tpm2-tss, uboot, vim, xserver_xorg-server
+
+	New packages: pipewire-media-session
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	14311: Cannot compile dahdi (part of Asterisk) for x86 (P1mmx)
+
 2021.11-rc1, released November 8th, 2021
 
 	Numerous package updates. Notable updates including numerous
diff --git a/Makefile b/Makefile
index 4062883cc2..2137c09d38 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.11-rc1
+export BR2_VERSION := 2021.11-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1636367800
+BR2_VERSION_EPOCH = 1637336000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 9ca50e31d8..53426f4c89 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2021.11-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2021.11-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.11-rc1.tar.gz">buildroot-2021.11-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.11-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.11-rc2.tar.gz">buildroot-2021.11-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.11-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.11-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.11-rc1.tar.bz2">buildroot-2021.11-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.11-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.11-rc2.tar.bz2">buildroot-2021.11-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.11-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index b55cc8ca46..4293e9d288 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.11-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 November 2021</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2021.11-rc2 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.11-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.11-rc2.tar.bz2">2021.11-rc2
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
