Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1DCC44507
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 19:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40C8E40612;
	Wed, 15 Jul 2026 19:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqlVNpLGrXvU; Wed, 15 Jul 2026 19:35:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E45C40659
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784144150;
	bh=HLRvzs4Wl/JPrX2cxmi+OBvxT8BZaohQ7pzDKgvPXMk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FVOOxNoO7L/6lDegWj3OWrIH+ytadBbt5wfTM3ozV6ONTKtuWgkkZ18TEz4N665JG
	 emNNIcm075GwPfsXhWOKu7b3ZIRdPHdLKyPxfrEaCTayb6D7PIAP1/1zzcIQKWqrSi
	 3Wk2b8nf7Yjo20iT7RU9Zypobn9DGeBJ/BJp/OhYrni+EJkKX9o7YdSAxj+LoxOT6B
	 6PO3c2K0wPCUaK1rK4jtDd85XpR0jYGW5nIt+NmWaEo3KXjIKYvq0aq3fSQcpSeUam
	 1kFm7FwVdZbid2p6G3vuAPYh/xCHJTAdx2dom8ziFoD/WkeJRrZDERvZlqvKaSX9le
	 xSOy5gWrIBZPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E45C40659;
	Wed, 15 Jul 2026 19:35:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EF291F6
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64D8D605E6
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfpaDJVrFJCF for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 19:35:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86BD7605CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86BD7605CF
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:35:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2936E88997; Wed, 15 Jul 2026 19:35:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Jul 2026 21:33:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea49b5d3a7ff48aacaec56671c53982f14e88c13
X-Git-Newrev: 6a944c0fa72b8b7f5d6a15ce5b71665984ee91e3
X-Patchwork-Hint: ignore
Message-Id: <20260715193512.2936E88997@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2026.05.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6a944c0fa72b8b7f5d6a15ce5b71665984ee91e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 30 +++++++++++++++---------------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 9240f9d714..57183da23c 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -22,52 +22,52 @@
           <th>2026.05.x</th>
           <td>September 2026</td>
           <td>
-            2026.05-rc4<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc4/CHANGES">
+            2026.05.1<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.1/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-06-04</td>
+          <td>2026-07-15</td>
           <td>
-            <a href="/downloads/buildroot-2026.05-rc4.tar.gz">
+            <a href="/downloads/buildroot-2026.05.1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05-rc4.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05.1.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.05-rc4.tar.xz">
+            <a href="/downloads/buildroot-2026.05.1.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05-rc4.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05.1.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
 -->
         <tr>
           <th>Stable</th>
-          <th>2026.05.x</th>
+          <th>2026.05.1.x</th>
           <td>September 2026</td>
           <td>
-            2026.05<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05/CHANGES">
+            2026.05.1<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.1/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-06-08</td>
+          <td>2026-07-15</td>
           <td>
-            <a href="/downloads/buildroot-2026.05.tar.gz">
+            <a href="/downloads/buildroot-2026.05.1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05.1.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.05.tar.xz">
+            <a href="/downloads/buildroot-2026.05.1.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.05.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.05.1.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index 1929ff7f93..03ff2b6893 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.05.1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>15 July 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2026.05.1 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2026.05 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.1/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2026.05.1-announce-1784143976@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.05.1.tar.xz">2026.05.1 release</a>.</p>
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
