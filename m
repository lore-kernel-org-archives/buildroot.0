Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEFCC5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 21:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F207080B6A;
	Sun, 23 Aug 2026 21:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cL7JurL4eXQk; Sun, 23 Aug 2026 21:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787519386;
	bh=kXH9psbruuWXwNBIfZxGwo50xc/7cq4BI0LzSu6IJNY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SUkiq9WRRVK1uugGWTvTZWNwdrhJWgWn5hyr44ypTDoibKpYVvOu2j3S0Uc2w4cVN
	 RTfRGDvzNuSUUorOp0aAw6ls2yDmT9sfC2KdyC/+LP1//XElNiIq6bHXIwQPpHybjD
	 VXz2AET243l0+X1il78LHwdjukQs+k3sC107aHtTXezfMRHYXlEE1oXgPcoemsQKVW
	 6HfsNE3o/7V5W4kWrkE4G0e6H+DkI6gu7NDSA6jFRhpPm41xmy8+t/dfa74pXnEJoI
	 XIBFznRMlSqm43hHQRttSfG+kGdFLE6r1DJTXv6mzhOj5J71hce69rzi7mr9L+FuEX
	 lyWw86Hozt3qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B9A780B6B;
	Sun, 23 Aug 2026 21:09:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B7123DA
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 824B340057
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnQMrFbHLdoj for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 21:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C252040056
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 131A18F057; Sun, 23 Aug 2026 21:08:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 23:08:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66c46083e2386d45e1dbf7168c25a0320c822133
X-Git-Newrev: 212b7edc22623e38aa2b0165e34e2b9a541d5ba3
X-Patchwork-Hint: ignore
Message-Id: <20260823210849.131A18F057@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2026.08-rc2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/212b7edc22623e38aa2b0165e34e2b9a541d5ba3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 15 +++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9a6ba4cae5..fa8671dad7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,18 @@
+2026.08-rc2, released August 23th, 2026
+
+	Fixes all over the tree.
+
+        Infrastructure:
+        - Correct <pkg>_FLAT_STACKSIZE handling for nommu
+
+        Defconfigs: QEMU x86-64 EFI: Fix build issue after grub2 bump.
+
+	Updated/fixed packages: clamav, distribution-registry, dracut,
+	drogon, enscript, fluidsynth, gdb, igh-ethercat, kodi,
+	libgpiod2, libssh2, linux-tools, mesa3d, mtools, netsnmp,
+	putty, python-scp, uclibc, udisks, uhttpd, webkitgtk, wget,
+	wireshark, xilinx-embeddedsw
+
 2026.08-rc1, released August 18th, 2026
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 6d0c86794f..4e59c7b87f 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.08-rc1
+export BR2_VERSION := 2026.08-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1787088000
+BR2_VERSION_EPOCH = 1787519000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 9ed1ef6590..62783633ae 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -21,25 +21,25 @@
           <th>2026.08.x</th>
           <td>December 2026</td>
           <td>
-            2026.08-rc1<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08-rc1/CHANGES">
+            2026.08-rc2<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08-rc2/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-08-18</td>
+          <td>2026-08-23</td>
           <td>
-            <a href="/downloads/buildroot-2026.08-rc1.tar.gz">
+            <a href="/downloads/buildroot-2026.08-rc2.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.08-rc1.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.08-rc2.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.08-rc1.tar.xz">
+            <a href="/downloads/buildroot-2026.08-rc2.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.08-rc1.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.08-rc2.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index efb1d0693d..4a4f2a3061 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.08-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 August 2026</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08-rc2/CHANGES">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.08-rc2.tar.xz">2026.08-rc2
+	  release</a>, and report any problems found to the
+         <a href="support.html">mailing list</a> or
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
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
