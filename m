Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C41F4BB71
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 18:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 311B96103F;
	Tue, 24 Feb 2026 18:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6WA-syBnyXC; Tue, 24 Feb 2026 18:27:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB50760DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771957627;
	bh=KdIsucdb9w9RR8om1LOq4zEfNENEWJJ2hR59iNLx4ZE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F3oph1ZGE3ZrMn7VeCyEe2fIxFqVGh6JOXnV6Vd2DY3RUcXLv1O4LtscASi6hbo49
	 QuDE5eabTiiZoE7KMjNzrEAqXz/aNA4bCmJ25MhY9hhsWx+Ev1uZhVUi4QmG/SbYb2
	 0qWv+k2KC7HChg1RzQ7ujnmrbAMoqfpLzlUVVFXZElNIowImiioBuHKB8jARCYm7Xl
	 91/uIAo8eBcNTY4q2KgREwGKaklsy5Xu4ZkIQb7uq87c3O6b+eZWT2RG8KnmADoDOi
	 vGNRkZEAU8K4aTH/AOt8X5+EepZAVuEjk66jt053ZiKmIBfhBE316YS1fFaw0+GtEP
	 VVwfvAC74fBuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB50760DF4;
	Tue, 24 Feb 2026 18:27:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE224204
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 18:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFF2A407C3
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 18:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0VAok56WK-b for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 18:27:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B72454078F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B72454078F
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 18:27:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38AF78730B; Tue, 24 Feb 2026 17:47:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 Feb 2026 18:43:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 173841426fe0edb1e80a47bdfdaf0f7ea1320d42
X-Git-Newrev: 50b3b887cb55b91a470b27d5a29ef8af65546398
X-Patchwork-Hint: ignore
Message-Id: <20260224174758.38AF78730B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2026.02-rc2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50b3b887cb55b91a470b27d5a29ef8af65546398
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |  9 +++++++++
 Makefile                   |  4 ++--
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 21 +++++++++++++++++++++
 4 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 985bb44f5b..63a295250f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,12 @@
+2026.02-rc2, released February 24th, 2026
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: bind, c-ares, libzlib, mpir, netsnmp,
+	python-anyio, python-fastapi, python-jsonschema,
+	python-pybind, python-starlette, qemu, ruby, snort, systemd,
+	wmctrl, wpewebkit
+
 2026.02-rc1, released February 17th, 2026
 
 	Fixes all over the tree and new features.
diff --git a/Makefile b/Makefile
index 53aa4da731..790ad6d297 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.02-rc1
+export BR2_VERSION := 2026.02-rc2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1771320000
+BR2_VERSION_EPOCH = 1771955000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/docs/website/download.html b/docs/website/download.html
index e80fc11c34..9727bff3f9 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -21,25 +21,25 @@
           <th>2026.02.x</th>
           <td>June 2026</td>
           <td>
-            2026.02-rc1<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02-rc1/CHANGES">
+            2026.02-rc2<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02-rc2/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-02-17</td>
+          <td>2026-02-24</td>
           <td>
-            <a href="/downloads/buildroot-2026.02-rc1.tar.gz">
+            <a href="/downloads/buildroot-2026.02-rc2.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.02-rc1.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.02-rc2.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.02-rc1.tar.xz">
+            <a href="/downloads/buildroot-2026.02-rc2.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.02-rc1.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.02-rc2.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index 3597d99d75..a8d9093468 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.02-rc2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 February 2026</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02-rc2/CHANGES">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.02-rc2.tar.xz">2026.02-rc2
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
