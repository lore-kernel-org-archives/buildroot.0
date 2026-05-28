Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194F6CD5BD5
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 22:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68947608D7;
	Thu, 28 May 2026 22:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gEdwKWdwUtFp; Thu, 28 May 2026 22:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FA50608C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780006856;
	bh=0nmpg9hPOIZ79VugABUInZkQ2GM92WUd0s/Z8Rh+OI4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IGVIk/QtsxiBxfcvaiOf3AZbsv9GMIg3ueSeUFb1DiMXILSdeaFb0obC+YYTyhPmZ
	 zLdD00S5nr7+A/Wg7/hWyPTOKZp7HgQDTxk7gIdLuLN59v9T8OAQ2kCiVOeAVGgj7O
	 GOasdyUywJtq/BgwMEbGmtq+iVAeFClA7sbT/Sz3Q3CCEL7rSt7Nmew3GZax0yr8/o
	 j8bqV04rM8Fe8B+NAqMjqXOPjcjJsxMrjv81ESwIRH8rQyieAxyb0cN6fKcZqLLqsy
	 OylmPdionmRFf2ssdre7QHud6RclrNEim+Iv4zLM0y9iPQBBJAVwQiopxBqMs9lhSn
	 wT6ysGoTQO/EA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FA50608C8;
	Thu, 28 May 2026 22:20:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DA6428E
 for <buildroot@buildroot.org>; Thu, 28 May 2026 22:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A997817C0
 for <buildroot@buildroot.org>; Thu, 28 May 2026 22:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHfCBp3i8bsW for <buildroot@buildroot.org>;
 Thu, 28 May 2026 22:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8B5081786
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8B5081786
 for <buildroot@buildroot.org>; Thu, 28 May 2026 22:20:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88BE887172; Thu, 28 May 2026 22:20:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 00:20:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5601740113111269cd0717062fdef039b17763d
X-Git-Newrev: d5aef8a047cf83e70868174da22891edd603003b
X-Patchwork-Hint: ignore
Message-Id: <20260528222041.88BE887172@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2026.05-rc3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d5aef8a047cf83e70868174da22891edd603003b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  8 ++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7108e98fcd..568908d144 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,11 @@
+2026.05-rc3, released May 29th, 2026
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: kexec, libde265, libheif,
+	llvm-project, mariadb, mesa3d, mpd, nginx, putty,
+	python-urllib3, radvd, samba4, unbound
+
 2026.05-rc2, released May 21th, 2026
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index ffba8ba6a2..cb52a1d668 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.05-rc2
+export BR2_VERSION := 2026.05-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1779398000
+BR2_VERSION_EPOCH = 1780006000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index c1d8a366ce..0b03034886 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -21,25 +21,25 @@
           <th>2026.05.x</th>
           <td>September 2026</td>
           <td>
-            2026.05-rc2<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc2/CHANGES">
+            2026.05-rc3<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc3/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-05-21</td>
+          <td>2026-05-29</td>
           <td>
-            <a href="/downloads/buildroot-2026.05-rc2.tar.gz">
+            <a href="/downloads/buildroot-2026.05-rc3.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05-rc2.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05-rc3.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.05-rc2.tar.xz">
+            <a href="/downloads/buildroot-2026.05-rc3.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05-rc2.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05-rc3.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index 6e48090b1f..b0b32892cd 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.05-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 May 2026</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc3/CHANGES">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.05-rc3.tar.xz">2026.05-rc3
+	  release</a>, and report any problems found to the
+         <a href="support.html">mailing list</a> or
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
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
