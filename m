Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F328CFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 19:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 325184025C;
	Sun, 30 Nov 2025 19:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PrFKRUcesvcg; Sun, 30 Nov 2025 19:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE9840200
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE9840200;
	Sun, 30 Nov 2025 19:21:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1250F1A9
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 19:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDD5A81750
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 19:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sT5A_SfZkTwn for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 19:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95D828154F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95D828154F
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 19:21:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9039486307; Sun, 30 Nov 2025 19:21:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Nov 2025 20:19:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8b15b078aeb9b9f3b42b9bdea91f2adff02fd09
X-Git-Newrev: 2b4ee4e72f9f0bdd8b1382bf5a2b02e3df89ea0e
X-Patchwork-Hint: ignore
Message-Id: <20251130192101.9039486307@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2025.11-rc2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b4ee4e72f9f0bdd8b1382bf5a2b02e3df89ea0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 21 +++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 12 ++++++------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index 17922ad650..65fc88d475 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,24 @@
+2025.11-rc2, released November 30th, 2025
+
+	Fixes all over the tree.
+
+	Infrastructure: support/scripts/check-merged (introduced in
+	2025.11-rc1) no longer relies on getopt from util-linux
+
+	Defconfigs: pine64 star: Update U-Boot and Linux kernel to fix
+	builds with GCC 14.x
+
+	Updated/fixed packages: 18xx-ti-utils, depot-tools, e2fsprogs,
+	enscript, fio, gnutls, intel-mediadriver, intel-vpl-gpu-rt,
+	ledmon, libpng, libteam, lmbench, mongoose, netsnmp,
+	nss-pam-ldapd, open-plc-utils, oprofile, pdmenu, php-apcu,
+	php-pecl-dbus, php-xdebug, php-yaml, python-flask-restx,
+	python-pysocks, python-starlette, sane-backends, sbc, sdl,
+	stress-ng, swipl, syslinux, time, tmux, tor, uboot-tools,
+	woff2, xfsprogs, yaml-cpp
+
+	Removed packages: libargtable2, starfive-spltool
+
 2025.11-rc1, released November 20th, 2025
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index d1d1c88943..499284c256 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.11-rc1
+export BR2_VERSION := 2025.11-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1763670000
+BR2_VERSION_EPOCH = 1764530000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 0d7bc6a017..6aa1cdfa2b 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -21,25 +21,25 @@
           <th>2025.11.x</th>
           <td>March 2026</td>
           <td>
-            2025.11-rc1<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11-rc1/CHANGES">
+            2025.11-rc2<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11-rc2/CHANGES">
               Changelog
             </a>
           </td>
           <td>2025-11-20</td>
           <td>
-            <a href="/downloads/buildroot-2025.11-rc1.tar.gz">
+            <a href="/downloads/buildroot-2025.11-rc2.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.11-rc1.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.11-rc2.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.11-rc1.tar.xz">
+            <a href="/downloads/buildroot-2025.11-rc2.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.11-rc1.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.11-rc2.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index e6dbe51428..dac3185270 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.11-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>30 November 2025</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11-rc2/CHANGES">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.11-rc2.tar.xz">2025.11-rc2
+	  release</a>, and report any problems found to the
+         <a href="support.html">mailing list</a> or
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
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
