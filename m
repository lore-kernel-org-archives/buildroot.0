Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9353BC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:11:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F59F60231
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F59F60231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B6EF40786;
	Thu, 26 Aug 2021 22:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lM3PNgTZOzbe; Thu, 26 Aug 2021 22:11:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 696E94079C;
	Thu, 26 Aug 2021 22:11:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C4351BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 761F3426A9
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hWlnH25quu9V for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10C4A426BB
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 637BA8DC50; Thu, 26 Aug 2021 22:01:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Aug 2021 12:50:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 743f3a4c54ae96c75eb2bd55f9bf4d8a13d853e7
X-Git-Newrev: 6da42d767a42e8e95b1ba042fbe99c3c8de13f28
X-Patchwork-Hint: ignore
Message-Id: <20210826220131.637BA8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2021.08-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6da42d767a42e8e95b1ba042fbe99c3c8de13f28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 37 +++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 +++++++++---------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 568fe37552..9780a03528 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,40 @@
+2021.08-rc2, released August 18th, 2021
+
+	Fixes all over the tree.
+
+	Defconfigs: Acmesystems acqua a5: Bump at91bootstrap version
+	to fix build issue with binutils >= 2.35, Microchip sam9x60ek
+	mmc_dev: Add missing toolchain/system options, sama5d2-icp
+	mmc: Correct at91bootstrap options
+
+	Updated/fixed packages: arm-trusted-firmware, at91bootstrap3,
+	azure-iot-sdk-c, bluez5_utils, bullet, busybox, cegui, efl,
+	erlang, ffmpeg, flatbuffers, fontconfig, gcc, gd, glibc, go,
+	gobject-introspection, gpsd, guile, harfbuzz, iozone, iputils,
+	jszip, libargtable2, libbpf, libebml, libepoxy, libesmtp,
+	libfuse3, libgeos, libnss, libodb-boost, libodb-mysql,
+	libodb-pgsql, libqmi, libqrtr-glib, libuhttpd, libuwsc,
+	libvirt, ltp-testsuite, luaossl, mongodb, mpd, mupdf, mutt,
+	network-manager, nginx-naxsi, nodejs, ogre, openzwave,
+	optee-os, osm2pgsql, pdbg, perl-net-ssh2, php, pipewire,
+	pistache, pixman, poke, polkit, poppler, postgresql, postkit,
+	prelink-cross, prosody, protobuf, pulseview,
+	python-cryptography, python-keyring, python-matplotlib,
+	python-pymupdf, python-pyopenssl, python-secretstorage,
+	python-treq, python-txtorcon, python3, qemu, qpdf, qt5base,
+	refpolicy, ruby, rust-bin, s390-tools, sconeserver, seatd,
+	shairport-sync, sox, sqlite, sylpheed, sysdig, syslog-ng,
+	system-config-printer, tar, terminology, tor, tpm2-tools, uhd,
+	unbound, usbguard, wireshark, xen, xenomai, xlib_libxshmfence,
+	zstd
+
+	New packages: desktop-file-utils
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13586: grub failure with BR2_OPTIMIZE_3
+	#13671: openSSH server closes connection before authentication..
+
 2021.08-rc1, released August 3rd, 2021
 
 	Numerous package updates.
diff --git a/Makefile b/Makefile
index 3923e5875f..71d2e3d02d 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.08-rc1
+export BR2_VERSION := 2021.08-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1628024000
+BR2_VERSION_EPOCH = 1629283000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 68d12b88e5..7eca55196c 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -76,37 +76,37 @@
 	</div>
       </div>
 
-      <h3 style="text-align: center;">Latest release candidate: <b>2021.08-rc1</b></h3>
+      <h3 style="text-align: center;">Latest release candidate: <b>2021.08-rc2</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.08-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.08-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.08-rc1.tar.gz">buildroot-2021.08-rc1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2021.08-rc1.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.08-rc2.tar.gz">buildroot-2021.08-rc2.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2021.08-rc2.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2021.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2021.08-rc1.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2021.08-rc2.tar.bz2"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2021.08-rc1.tar.bz2">buildroot-2021.08-rc1.tar.bz2</a></h3>
-	  <p><a href="/downloads/buildroot-2021.08-rc1.tar.bz2.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2021.08-rc2.tar.bz2">buildroot-2021.08-rc2.tar.bz2</a></h3>
+	  <p><a href="/downloads/buildroot-2021.08-rc2.tar.bz2.sign">PGP signature</a></p>
 	</div>
       </div>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index 73d27df6a6..69c41dcc7e 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2021.08-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 August 2021</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>2021.08-rc2 has been released with more cleanups and build fixes. See the
+	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.08-rc2">CHANGES</a>
+	  file for details.</p>
+
+	<p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2021.08-rc2.tar.bz2">2021.08-rc2
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
