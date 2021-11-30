Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90BDC433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 17:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A3F402EF;
	Tue, 30 Nov 2021 17:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wq60JOtimzrY; Tue, 30 Nov 2021 17:14:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CD32403DF;
	Tue, 30 Nov 2021 17:14:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05CE81BF358
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 17:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E891140486
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 17:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XWWeG1__vVTJ for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 17:13:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A7F2400F0
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 17:13:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2005392147; Tue, 30 Nov 2021 17:09:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 18:13:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e938419bd98d57428aac9fc881c7a4adf45a5316
X-Git-Newrev: aaf7b2c9c6847c487af46e023dae3497efdd652f
X-Patchwork-Hint: ignore
Message-Id: <20211130170915.2005392147@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.11-rc3
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

commit: https://git.buildroot.net/buildroot/commit/?id=aaf7b2c9c6847c487af46e023dae3497efdd652f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 20 ++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index ee37a625a3..125a9e05bd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,23 @@
+2021.11-rc3, released November 30th, 2021
+
+	Fixes all over the tree.
+
+	Defconfigs: Nitrogen8mp: Fix Linux build, Zynqmp-zxu106: Fix
+	ATF build
+
+	Updated/fixed packages: asterisk, automake, gdb, glorytun,
+	gmp, hackrf, libgee, libglib2, libmodsecurity, libosmium,
+	libressl, lighttpd, linux, micropython, mosquitto, mtd,
+	nfs-utils, nss-myhostname, pcre, php, poco, pure-ftpd,
+	python-cycler, qemu, qdecoder, smack, smcroute, spidev_test,
+	strace, syslinux, toolchain, uboot, uhd, vim, websocketpp,
+	wireshark, xcursor-transparent-theme, xscreensaver,
+	xtables-addons
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14346: BR2_PACKAGE_NFS_UTILS_RPC_NFSD does not patch CONFIG_NFSD..
+
 2021.11-rc2, released November 19th, 2021
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 2137c09d38..53f6ae9173 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.11-rc2
+export BR2_VERSION := 2021.11-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1637336000
+BR2_VERSION_EPOCH = 1638292000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 53426f4c89..97af89672e 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2021.11-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2021.11-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.11-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.11-rc2.tar.gz">buildroot-2021.11-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.11-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.11-rc3.tar.gz">buildroot-2021.11-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.11-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.11-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.11-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.11-rc2.tar.bz2">buildroot-2021.11-rc2.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.11-rc2.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.11-rc3.tar.bz2">buildroot-2021.11-rc3.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.11-rc3.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 4293e9d288..66ce88c557 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.11-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2021</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2021.11-rc3 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.11-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.11-rc3.tar.bz2">2021.11-rc3
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
