Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5FDC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4503240D34;
	Mon, 19 May 2025 10:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEZdpFghQtRE; Mon, 19 May 2025 10:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A1E40D44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A1E40D44;
	Mon, 19 May 2025 10:34:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25432E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0584C40C3D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZv3r13hjCBI for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:34:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4F5340C28
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4F5340C28
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:34:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFA3E87393; Mon, 19 May 2025 10:34:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 12:33:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b55957fa65a551be367c32f2710be56dabb63632
X-Git-Newrev: 37a715969f778322861a577ab345d364b2df8d97
X-Patchwork-Hint: ignore
Message-Id: <20250519103403.DFA3E87393@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2025.05-rc1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=37a715969f778322861a577ab345d364b2df8d97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 +--
 docs/website/download.html | 22 ++++++++--------
 docs/website/news.html     | 21 +++++++++++++++
 4 files changed, 98 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index cdf036f7de..0f36dc70a1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,67 @@
+2025.05-rc1, released May 19th, 2025
+
+	Fixes all over the tree and package updates.
+
+	Download:
+
+	- Rust updated to version 1.86.0, which has slightly changed
+	  the cargo fetching behaviour, so the generated tarballs now
+	  use a -cargo4 suffix to reflect that.
+
+	- Subversion download logic is now reproducible with non-US
+	  locales
+
+	- Sources can now be fetched from a smb:// location (using
+	  curl).
+
+	Dependencies:
+
+	- AWK is now required on the build host.
+
+	Toolchains:
+
+	- Bootlin ARMv7-A toolchains are now also available for
+	  ARMv8-A CPUs in 32bit mode
+
+	Misc:
+
+	- /etc/resolv.conf symlink now points to /run rather than /tmp
+
+	- support/scripts/pkg-stats can now report stale CVE entries,
+	  E.G. entries in <PKG>_IGNORE_CVES that are no longer needed
+	  after a NVD update.
+
+	New defconfigs: Engicam PX30 SOM, Freescale i.IM 91 EVK and 93
+	Freedom, HiFive Unmatched, Pine64 ROCKPro64 EBBR boot,
+	Raspberrypi 2 in 64bit mode, Sipeed LicheePi 4A
+
+	New packages: aardvark-dns, amazon-ecr-credential-helper,
+	casync-nano, cgroupfs-v2-mount, docker-credential-acr-env,
+	docker-credential-gcr, grout, lowdown, lpac,
+	mender-update-modules, netavark, passt, podman,
+	python-aniso8601, python-cachelib, python-emailproxy,
+	python-flask-caching, python-flask-restx, python-mypy,
+	python-pyproj, python-simple-pid, python-smbus2,
+	python-types-psutil, python-types-setuptools,
+	python-typing-inspection, python-tzlocal,
+	qoriq-ddr-phy-binary, qoriq-firmware-inphi, qoriq-mc-binary,
+	qoriq-mc-utils, sane-airscan, sipeed-lpi4abin, ufs-utils,
+	xilinx-fpgautil
+
+	Issues resolved:
+
+	- openh264's build/ should not be removed
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/64
+
+	- package/dbus: incorrect session bus configuration file..
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/67
+
+	- Update pkcs11-tool to v1.9.1
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/109
+
+	- netsnmp: unexpected header length in /proc/net/snmp...
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/110
+
 2025.02.3, released May 19th, 2025
 	Build issues and other problems solved for packages:
 
diff --git a/Makefile b/Makefile
index c0a41cabd5..c14023fd98 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.05-git
+export BR2_VERSION := 2025.05-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1742234000
+BR2_VERSION_EPOCH = 1747650000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 5eebc8f54c..5e04c347c3 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -75,41 +75,41 @@
 	  <p><a href="/downloads/buildroot-2024.11.2.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
-
-      <h3 style="text-align: center;">Latest release candidate: <b>2025.02-rc2</b></h3>
+-->
+      <h3 style="text-align: center;">Latest release candidate: <b>2025.05-rc1</b></h3>
       <div class="row mt centered">
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.02-rc2.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.05-rc1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2025.02-rc2.tar.gz">buildroot-2025.02-rc2.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.02-rc2.tar.gz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.05-rc1.tar.gz">buildroot-2025.05-rc1.tar.gz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.05-rc1.tar.gz.sign">PGP signature</a></p>
 	</div>
 	<div class="col-sm-6">
 	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
 	    <div class="flipper">
 	      <div class="front">
-		<a href="/downloads/buildroot-2025.02-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	      <div class="back">
-		<a href="/downloads/buildroot-2025.02-rc2.tar.xz"><img src="images/package.png" width="180" alt=""></a>
+		<a href="/downloads/buildroot-2025.05-rc1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
 	      </div>
 	    </div>
 	  </div>
 
-	  <h3><a href="/downloads/buildroot-2025.02-rc2.tar.xz">buildroot-2025.02-rc2.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.02-rc2.tar.xz.sign">PGP signature</a></p>
+	  <h3><a href="/downloads/buildroot-2025.05-rc1.tar.xz">buildroot-2025.05-rc1.tar.xz</a></h3>
+	  <p><a href="/downloads/buildroot-2025.05-rc1.tar.xz.sign">PGP signature</a></p>
 	</div>
       </div>
--->
+
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
     </div>
diff --git a/docs/website/news.html b/docs/website/news.html
index be620ebf05..6d638c889e 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.05-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 May 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05-rc1/CHANGES">CHANGES</a>
+          file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+          <a href="/downloads/buildroot-2025.05-rc1.tar.xz">2025.05-rc1
+            release</a>, and report any problems found to the
+          <a href="support.html">mailing list</a> or
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
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
