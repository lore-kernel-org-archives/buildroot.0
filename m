Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A469BE68152
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 09:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55CCF812F9;
	Tue, 17 Feb 2026 09:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYvDN9boe15K; Tue, 17 Feb 2026 09:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5818E812FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771320621;
	bh=obyQ3GQPijRfZrfKPIYPksG4UsvQ8faQgnneN/RhitY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mz0odd8JjoWthLq4L5HndCFXfNSSY16jkSgdwjgJ5SLDx9kRPtg5mR3frQr2Lgz10
	 PDpkMdd0q7Tj8a+WV0EdbPVRc/nY6yclXmhgOvozxf+RMhyEKB/uoXmn+zlbVB3U9r
	 esBAaSk0CHbKgcnEdTqStPuu+4Ge1dFDKuP7blBtR4mEZ5NMY/6sddxEVcYnZ3dWjF
	 8YcBrSXmwIIfeIZ1GhAAb78A2yMYoNhOhPGU1JcpGqFG63Le7cpo550CQcXd/nXuX+
	 B7DY/0INgRhY6ND5Z7EaxmsBJijlNvzv4SIKZmwI5i62968JiylNBTrT48VjTkb2TN
	 N9M5QiOI/HSGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5818E812FB;
	Tue, 17 Feb 2026 09:30:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5850C206
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 09:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4875740A09
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 09:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5LoKFrXIpaB for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 09:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5266A4095E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5266A4095E
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 09:30:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33E1686FA5; Tue, 17 Feb 2026 09:30:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 10:29:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c38d7326e093f45252c01e241d0faf6b04023e02
X-Git-Newrev: c97a7ad4aadffdc5e646021461847f8c3268f225
X-Patchwork-Hint: ignore
Message-Id: <20260217093018.33E1686FA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2026.02-rc1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c97a7ad4aadffdc5e646021461847f8c3268f225
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 73 ++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 +--
 docs/website/download.html | 16 +++++-----
 docs/website/news.html     | 21 +++++++++++++
 4 files changed, 103 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0f2bc659ea..bb25c9ab2f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,76 @@
+2026.02-rc1, released February 17th, 2026
+
+	Fixes all over the tree and new features.
+
+	Arch:
+	- Add HPPA architecture support
+	- Drop ARC big-endian support
+
+	Toolchain:
+	- Kernel headers: use 6.19.x by default, removed 6.17.x, added
+	  6.19.x support.
+
+	- Binutils: use 2.44 by default, removed 2.42.x, added 2.45.x series.
+
+	Misc:
+	- Various tweaks to utils/generate-cyclonedx for better SBOM
+	  compatibility and more detailed annotations for CVEs fixed
+	  by patches in Buildroot.
+
+	New defconfigs: AMD Versal2 VEK385, HP-9000, QEMU HPPA B160L,
+	STM32h747i-disco
+
+	Removed defconfigs: Raspberrypi3 qt5we
+
+	New packages: adsp-ldr, aichat, k3conf, kibi, libplacebo,
+	libxmlsec1, libyang-cpp, nqptp, openscap,
+	python-annotated-doc, python-base58, python-coherent-licensed,
+	python-diskcache, python-gpiod,
+	python-ipython-pygments-lexers, python-librt,
+	python-markdown-it-py, python-mdit-py-plugins, python-mdurl,
+	python-memray, python-platformdirs, python-rich,
+	python-sdbus-systemd, python-textual, python-varlink,
+	qoriq-restool, rasdaemon, sigsum-go, sysrepo-cpp, yq, zellij
+
+	Removed packages: alure, bootstrap, chartjs, connman-gtk,
+	cppdb, criu, cvs, datatables-buttons, datatables-fixedcolumns,
+	datatables-responsive, datatables, dbus-triggerd, dmraid,
+	dvdrw-tools, explorercanvas, flot, forge, gconf, hawktracer,
+	jquery-datetimepicker, jquery-keyboard, jquery-mobile,
+	jquery-sidebar, jquery-sparkline, jquery-ui-themes, jquery-ui,
+	jquery-validation, jquery, jsmin, json-javascript, jszip,
+	let-me-create, libcgi, libcuefile, libfreeimage, libiqrf,
+	libmhash, libnids, libsvg-cairo, libsvg, libuwsc, lockdev,
+	musepack, opencv3, openlayers, openpowerlink, opentracing-cpp,
+	php-zmq, python-aioredis, qjson, racehound, rpi-userland,
+	sconeserver, softether, taskd, vis-network, vuejs-router,
+	vuejs, xdriver_xf86-input-mouse
+
+	Issues resolved:
+	- GNU GRUB (BIOS) with f2fs filesystem failed
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/61
+
+	- The shadow package does not correctly configure the ENCRYPT_METHOD..
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/134
+
+	- EGL not found when building libWPE from buildroot base folder
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/144
+
+	- Awkward error message: "Fix you path"
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/151
+
+	- Detected presence of version control tool artifacts
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/154
+
+	- run-tests tool broken with Python 3.14
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/156
+
+	- Moving away from bminor Github mirrors
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/160
+
+	- How can I make the 'en_US' locale by default?
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/161
+
 2025.11.1, released January 20, 2026
 
 	Important / security related fixes:
diff --git a/Makefile b/Makefile
index 4cf8750bfb..53aa4da731 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.02-git
+export BR2_VERSION := 2026.02-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1765493000
+BR2_VERSION_EPOCH = 1771320000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 6221cfe871..521c2b603f 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -16,34 +16,32 @@
           <th>Latest release date</th>
           <th colspan="2">Downloads</td>
         </tr>
-<!--
         <tr>
           <th>Candidate</th>
           <th>2025.11.x</th>
-          <td>March 2026</td>
+          <td>June 2026</td>
           <td>
-            2025.11-rc2<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11-rc2/CHANGES">
+            2026.02-rc1<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02-rc1/CHANGES">
               Changelog
             </a>
           </td>
           <td>2025-11-20</td>
           <td>
-            <a href="/downloads/buildroot-2025.11-rc2.tar.gz">
+            <a href="/downloads/buildroot-2026.02-rc1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.11-rc2.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.02-rc1.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.11-rc2.tar.xz">
+            <a href="/downloads/buildroot-2026.02-rc1.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.11-rc2.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.02-rc1.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
--->
         <tr>
           <th>Stable</th>
           <th>2025.11.x</th>
diff --git a/docs/website/news.html b/docs/website/news.html
index c85ff0d3f1..4a9092dd3f 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.02-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 February 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02-rc1/CHANGES">CHANGES</a>
+          file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+          <a href="/downloads/buildroot-2026.02-rc1.tar.xz">2026.02-rc1
+            release</a>, and report any problems found to the
+          <a href="support.html">mailing list</a> or
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
