Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B1DE9B365
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 12:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32947419EB;
	Mon,  2 Mar 2026 12:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWraCWOd84Qj; Mon,  2 Mar 2026 12:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 623BD41942
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772454041;
	bh=4zvs0+pTSMu2BWT6/oWwhU+gVuFtJTKmnwnryDoBdok=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Uj3OEiz0GZVrrt6GWlNw4K081JjkLb6E/YTSF/5VqohJ2Pq838k74DTTnW9RP+0Ap
	 IJBi5LVRNUF/RjkJJLV+jWgKbgd8g+iExU7VXLg2xuRUPdkLWPUEFnBMnzyULkCV6f
	 JMm7tuV7RCbQjh128nJPJxmuFcZe93tTsANlRSVl51y5U3ULFQnJpWx+aqXNTrRbEM
	 61kqDgACSZi7yLP9f+HXMvtDAuHFqyk6ZsZ11X1rkgQvQWURYG2j9vJVNrtV6jGE6r
	 +Xy/4gQzsqSYGqlzWTHPQjcnv93c2AOT3pGKQfR0n8b1w4tWgsGUOk0KHBPOddi6zm
	 PIXAVynunK9pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 623BD41942;
	Mon,  2 Mar 2026 12:20:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21FEF25D
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 12:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 079CF40542
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 12:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0kiW5hcxozY for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 12:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D9D640443
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D9D640443
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 12:20:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16F56845D2; Mon,  2 Mar 2026 12:20:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Mar 2026 13:11:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 311e5cdc5151536ffc7280604e28de5f0fe245b5
X-Git-Newrev: 8195c73ca33f47767b4e14f5d706acaebe0ee1f4
X-Patchwork-Hint: ignore
Message-Id: <20260302122038.16F56845D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2026.02-rc3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8195c73ca33f47767b4e14f5d706acaebe0ee1f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    | 14 ++++++++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 63a295250f..503c2f0921 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,17 @@
+2026.02-rc3, released March 2nd, 2026
+
+	Fixes all over the tree.
+
+	support/testing/run-tests: Work around a node2 patch in Debian
+	testing/unstable:
+	https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1129350
+
+	Updated/fixed packages: bind, botan, containerd, cups, gpsd,
+	flashbench, igmpproxy, imagemagick, libssh, libunistring,
+	libvirt, mesa3d, mupdf, openscap, patch, poco,
+	python-multipart, rtl_433, safeclib, samba4, tinyproxy,
+	udisks, webkitgtk, wireshark, wlroots, wpewebkit
+
 2026.02-rc2, released February 24th, 2026
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 790ad6d297..04f915fd73 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.02-rc2
+export BR2_VERSION := 2026.02-rc3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1771955000
+BR2_VERSION_EPOCH = 1772450000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index 9727bff3f9..9f4389098c 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -21,25 +21,25 @@
           <th>2026.02.x</th>
           <td>June 2026</td>
           <td>
-            2026.02-rc2<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02-rc2/CHANGES">
+            2026.02-rc3<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02-rc3/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-02-24</td>
+          <td>2026-03-02</td>
           <td>
-            <a href="/downloads/buildroot-2026.02-rc2.tar.gz">
+            <a href="/downloads/buildroot-2026.02-rc3.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.02-rc2.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.02-rc3.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.02-rc2.tar.xz">
+            <a href="/downloads/buildroot-2026.02-rc3.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.02-rc2.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.02-rc3.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index a8d9093468..8df3ba53bf 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.02-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>2 March 2026</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02-rc3/CHANGES">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.02-rc3.tar.xz">2026.02-rc3
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
