Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C5FEE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97455404CE;
	Sun, 20 Aug 2023 21:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97455404CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LaYRITPtv7R6; Sun, 20 Aug 2023 21:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41B7F40541;
	Sun, 20 Aug 2023 21:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41B7F40541
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FFBA1BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7244140990
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7244140990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5w1uOfE6b8m for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:38:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1479404CE
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1479404CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFC5E85ECC; Sun, 20 Aug 2023 21:38:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:37:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0293d131c9c56af24d4f58dfddcd2d8c971f5841
X-Git-Newrev: bdd80863cf81a5b9034903ee1954d41a7ebbd1e7
X-Patchwork-Hint: ignore
Message-Id: <20230820213857.DFC5E85ECC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.08-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdd80863cf81a5b9034903ee1954d41a7ebbd1e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 32 ++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 64 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5ed0568bec..d000ee9454 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2023.08-rc2, released August 20th, 2023
+
+	Fixes all over the tree.
+
+	Toolchains: Only show external toolchains based on a GCC
+	version supporting the selected architecture
+	variant. Correctly mark Codescape MIPS external toolchains as
+	not providing a gdbserver.
+
+	Defconfigs: Andes ae350_45: Drop custom U-Boot march setting,
+	breaking builds with GCC 12. Nitrogen*: Bump
+	U-Boot/Linux. Nitrogen8*: Use ATF 2.8, fixing array bounds
+	errors. QEMU m68k: Add Linux patch to fix build issue with
+	binutils >= 2.41. Raspberrypi*: Enable console on HDMI when
+	using systemd as well.
+
+	Updated/fixed packages: at91dataflashboot, aubio, berkeleydb,
+	bwm-ng, ccache, check, chocolate-doom, compiler-rt, composer,
+	conmon, connman, dav1d, diffutils, dracut, e2fsprogs, elf2flt,
+	esp-hosted, flite, gcc, gdb, go-bootstrap-stage2,
+	intel-microcode, kodi-imagedecoder-heif, less, libcoap,
+	libedit, libglib2, libksba, liblo, libserial, log4cxx, lsof,
+	luvi, meson, mosquitto, mpd, mpv, mv-ddr-marvell, nftables,
+	ntpsec, openssh, optee-test, perftest, python-botocore,
+	python-docker, python-pylibfdt, python3, screenfetch,
+	sentry-cli, sngrep, stellarium, trinity, tvheadend, uboot,
+	uclibc, util-linux, xfsprogs, yajl
+
+	New packages: nftables-python, xlib_libXpresent
+
+	Removed packages: lpc32xxcdl
+
 2023.08-rc1, released August 5, 2023
 
 	Numerous package updates and fixes, additional runtime tests.
diff --git a/Makefile b/Makefile
index 080136bc9a..f0ff9a1480 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.08-rc1
+export BR2_VERSION := 2023.08-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1691269000
+BR2_VERSION_EPOCH = 1692567000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 3d5e2b37de..45d6bbeef3 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2023.08-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2023.08-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.08-rc1.tar.gz">buildroot-2023.08-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.08-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.08-rc2.tar.gz">buildroot-2023.08-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.08-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2023.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2023.08-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2023.08-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2023.08-rc1.tar.xz">buildroot-2023.08-rc1.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2023.08-rc1.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2023.08-rc2.tar.xz">buildroot-2023.08-rc2.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2023.08-rc2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index a338b15acf..8c7cc8a8c2 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2023.08-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 August 2023</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2023.08-rc2 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.08-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2023.08-rc2.tar.xz">2023.08-rc2
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
