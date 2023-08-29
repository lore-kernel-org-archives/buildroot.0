Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BF1C71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 13:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5756782047;
	Tue, 29 Aug 2023 13:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5756782047
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XCt9L2TLLXmY; Tue, 29 Aug 2023 13:01:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C52C682051;
	Tue, 29 Aug 2023 13:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C52C682051
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E0931BF46A
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B978F41142
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B978F41142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VCrEatkD6wzA for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 13:01:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6AB14113A
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 13:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6AB14113A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D266886420; Tue, 29 Aug 2023 13:01:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 15:00:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41280018b37cf1cb49d3716e17729279bc55f8ed
X-Git-Newrev: 04bc8046305ed326d9ead496bda6368aff058975
X-Patchwork-Hint: ignore
Message-Id: <20230829130111.D266886420@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.08-rc3
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

commit: https://git.buildroot.net/buildroot/commit/?id=04bc8046305ed326d9ead496bda6368aff058975
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 17 +++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index d000ee9454..3ee83f64c6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,20 @@
+2023.08-rc3, released August 29th, 2023
+
+	Fixes all over the tree.
+
+	Defconfigs: Avenger96: Bump ATF to 2.9 to fix build warnings
+	with binutils >= 2.39. CI20: Bump kernel to 5.4.254 to fix
+	build issue with GCC 12. Hifive unleashed: Add missing
+	pylibfdt dependency / bump kernel to 5.10.109 to fix build
+	issue GCC 12. PC x86-64 bios/elf: Add missing libelf
+	dependency. Sipeed maix sdcard: Fix build issues with
+	binutils >= 2.38
+
+	Updated/fixed packages: check, clamav, cups, esp-hosted,
+	f2fs-tools, freeswitch, gcc, gmp, libks, libmodsecurity,
+	mosquitto, mpg123, network-manager, php, postgresql, python3,
+	ramspeed, rtl8189fs, rust, rust-bin, samba4, screen, zlib-ng
+
 2023.08-rc2, released August 20th, 2023
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index f0ff9a1480..1a1ba92c66 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.08-rc2
+export BR2_VERSION := 2023.08-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1692567000
+BR2_VERSION_EPOCH = 1693313000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 45d6bbeef3..a4cce974de 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2023.08-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2023.08-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.08-rc2.tar.gz">buildroot-2023.08-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.08-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.08-rc3.tar.gz">buildroot-2023.08-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.08-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.08-rc2.tar.xz">buildroot-2023.08-rc2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.08-rc2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.08-rc3.tar.xz">buildroot-2023.08-rc3.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.08-rc3.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 8c7cc8a8c2..aea6779579 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.08-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 August 2023</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2023.08-rc3 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.08-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.08-rc3.tar.xz">2023.08-rc3
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
