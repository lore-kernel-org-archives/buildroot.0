Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD2CD4335D
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 22:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E07B80E6B;
	Thu, 11 Dec 2025 22:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8O_Hd2Bwhc1; Thu, 11 Dec 2025 22:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46FEE81EB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765493222;
	bh=3R+0kzLjYV/tVCoYJIty+zciT76JnBo07fDxchiqhFQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QP8J74u8BbKbbSf8gQ8Rh4mFAl2WS1n6YlJcGkXNPxpfHU9HWcRYctze8hrNXxXlX
	 go/5znDj3KNIQ1BrcNCRKdRFFC6VRdRswlgA7ZpzqpAMwSMkvfK2N7mctxRtPbUtp7
	 k7/l3qn3QUvpI6h8ssWR6yk7RipweDX5tuhSqIB0u35EJSKqWHbdkjf0XXU6NQM+8V
	 sL8P0HJzHzVRASPi6sWmZCAYrKFgWeCqp1XDKXkHR0Z+ZrCf2Myi8w4+F7guBXsqA1
	 1VOOI6Susds9fqhBjqRyOaxxbljPLidt99EY1Z2RjjhgcKacbWkf6zdfqvSsHnPrZv
	 mYER/+JNAJygw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46FEE81EB5;
	Thu, 11 Dec 2025 22:47:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D093A2C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B64F74070C
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZsJZNHygfXu for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 22:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01A2940799
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01A2940799
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:46:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4D0286C58; Thu, 11 Dec 2025 22:46:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 23:46:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0aa7e5a23895627e28cbcd33f0b998c59023148
X-Git-Newrev: 08d71521d3da98939ce29dc0c673a21c8dc9277f
X-Patchwork-Hint: ignore
Message-Id: <20251211224658.E4D0286C58@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2025.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=08d71521d3da98939ce29dc0c673a21c8dc9277f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 15 +++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 18 ++++++++++--------
 docs/website/news.html     | 18 ++++++++++++++++++
 support/misc/Vagrantfile   |  2 +-
 5 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6b3dc3c21c..56267752c8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,18 @@
+2025.11, released December 11th, 2025
+
+	Fixes all over the tree.
+
+	linux: Default to 6.18 for runtime kernel and kernel headers,
+	drop the now EOL 5.4.x series.
+
+	Updated/fixed packages: apache, audit, cryptodev-linux,
+	dmraid, ficl, glibc, go, intel-mediadriver, intel-vpl-gpu-rt,
+	kbd, libcap, libdbi, libgit2, libpng, libtirpc, libxslt,
+	lugaru, mosh, pigz, podman, python-fonttools, python-urllib3,
+	python3, racehound, rdesktop, rtl8188eu, softhsm, sqlite,
+	strace, unbound, unzip, xapp_xkbutils,
+	xdriver_xf86-video-intel, xl2tp, xserver_xorg-server, xwayland
+
 2025.11-rc2, released November 30th, 2025
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 499284c256..4145574db0 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.11-rc2
+export BR2_VERSION := 2025.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1764530000
+BR2_VERSION_EPOCH = 1765493000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 1414631429..d1d92c8e6b 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -16,6 +16,7 @@
           <th>Latest release date</th>
           <th colspan="2">Downloads</td>
         </tr>
+<!--
         <tr>
           <th>Candidate</th>
           <th>2025.11.x</th>
@@ -42,30 +43,31 @@
             <a href="/downloads/buildroot-2025.11-rc2.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
+-->
         <tr>
           <th>Stable</th>
-          <th>2025.08.x</th>
-          <td>December 2025</td>
+          <th>2025.11.x</th>
+          <td>March 2026</td>
           <td>
-            2025.08.3<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.3/CHANGES">
+            2025.11<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/CHANGES">
               Changelog
             </a>
           </td>
           <td>2025-12-11</td>
           <td>
-            <a href="/downloads/buildroot-2025.08.3.tar.gz">
+            <a href="/downloads/buildroot-2025.11.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.08.3.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.11.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.08.3.tar.xz">
+            <a href="/downloads/buildroot-2025.11.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.08.3.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.11.tar.xz.sign">[PGP sig]</a>
           </td>
         <tr>
           <th>Long-term support</th>
diff --git a/docs/website/news.html b/docs/website/news.html
index 71f9283daf..d8d83e92a8 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,24 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.11 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 December 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The stable 2025.11 release is out - Thanks to everyone
+	  contributing and testing the release candidates. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/CHANGES">CHANGES</a>
+	  file for more details
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.11.tar.xz">2025.11 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 3ad813f700..fe2cf3b156 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2025.08'
+RELEASE='2025.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
