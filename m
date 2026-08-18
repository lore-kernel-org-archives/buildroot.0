Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F5CC5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 21:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B30640764;
	Tue, 18 Aug 2026 21:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yij4AUo8uezt; Tue, 18 Aug 2026 21:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787088684;
	bh=WmYxxfU5NkfRSsB8KGPxbRDlBHRkwhzcd7zox84wDHc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m51wJWr/q8IB4HV+KWBYtgjQ8GDiILp+ZIXj8EbDjMSG17A833Wpj5sPu/uxpUfpc
	 2UHaXov4j1VKcT0CP+24qTL5u7BAVsZBcQCEyobO52qpgHlDd3JLYvzjMXDy6WL69A
	 r17k0HFuyJ+rv7pXwXIdBDwrtRi6stpIHsDMsqRceCSxhoE4pgNXEEXiBbAAHo460C
	 2zBErNP55QJPRTAvuCJ68ZdzkYImVuNTKKunWRzbYdnnpRwbuUMR3cd5yk1sDkyZeV
	 QQe8Pad5RdL0ns7qbNDJGNUeiM1wpbuknxYSzkYoMqZ7qYlE1FwfvRhKyTUnoDXKWi
	 26X29Srji2iBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70507407D0;
	Tue, 18 Aug 2026 21:31:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D6BE29B
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EED340764
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zgv3vNUoIDS for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 21:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17C7C40762
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:31:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF7C98DBE1; Tue, 18 Aug 2026 21:30:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 18 Aug 2026 23:29:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05cd38635a1c2a8e6c44170b5eae8488b0c7a104
X-Git-Newrev: 5e53766dec8f09daf5a06dc2ba25536e4bb63360
X-Patchwork-Hint: ignore
Message-Id: <20260818213028.DF7C98DBE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2026.08-rc1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e53766dec8f09daf5a06dc2ba25536e4bb63360
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 36 ++++++++++++++++++++++++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 20 +++++++++-----------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 68 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2e67f5db09..a649442d99 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,39 @@
+2026.08-rc1, released August 18th, 2026
+
+	Fixes all over the tree and new features.
+
+        Architectures:
+        - Support for M68K nommu
+        - Support for IBM Power 10/11 variants
+
+        Toolchain:
+	- Support for Linux 7.1.x headers
+        - Binutils 2.46.1, GCC 16.2.0, now defaults to GCC 15
+        - Glibc 2.44, uClibc-ng 1.0.59
+        - Support for ARC-specific GCC version and external toolchain
+          dropped
+
+        Infrastructure:
+        - Support for building packages written in the hare
+          programming language
+        - Libudev virtual package, similar to jpeg or openssl.
+	- generate-cyclonedx: fixup scp-style git sites
+
+        New defconfigs: QEMU PPC64LE Powernv10 / Powernv11
+
+	Removed defconfigs: Acmesystems aria/arietta g25, Avnet S6LX9
+	Microboard, Technologic TS-4900 / TS-5500
+
+	New packages: agec, cpp-argparse, drogon, dtui, hare, harec,
+	hare-dbus, hare-ev, hare-xml, libcppconnman, liblc3, libudev,
+	libudev-zero, perl-cgi, perl-cgi-session, perl-log-message,
+	perl-log-message-simple, perl-switch, python-libyang,
+	python-sysv-ipc, qbe, qemu-xen, qt6grpc, qt6positioning,
+	scdoc, sdl3, sdl3_gfx, sdl3_image, sdl3_ttf, sigsum-c,
+	virglrenderer, wget2
+
+	Removed packages: argparse, ts4900-fpga
+
 2026.05.1, released July 15, 2026
 
 	Important / security related fixes:
diff --git a/Makefile b/Makefile
index 5a382644d9..6d0c86794f 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.08-git
+export BR2_VERSION := 2026.08-rc1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1780950000
+BR2_VERSION_EPOCH = 1787088000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 35d8c28dae..a9a4086f14 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -16,34 +16,32 @@
           <th>Latest release date</th>
           <th colspan="2">Downloads</td>
         </tr>
-<!--
         <tr>
           <th>Candidate</th>
-          <th>2026.05.x</th>
-          <td>September 2026</td>
+          <th>2026.08.x</th>
+          <td>December 2026</td>
           <td>
-            2026.05.1<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.1/CHANGES">
+            2026.08-rc1<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08-rc1/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-07-15</td>
+          <td>2026-08-18</td>
           <td>
-            <a href="/downloads/buildroot-2026.05.1.tar.gz">
+            <a href="/downloads/buildroot-2026.08-rc1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05.1.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.08-rc1.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.05.1.tar.xz">
+            <a href="/downloads/buildroot-2026.08-rc1.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05.1.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.08-rc1.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
--->
         <tr>
           <th>Stable</th>
           <th>2026.05.1.x</th>
diff --git a/docs/website/news.html b/docs/website/news.html
index 03ff2b6893..1fd87815eb 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.08-rc1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>18 August 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>We have a new release candidate! Lots of changes all over the tree, see the
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08-rc1/CHANGES">CHANGES</a>
+          file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+          <a href="/downloads/buildroot-2026.08-rc1.tar.xz">2026.08-rc1
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
