Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9A5EE14C3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F44180A8B;
	Wed,  6 Sep 2023 19:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F44180A8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pyd-ITBDPmnm; Wed,  6 Sep 2023 19:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B75582183;
	Wed,  6 Sep 2023 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B75582183
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF25A1BF334
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98AC6405EF
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98AC6405EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vl_X-QhU5ftq for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:55:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DC7C400D0
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DC7C400D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A737869C2; Wed,  6 Sep 2023 19:55:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Sep 2023 21:54:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79c7a67a4cbc93cdff3f70797b7a24fb09d17b11
X-Git-Newrev: d8ce1deff96c48a5d5dacf0ab82d9bce92c8cc6c
X-Patchwork-Hint: ignore
Message-Id: <20230906195529.7A737869C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.08
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8ce1deff96c48a5d5dacf0ab82d9bce92c8cc6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 14 ++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 46 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index b17193a12c..260e883973 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,17 @@
+2023.08, released September 6th, 2023
+
+	Various fixes.
+
+	Defconfigs: BeagleV: Fix build issue with binutils >=
+	2.38. Hifive unleashed: U-Boot needs OpenSSL
+
+	Updated/fixed packages: dt, grub2, heirloom-mailx, libgpgme,
+	libtommath, libxcrypt, log4cxx, mesa3d-demos, openjdk,
+	openjdk-bin, pam, pcm-tools, pixman, poppler, python-django,
+	python-ipython, python-pip, python-tornado, zeromq
+
+	New packages: libdecor
+
 2023.08-rc3, released August 29th, 2023
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 8c7327356e..d017b7e0eb 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.08-rc3
+export BR2_VERSION := 2023.08
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1693313000
+BR2_VERSION_EPOCH = 1694030000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 725cf62b2c..46db748c82 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,40 +42,40 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2023.05.2</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2023.08</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.05.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.05.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2023.05.2.tar.gz">buildroot-2023.05.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.05.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.08.tar.gz">buildroot-2023.08.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.08.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.05.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.05.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.05.2.tar.xz">buildroot-2023.05.2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.05.2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.08.tar.xz">buildroot-2023.08.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.08.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2023.08-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -109,7 +109,7 @@
 	  <p><a href="/downloads/buildroot-2023.08-rc3.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+-->
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index aeca36bc68..2983d385b2 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.08 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 September 2023</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2023.08 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.08">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.08.tar.xz">2023.08 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 75aae858b7..340d931d1a 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.05.2'
+RELEASE='2023.08'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
