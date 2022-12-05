Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F07C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 07:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EE43606E6;
	Mon,  5 Dec 2022 07:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EE43606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWwdjZ9hV4h1; Mon,  5 Dec 2022 07:23:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D49A60888;
	Mon,  5 Dec 2022 07:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D49A60888
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA2E21BF336
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 07:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCA6E80FA8
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 07:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCA6E80FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C1ZpqRqamuF6 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 07:23:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD28380DA5
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 07:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD28380DA5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9AF6856F4; Mon,  5 Dec 2022 07:23:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Dec 2022 08:23:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74b1d385b67dc5933eca3ebeb456d400bd5296d9
X-Git-Newrev: 40bd4a32aadaa1d041a8525628ecaaf7f5a7fde6
X-Patchwork-Hint: ignore
Message-Id: <20221205072340.A9AF6856F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=40bd4a32aadaa1d041a8525628ecaaf7f5a7fde6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 20 ++++++++++++++++++++
 Makefile                   |  2 +-
 docs/website/download.html | 22 +++++++++++-----------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 51 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 79b010a9b8..f71e53fe4b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,23 @@
+2022.11, released December 5th, 2022
+
+	Fixes all over the tree.
+
+	Defconfigs: Nitrogen8*: Bump rootfs size, Zynqmp
+	kv260/zcu102/zcu106: Update to Xilinx 2022.2,
+
+	Updated/fixed packages: dash, dovecot, elf2flt, exim, gcc,
+	gdb, git, kodi, libarchive, libmdbx, linuxptp, lxc,
+	matchbox-keyboard, memcached, netsnmp, optee-client,
+	python-scipy, python3, qt6base, qt6serialport, rtl8188eu,
+	rtl8723bu, rtl8723ds, rtl8821au, vim, vlc, wilc-driver
+
+	Removed packages: rabbitmq-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15131: Target GDB uses internal zlib
+	#15151: Busybox /etc/init.d scripts are not executable
+
 2022.11-rc3, released November 24th, 2022
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 827ab230ef..89f3648bb7 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.11-rc3
+export BR2_VERSION := 2022.11
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1669308000
 
diff --git a/docs/website/download.html b/docs/website/download.html
index a92f630611..6f7007529c 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -42,40 +42,40 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest stable release: <b>2022.08.2</b></h3>
+      <h3 style="text-align: center;">Latest stable release: <b>2022.11</b></h3>
 
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.08.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.08.2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.11.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
-	  <h3><a href="/downloads/buildroot-2022.08.2.tar.gz">buildroot-2022.08.2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.08.2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.11.tar.gz">buildroot-2022.11.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.11.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.08.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.11.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.08.2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.11.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.08.2.tar.xz">buildroot-2022.08.2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.08.2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.11.tar.xz">buildroot-2022.11.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.11.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
+<!--
       <h3 style="text-align: center;">Latest release candidate: <b>2022.11-rc3</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
@@ -114,7 +114,7 @@
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
   </div>
-
+-->
   <div class="panel panel-primary">
     <div class="panel-heading">Source code</div>
     <div class="panel-body">
diff --git a/docs/website/news.html b/docs/website/news.html
index 1d76cc3cf5..9be00982cb 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.11 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 December 2022</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2022.11 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.11">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.11.tar.xz">2022.11 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 40c7c4e1ce..02fe6bca67 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.08.2'
+RELEASE='2022.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
