Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A575C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 09:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10C2840D0F;
	Wed, 18 May 2022 09:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jW_8FIokEKn; Wed, 18 May 2022 09:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D44A440CF9;
	Wed, 18 May 2022 09:06:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6FFA1BF35D
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 09:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A58F684002
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 09:06:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCXMg4sVaG5j for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 09:06:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E5CD83FFB
 for <buildroot@buildroot.org>; Wed, 18 May 2022 09:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1EC2785FD2; Wed, 18 May 2022 08:55:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 11:03:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a7fad410ea0265412c66095ff7e2f3a23b7c46c
X-Git-Newrev: ae4e99aa9e36ca4cf51a853b5b1f74574bd78af4
X-Patchwork-Hint: ignore
Message-Id: <20220518085503.1EC2785FD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.05-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae4e99aa9e36ca4cf51a853b5b1f74574bd78af4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 50 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 22 ++++++++++----------
 docs/website/news.html     | 21 +++++++++++++++++++
 4 files changed, 84 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1658db4cce..07f46162f6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,53 @@
+2022.05-rc1, released May 18th, 2022
+
+	Fixes all over the tree and new features.
+
+	Toolchain:
+	- glibc update to 2.35, musl updated to 1.2.3
+	- gcc 11.x updated to 11.3, support for external gcc 12.x
+	- binutils 2.38 added, 2.32/2.35.2 removed, default changed to 2.37
+	- s390x Bootlin external toolchain added
+	- 5.17.x kernel headers support added
+
+	Filesystem:
+	- Rework OCI entrypoint/command logic to handle command arguments
+	- Squashfs block size is now configurable
+
+	Graphs: Also generate a build time timeline graph (for top
+	level parallel builds).
+
+	scripts/pkg-stats: Optimize memory consumption for CPE parsing
+
+	Fix compatibility issue with the fakeroot script logic and
+	modern versions of dash.
+
+	Change git:// URLs pointing to Github to https://, now that
+	Github has turned off support for git://
+
+	New defconfigs: Octavo osd32mp1_brk / osd32mp1_red
+
+	New packages: falcosecurity-libs, lzma-alone, octave,
+	python-flit-core, python-orjson, python-pydevmem,
+	qt5webengine-chromium, qt5webengine-chromium-catapult, ragel,
+	tbb, wilc-driver, wtfutil
+
+	Wilc1000-firmware renamed to wilc-firmware
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14596: package dialog is outdated and contains a bug
+	#14651: OpenSSH 8.9p1 compiler error under ARM
+	#14656: Adding dependencies from an external tree does not work
+	#14661: Fakeroot script relies on bash-isms, does not work with..
+	#14681: QT5WEBENGINE not building
+	#14686: genimage.cfg have a hard-coded .ext4 extension which..
+	#14701: Multiple unresolved symbols while building kernel ..
+	#14706: nodjs build problem
+	#14711: nodjs build problem missing bzip
+	#14721: python-argon2_cffi no longer works
+	#14731: BR2_PACKAGE_IOSTAT
+	#14751: LVM2 Outdated Link
+
 2022.02.1, released April 11th, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 05b790d770..b46f165081 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.05-git
+export BR2_VERSION := 2022.05-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1646777000
+BR2_VERSION_EPOCH = 1652864000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 7cbf882f96..32e33d2437 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2021.11.2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
-      <h3 style="text-align: center;">Latest release candidate: <b>2022.02-rc3</b></h3>
+-->
+      <h3 style="text-align: center;">Latest release candidate: <b>2022.05-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.02-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.02-rc3.tar.gz">buildroot-2022.02-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2022.02-rc3.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.05-rc1.tar.gz">buildroot-2022.05-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.05-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2022.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2022.02-rc3.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2022.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2022.02-rc3.tar.bz2">buildroot-2022.02-rc3.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2022.02-rc3.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2022.05-rc1.tar.xz">buildroot-2022.05-rc1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2022.05-rc1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index 1e39c4d910..847b216aa7 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2022.05-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 May 2022</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.05-rc1">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2022.05-rc1.tar.xz">2022.05-rc1
+	  release</a>, and report any problems found to the
+         <a href="support.html">mailing list</a> or
+         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
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
