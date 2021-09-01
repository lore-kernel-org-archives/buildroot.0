Return-Path: <SRS0=5uHv=NX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F2EC432BE
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 06:00:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75853600CD
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 06:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75853600CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E88A605D1;
	Wed,  1 Sep 2021 06:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8iHvi38wyo9r; Wed,  1 Sep 2021 06:00:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D832605D2;
	Wed,  1 Sep 2021 06:00:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B7C41BF3E6
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 06:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A11D40003
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 06:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lP0AyZua93mY for <buildroot@lists.busybox.net>;
 Wed,  1 Sep 2021 06:00:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 106CE40142
 for <buildroot@buildroot.org>; Wed,  1 Sep 2021 06:00:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F072A87E66; Wed,  1 Sep 2021 05:59:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Sep 2021 08:00:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2962697039c72583d1e57e2b61b6281896f5b761
X-Git-Newrev: 7314f04f5393912a93594c6660a21eee4a34b317
X-Patchwork-Hint: ignore
Message-Id: <20210901055933.F072A87E66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.08-rc3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7314f04f5393912a93594c6660a21eee4a34b317
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 23 +++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9780a03528..432bdc0629 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2021.08-rc3, released August 31st, 2021
+
+	Fixes all over the tree.
+
+	Toolchain: Disable fortify support for Microblaze as it is not
+	currently working.
+
+	Defconfigs: Acmesystems aria/ariette g25: Fix build issue
+	after at91bootstrap bump, BeagleV: Correct kernel headers
+	version, PC x86-64: Bump kernel to 4.19.204 to fix build issue
+	with GCC 10.x.
+
+	Updated/fixed packages: alsa-utils, at91bootstrap3, belle-sip,
+	bullet, c-ares, cjson, coreutils, cpio, eigen, fetchmail, gdb,
+	haproxy, heirloom-mailx, ipmiutil, kvm-unit-tests, libarchive,
+	libffi, libmodsecurity, libopenssl, libressl, libshout,
+	libvirt, linux-pam, lmbench, localedef, lua-lunix, mesa3d,
+	mpv, mtd, nodejs, nvidia-driver, openvmtools, php, polkit,
+	python-requests, python3-requests, rust-bin, rustc, samba4,
+	sdl2, snort3, ushare, xen
+
+	Removed packages: libmcrypt, mcrypt, sentry-cli
+
 2021.08-rc2, released August 18th, 2021
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 71d2e3d02d..2d7e8ff78a 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.08-rc2
+export BR2_VERSION := 2021.08-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1629283000
+BR2_VERSION_EPOCH = 1630446300
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 7eca55196c..2b1df6eda6 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2021.08-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2021.08-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.08-rc2.tar.gz">buildroot-2021.08-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.08-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.08-rc3.tar.gz">buildroot-2021.08-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.08-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.08-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.08-rc2.tar.bz2">buildroot-2021.08-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.08-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.08-rc3.tar.bz2">buildroot-2021.08-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.08-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 69c41dcc7e..8553a6e643 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.08-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>31 August 2021</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2021.08-rc3 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.08-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.08-rc3.tar.bz2">2021.08-rc3
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
