Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFBFCD3420
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 19:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00C1440124;
	Sun,  1 Sep 2024 19:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9D6dszADdIM; Sun,  1 Sep 2024 19:49:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41A1A405BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41A1A405BA;
	Sun,  1 Sep 2024 19:49:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5AFF71BF40A
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 19:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55B4F60754
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 19:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELon875nN41q for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 19:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E0B4605DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E0B4605DC
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 19:49:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECF778693E; Sun,  1 Sep 2024 19:49:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 21:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bd1723c0a5224efca245edf6930aa485e29341b
X-Git-Newrev: 30450215aef6b077ad08f2a0740aa247dbbd84d3
X-Patchwork-Hint: ignore
Message-Id: <20240901194903.ECF778693E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.08-rc3
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

commit: https://git.buildroot.net/buildroot/commit/?id=30450215aef6b077ad08f2a0740aa247dbbd84d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 14 ++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 076d6162e1..fd4851be57 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,17 @@
+2024.08-rc3, released September 1st, 2024
+
+	Fixes all over the tree.
+
+	Removed defconfigs: mx25pdk
+
+	Updated/fixed packages: chicken, comix-cursors, dovecot,
+	dovecot-pigeonhole, elf2flt, enscript, fbset, freeipmi, gcc,
+	grub2, libcuefile, libcurl, libglob, libuecc, norm, php,
+	postgresql, proftpd, python-sqlparse, python3, sofia-sip,
+	szip, unbound, x264, xserver_xorg-server, zabbix
+
+	Removed packages: frotz
+
 2024.08-rc2, released August 22nd, 2024
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 55aeafde23..50cfbcbcf4 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.08-rc2
+export BR2_VERSION := 2024.08-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1724343000
+BR2_VERSION_EPOCH = 1725220000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 207ba08c8b..dd3327577d 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2024.08-rc2</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2024.08-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.08-rc2.tar.gz">buildroot-2024.08-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.08-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.08-rc3.tar.gz">buildroot-2024.08-rc3.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.08-rc3.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2024.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2024.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2024.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2024.08-rc2.tar.xz">buildroot-2024.08-rc2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2024.08-rc2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2024.08-rc3.tar.xz">buildroot-2024.08-rc3.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2024.08-rc3.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 285dfbfdde..f43881614a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2024.08-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>1 September 2024</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2024.08-rc3 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2024.08-rc3">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2024.08-rc3.tar.xz">2024.08-rc3
+	  release candidate</a>, and report any problems found to the
+	  <a href="support.html">mailing list</a> or
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
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
