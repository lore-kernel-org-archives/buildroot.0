Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB681C77B7E
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 20:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5450140C18;
	Sun, 28 May 2023 20:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5450140C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdo3qeIAqncV; Sun, 28 May 2023 20:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D4C440470;
	Sun, 28 May 2023 20:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D4C440470
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DED801BF41A
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 20:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1C0982C33
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 20:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1C0982C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SuRltxacI8Yq for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 20:18:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C04E782B69
 for <buildroot@buildroot.org>; Sun, 28 May 2023 20:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C04E782B69
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACDBF86A04; Sun, 28 May 2023 20:18:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 22:17:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6ce18b5ac78474611cdea07b887f4f83bc78648
X-Git-Newrev: c765ac9c02dbddd53cf6813cf59c8f265b043caf
X-Patchwork-Hint: ignore
Message-Id: <20230528201801.ACDBF86A04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.05-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c765ac9c02dbddd53cf6813cf59c8f265b043caf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 16 ++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 48 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index b81e3d7520..b0875759ff 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,19 @@
+2023.05-rc2, released May 28th, 2023
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: busybox, clamav, crudini,
+	kodi-pvr-vbox, libcurl, libmnl, libpqxx, libressl, libssh,
+	llvm, lua, mesa3d, perl-http-message, python-can,
+	python-django, sdl2_mixer, webkitgtk, zfs, znc
+
+	New packages: perl-clone
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15421: qemu_aarch64_ebbr_defconfig: Missing Linux kernel source..
+	#15581: qemu_ppc_mpc8544ds_defconfig: Fails due to non-working patch
+
 2023.05-rc1, released May 15th, 2023
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 6e094c8b13..2e1eff2f3c 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.05-rc1
+export BR2_VERSION := 2023.05-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1684130000
+BR2_VERSION_EPOCH = 1685305000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 7f43a6f66b..75b445d069 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 -->
-      <h3 style="text-align: center;">Latest release candidate: <b>2023.05-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2023.05-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.05-rc1.tar.gz">buildroot-2023.05-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.05-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.05-rc2.tar.gz">buildroot-2023.05-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.05-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.05-rc1.tar.xz">buildroot-2023.05-rc1.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.05-rc1.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.05-rc2.tar.xz">buildroot-2023.05-rc2.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.05-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 92dd469f51..28d0b83952 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.05-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>28 May 2023</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2023.05-rc2 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.05-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.05-rc2.tar.xz">2023.05-rc2
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
