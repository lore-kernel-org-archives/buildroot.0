Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD14C77B75
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 06:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C34283F19;
	Mon, 15 May 2023 06:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C34283F19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o3UeeNlZSr2E; Mon, 15 May 2023 06:07:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD0483C76;
	Mon, 15 May 2023 06:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD0483C76
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32BCB1BF599
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 06:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04ECF83C76
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 06:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04ECF83C76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yUP7GcwU11gC for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 06:07:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C692483B4B
 for <buildroot@buildroot.org>; Mon, 15 May 2023 06:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C692483B4B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3137866E7; Mon, 15 May 2023 06:07:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 15 May 2023 08:05:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47fef43f5ecb8031517dbe846f8ea9eb662b4988
X-Git-Newrev: fb6fe5ddf613faf8b6278fdf8ece6059ea825932
X-Patchwork-Hint: ignore
Message-Id: <20230515060714.B3137866E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.05-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb6fe5ddf613faf8b6278fdf8ece6059ea825932
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 32 ++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 66 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 81533552a7..b81e3d7520 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2023.05-rc1, released May 15th, 2023
+
+	Fixes all over the tree and new features.
+
+	Toolchain:
+	- glibc update to 2.37, uClibc-ng updated to 1.0.43
+	- suppoert 6.2.x / 6.3.x kernel headers
+
+	Infrastucture:
+	- go: Ensure go versions of os/user and net are used for
+          static builds so CGO is not used
+
+	- rust / cargo: Correctly split up rust flags for host and
+          target builds
+
+	New defconfigs: STM32F769 discovery
+
+	New packages: petitboot, python-evdev, python-hwdata,
+	python-pyproject-hooks, shadow
+
+	Removed packages: atk, at-spi2-atk, optee-benchmark,
+	python-pep517
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14356: cronstamp jobs are not performed with bumped version of...
+	#15191: pc_x86_64_efi_defconfig doesn't run on real hardware
+	#15306: glibc build fails in Docker container
+	#15321: docker-engine now requires libseccomp by default
+	#15376: Libiconv config
+	#15461: QtVirtualKeyboard segfaults
+
 2023.02.1, released May 9th, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 95959daab2..6e094c8b13 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.05-git
+export BR2_VERSION := 2023.05-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1678652000
+BR2_VERSION_EPOCH = 1684130000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 3cf415de0e..7f43a6f66b 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2022.11.2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
-      <h3 style="text-align: center;">Latest release candidate: <b>2023.02-rc3</b></h3>
+-->
+      <h3 style="text-align: center;">Latest release candidate: <b>2023.05-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.02-rc3.tar.gz">buildroot-2023.02-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.02-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.05-rc1.tar.gz">buildroot-2023.05-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.05-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.02-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.02-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.02-rc3.tar.xz">buildroot-2023.02-rc3.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.02-rc3.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.05-rc1.tar.xz">buildroot-2023.05-rc1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.05-rc1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index a47514735c..92dd469f51 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.05-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 May 2023</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.05-rc1">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.05-rc1.tar.xz">2023.05-rc1
+	  release</a>, and report any problems found to the
+         <a href="support.html">mailing list</a> or
+         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
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
