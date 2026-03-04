Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DB0EB7EA0
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 08:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B967D80D0B;
	Wed,  4 Mar 2026 08:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1TTitCCBkAT; Wed,  4 Mar 2026 08:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B10D880D6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772611923;
	bh=+tus/G3sty5HJhBrfcd6tBynTtVwhF4TzdRkFW1dooY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EIZiHfzM1K1aopiqmMOY2ntzD4tV+qfc56L7jonML/G0a1E6VV3KFXsJmTPtG6tYH
	 idbfiAlsimNUJdexx2q0KWjBFlVdt+XlfwgNskb+1+ktRwXDk+xZ7eVjEfsXe+Uc1G
	 6bdRGKUz8P3TFy2HOo42hKA13QjndAg6D1PzyZuambaCpxb/v1rZHhUi066r1OLguw
	 tzSw9fo+mzZReT9WrmKAQL9LV2iXiuQkX14IQqipXJTLrV3NkJt4rRqrFjHxXc+k3m
	 YuJRZGC+a/VrV6rwn9V2dkuySW2cyYxkHmQdQOqLunCKfJr92G4yz6Zm3g5sKa6dzz
	 y0Kg+FPDsylUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B10D880D6E;
	Wed,  4 Mar 2026 08:12:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0AF5231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E275B40382
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLRS9_Fea7pn for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 08:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B339B4037E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B339B4037E
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:12:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACBB581E85; Wed,  4 Mar 2026 08:12:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 09:11:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 346d6667febdbec9a3c57e47009ab21e121b5b1d
X-Git-Newrev: 52ee2f5644da5389634b2465f1dc31deb5a4807c
X-Patchwork-Hint: ignore
Message-Id: <20260304081200.ACBB581E85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2026.02
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52ee2f5644da5389634b2465f1dc31deb5a4807c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  7 +++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 20 +++++++++++---------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index 503c2f0921..257c3ee8bc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,10 @@
+2026.02, released March 4th, 2026
+
+	Various fixes.
+
+	Updated/fixed packages: freerdp, graphicsmagick, ruby, nsquid,
+	vim
+
 2026.02-rc3, released March 2nd, 2026
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 04f915fd73..8e2cb0ae14 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.02-rc3
+export BR2_VERSION := 2026.02
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1772450000
+BR2_VERSION_EPOCH = 1772611600
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 9f4389098c..d9bdb640ac 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -16,6 +16,7 @@
           <th>Latest release date</th>
           <th colspan="2">Downloads</td>
         </tr>
+<!--
         <tr>
           <th>Candidate</th>
           <th>2026.02.x</th>
@@ -42,30 +43,31 @@
             <a href="/downloads/buildroot-2026.02-rc3.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
+-->
         <tr>
           <th>Stable</th>
-          <th>2025.11.x</th>
-          <td>March 2026</td>
+          <th>2026.02.x</th>
+          <td>June 2026</td>
           <td>
-            2025.11.2<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11.2/CHANGES">
+            2026.02<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-02-20</td>
+          <td>2026-03-04</td>
           <td>
-            <a href="/downloads/buildroot-2025.11.2.tar.gz">
+            <a href="/downloads/buildroot-2026.02.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.11.2.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.02.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.11.2.tar.xz">
+            <a href="/downloads/buildroot-2026.02.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.11.2.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.02.tar.xz.sign">[PGP sig]</a>
           </td>
         <tr>
           <th>Long-term support</th>
diff --git a/docs/website/news.html b/docs/website/news.html
index 8df3ba53bf..271c10f1b4 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.02 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>4 March 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2026.02 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/CHANGES">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.02.tar.xz">2026.02 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index fe2cf3b156..0185892c8a 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2025.11'
+RELEASE='2026.02'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
