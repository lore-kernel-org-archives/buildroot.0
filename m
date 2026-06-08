Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E13CCD8CA4
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 20:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26BB284C8A;
	Mon,  8 Jun 2026 20:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_Q0EL53Pmu0; Mon,  8 Jun 2026 20:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 332CE84C8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780951228;
	bh=br7QHeNN6mDAcp4LNl+POHrLeRM6GwIOA3sS81jUI7w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MbVu8RYl5kqLzDPqCHc2G4TmiiSbbBw1sdjelRFs4CZBtZRGcdPJLfCSEP/bdNzei
	 RQiQFFaCrvi/VacUGb8vU45UVki1qJbzRIAQaWKNEJbsEakXSZ9MDMCZZMuzQaa/7O
	 CgosPEMp2cUMF16A4INsSEwVpJPIEbAPO0CAqb3Tj5m3QYx736BE47cpDZsCaxDwJ9
	 n5jBbyGhz1VgwaF8FgbUrvcXh2xddRAP4HwrK21htjILrwN5yQypjy61AYAWOGTI9m
	 AGprWMMVbHs9X5V/L+8wkXnRSQRq1ZdJvNS1vxtpGbY4000EqoewixurvfE+Mxp/YC
	 fyB0rK2ofuU8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 332CE84C8E;
	Mon,  8 Jun 2026 20:40:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9531EC
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 20:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF76241E74
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 20:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SldC3tUk_d2k for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 20:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB48E42248
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB48E42248
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 20:40:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5697C87DE5; Mon,  8 Jun 2026 20:40:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jun 2026 22:39:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94b2cc09e2bbc5c43f3374aa8c884dccf3c5cc93
X-Git-Newrev: 313414b92c2501a2bc123ffa1b6383dca464de05
X-Patchwork-Hint: ignore
Message-Id: <20260608204008.5697C87DE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2026.05
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/313414b92c2501a2bc123ffa1b6383dca464de05
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 10 ++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 20 +++++++++++---------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9c5c08a360..c81ed63371 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,13 @@
+2026.05, released June 8th, 2026
+
+	Various fixes.
+
+	Defconfigs: Correct legal-info for at91sam9x5ek*
+	(at91bootstrap3) and Arcturus ucp1020 (Linux)
+
+	Updated/fixed packages: jailhouse, libde265, libinput, libusb,
+	php, python3, runc
+
 2026.05-rc4, released June 4th, 2026
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 63356e6901..93afd97507 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.05-rc4
+export BR2_VERSION := 2026.05
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1780580000
+BR2_VERSION_EPOCH = 1780950000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index c7d15b2570..e2762f01af 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -16,6 +16,7 @@
           <th>Latest release date</th>
           <th colspan="2">Downloads</td>
         </tr>
+<!--
         <tr>
           <th>Candidate</th>
           <th>2026.05.x</th>
@@ -42,30 +43,31 @@
             <a href="/downloads/buildroot-2026.05-rc4.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
+-->
         <tr>
           <th>Stable</th>
-          <th>2026.02.x</th>
-          <td>June 2026</td>
+          <th>2026.05.x</th>
+          <td>September 2026</td>
           <td>
-            2026.02.2<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.2/CHANGES">
+            2026.05<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-05-20</td>
+          <td>2026-06-08</td>
           <td>
-            <a href="/downloads/buildroot-2026.02.2.tar.gz">
+            <a href="/downloads/buildroot-2026.05.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.02.2.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.02.2.tar.xz">
+            <a href="/downloads/buildroot-2026.05.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.02.2.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index 3c9f914f0e..7756b0a1fd 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.05 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>8 June 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2026.05 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05/CHANGES">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.05.tar.xz">2026.05 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 0185892c8a..6e5fad3202 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2026.02'
+RELEASE='2026.05'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
