Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8A8C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 21:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05DAC615F5;
	Wed, 29 Nov 2023 21:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05DAC615F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGB0_TpShc-Q; Wed, 29 Nov 2023 21:57:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D3A9615F3;
	Wed, 29 Nov 2023 21:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D3A9615F3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 924A61BF283
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 783D840130
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 783D840130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZeHGEeK398C for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 21:57:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78B9A4010E
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 21:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78B9A4010E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FB7787593; Wed, 29 Nov 2023 21:57:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 22:57:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3eff1cd761c35c686dcd9d839bc5e0c85c6dfc0
X-Git-Newrev: 0ed48b952bf2b854315009234e8b8b5c55af3757
X-Patchwork-Hint: ignore
Message-Id: <20231129215755.5FB7787593@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.11-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ed48b952bf2b854315009234e8b8b5c55af3757
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 19 +++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index a045779c31..c1b5651b74 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,22 @@
+2023.11-rc2, released November 29th, 2023
+
+	Fixes all over the tree.
+
+	Defconfigs: Raspberry pi: Fix bluetooth autoprobing,
+	rockpro64: Fix U-Boot build, bump rootfs size, vim3: Use
+	device tree from Linux rather than from U-Boot.
+
+	Updated/fixed packages: erlang, exfatprogs, flutter-engine,
+	flutter-sdk-bin, gcc, gsl, intel-microcode, janet,
+	kodi-pvr-hts, libgdiplus, libpam-tacplus, libxml2,
+	libzenoh-pico, memcached, motion, netsnmp, nodejs, oatpp,
+	openrc, opensc, perl, postgresql, python-msgpack, qemu,
+	refpolicy, samba4, squid, vim, vlc, xwayland, zfs
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15856: Using BR2_CONFIG= on a different file-system...
+
 2023.11-rc1, released November 14th, 2023
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 8e3e745b38..04d24b9a35 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.11-rc1
+export BR2_VERSION := 2023.11-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1699946000
+BR2_VERSION_EPOCH = 1701295000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 23474159a3..7cc2ff7ccd 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2023.11-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2023.11-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.11-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.11-rc1.tar.gz">buildroot-2023.11-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.11-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.11-rc2.tar.gz">buildroot-2023.11-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.11-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.11-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.11-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.11-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.11-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.11-rc1.tar.xz">buildroot-2023.11-rc1.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.11-rc1.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.11-rc2.tar.xz">buildroot-2023.11-rc2.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.11-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index e8b10e3a6e..b3dda4c629 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.11-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 November 2023</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2023.11-rc2 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.11-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.11-rc2.tar.xz">2023.11-rc2
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
