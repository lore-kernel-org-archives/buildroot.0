Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325BCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 16:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C4864092E;
	Mon, 30 May 2022 16:28:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6teq822nc_l8; Mon, 30 May 2022 16:28:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 496E1408AE;
	Mon, 30 May 2022 16:28:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7C9D1BF289
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 16:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E401240A91
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 16:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-V557_WzlXH for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 16:28:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0ABC140A2B
 for <buildroot@buildroot.org>; Mon, 30 May 2022 16:27:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 84CFA866C7; Mon, 30 May 2022 16:16:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 18:27:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d87667efe8fc57471496f11e74be15de2aeb12c
X-Git-Newrev: b7d8ce5b181a55f25ca997553e558c5854140363
X-Patchwork-Hint: ignore
Message-Id: <20220530161626.84CFA866C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.05-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7d8ce5b181a55f25ca997553e558c5854140363
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 18 ++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 50 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2d08c1354f..5d8eb2f563 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2022.05-rc2, released May 30th, 2022
+
+	Fixes all over the tree.
+
+	Defconfigs: qemu_ppc64*: Use binutils 2.36.1 to fix build
+	issue, qemu_arm_vexpress_tz: Fix optee-os build issue,
+	qemu_arm_versatile_nommu: Drop now that nommu for ARMv5 is no
+	longer available
+
+	Updated/fixed packages: dhcp, edk2, gcr, glibc, i2pd, janet,
+	janus-gateway, libfreeimage, libnftnl, libnss, libodb-boost,
+	libostree, libwebsockets, linux-tools, midori, ntfs-3g, ola,
+	optee-client, pcsc-lite, pipewire, python-flask,
+	python-service-identity, python-werkzeug, qemu, rng-tools,
+	rockchip-mali, strace, xdriver_xf86-video-amdgpu
+
+	Removed packages: ktap
+
 2022.05-rc1, released May 18th, 2022
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index b46f165081..24f8a7338f 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.05-rc1
+export BR2_VERSION := 2022.05-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1652864000
+BR2_VERSION_EPOCH = 1653928000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 8f3f91c366..1405e9b6e1 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 -->
-      <h3 style="text-align: center;">Latest release candidate: <b>2022.05-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2022.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.05-rc1.tar.gz">buildroot-2022.05-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.05-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.05-rc2.tar.gz">buildroot-2022.05-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.05-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.05-rc1.tar.xz">buildroot-2022.05-rc1.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.05-rc1.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.05-rc2.tar.xz">buildroot-2022.05-rc2.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.05-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 3294327754..4b75b68a83 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.05-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 May 2022</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2022.05-rc2 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.05-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.05-rc2.tar.xz">2022.05-rc2
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
