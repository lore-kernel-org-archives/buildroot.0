Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A3ACA1017
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 20:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BA9B848C9;
	Sun,  7 Sep 2025 20:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUlX0wfLx5AX; Sun,  7 Sep 2025 20:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0278F848D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0278F848D2;
	Sun,  7 Sep 2025 20:59:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2360234
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B948C6F478
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 20:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id slPiIEy6vpaw for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 20:59:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E76A61449
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E76A61449
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 20:59:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D03183744; Sun,  7 Sep 2025 20:59:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Sep 2025 22:58:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b45400dad416d174459ccafc1ec223b984434a5b
X-Git-Newrev: 3386677f0a4d1c0150e772eb07cede05e88a2d6d
X-Patchwork-Hint: ignore
Message-Id: <20250907205916.8D03183744@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2025.08
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

commit: https://git.buildroot.net/buildroot/commit/?id=3386677f0a4d1c0150e772eb07cede05e88a2d6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 35 +++++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 20 +++++++++++---------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 67 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index f622f8d387..8d73b789bf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,38 @@
+2025.08, released September 7th, 2025
+
+	Fixes all over the tree.
+
+	Infrastructure:
+
+	- 'make show-info' now also displays the package directory.
+
+	- utils/bump-stable-kernel-versions helper script to bump
+	  Linux (headers) kernel versions.
+
+	Fixed defconfigs: QEMU ARM / Aarch64 EBBR / SBSA, Sipeed
+	licheepi zero, TI am62x sk
+
+	Removed defconfigs (build failures): Bananapro, Beelink gs1,
+	Chromebook snow, Engicam i.MX6 boards, Galileo, Microchip
+	at91sam9g20df / at91sam9g45m10ek / at91sam9rlek, Odroid XU-4,
+	Orangepi lite2 / one+, Pcengine apu2, Pine64 rock64 / sopine,
+	Raxda rockpin8, Riotboard, Socrates cyclone5, Technologic
+	TS-7680, Toradex Apalis i.MX6
+
+	Updated/fixed packages: apitrace, avrdude, b43-firmware, bat,
+	brcm-patchram-plus, busybox, ecryptfs-utils, exiv2, ffmpeg,
+	firewalld, gdb, go, imagemagick, input-event-daemon, iozone,
+	ipmitool, jose, libcap-ng, libfreeglut, libftdi1, libgsm,
+	libkrb5, libsoxr, lighttpd, lirc-tools, lua-utf8, mariadb,
+	mbpfan, micropython, mosquitto, netavark, openal, postgis,
+	python-flask-cors, python-h2, python-yarl, python3, rtl8188eu,
+	rtl8821au, sqlite, squid, sslh, tcpreplay, timescaledb,
+	tstools, uclibc, udisks, unbound, vde2,
+	webrtc-audio-processing, wipe, wireshark, xlib_libXt
+
+	Removed packages: libsvgtiny, netstat-nat,
+	netsurf-buildsystem, thttpd
+
 2025.08-rc3, released August 28th, 2025
 
 	Fixes all over the tree, mainly GCC 15.x build fixes
diff --git a/Makefile b/Makefile
index d4ad4629c0..29e8a17520 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.08-rc3
+export BR2_VERSION := 2025.08
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1756360000
+BR2_VERSION_EPOCH = 1757278000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 46887a0511..7d208a9bd0 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -16,6 +16,7 @@
           <th>Latest release date</th>
           <th colspan="2">Downloads</td>
         </tr>
+<!--
         <tr>
           <th>Candidate</th>
           <th>2025.08.x</th>
@@ -42,30 +43,31 @@
             <a href="/downloads/buildroot-2025.08-rc3.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
+-->
         <tr>
           <th>Stable</th>
-          <th>2025.05.x</th>
-          <td>September 2025</td>
+          <th>2025.08.x</th>
+          <td>December 2025</td>
           <td>
-            2025.05.1<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05.1/CHANGES">
+            2025.08<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2025-08-11</td>
+          <td>2025-09-07</td>
           <td>
-            <a href="/downloads/buildroot-2025.05.1.tar.gz">
+            <a href="/downloads/buildroot-2025.08.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.05.1.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.08.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.05.1.tar.xz">
+            <a href="/downloads/buildroot-2025.08.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.05.1.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.08.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index f36ac5894a..cb88dd695f 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.08 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>9 September 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2025.08 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08/CHANGES">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.08.tar.xz">2025.08 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 75a9d2feb1..3ad813f700 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2025.05'
+RELEASE='2025.08'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
