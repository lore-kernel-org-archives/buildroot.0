Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E435D2629D
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 20:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BAE860A52;
	Tue, 20 Jan 2026 20:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmA99rSEu2-t; Tue, 20 Jan 2026 20:05:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7702160A5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768939510;
	bh=ganEAxKwwbMHwtGwTi6k17hlTEkIm8Tx/0nEp1aIl6g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tHRH6B4rQQTVm51/oL3Xl785km5n/Rc+Ns8AiVIOhag5U9biYPwz2x9whLDbn5/pQ
	 TCYY65hwvcGCez+/AbstFhQoFJgtxEXbpdvDpYONcgBe5H6Z8PjZoO/Tvj/VLZx0Ga
	 4qa3CF9ZqomPkQEu+JF0ftpD2QfHqi9vB70qrwJrD0jo8ByDB21sXPtTTaUsqoKvXZ
	 537X9ahhAllsviUVMl67mXt0nTLiXPKmqvzMg/RGQgYis45eb/pHmueaYKJ2V8G5wq
	 yIqKFfU1kdpjxgQ+Sq7cA7pqbLeb4+Tbu+sOQ6sxRcI6k3i86+6sGmiPrY+DEi7SLZ
	 WTV/GZCKK7OjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7702160A5B;
	Tue, 20 Jan 2026 20:05:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3069A2379
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 195CD80BA8
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oLgE2hgVs-p for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 20:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A7EC80BA0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A7EC80BA0
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:05:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3600088711; Tue, 20 Jan 2026 20:05:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Jan 2026 21:04:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50822d25d136fa17f5b37728bbb4a161c41f9447
X-Git-Newrev: 21dda0665e5de8ddb2a09f199679b2c4be1384fc
X-Patchwork-Hint: ignore
Message-Id: <20260120200504.3600088711@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/{download,
 news}.html: update for 2025.02.10 and 2025.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=21dda0665e5de8ddb2a09f199679b2c4be1384fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 28 ++++++++++++++--------------
 docs/website/news.html     | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 14 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index b2b4891464..9078194355 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -49,50 +49,50 @@
           <th>2025.11.x</th>
           <td>March 2026</td>
           <td>
-            2025.11<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/CHANGES">
+            2025.11.1<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11.1/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2025-12-11</td>
+          <td>2026-01-20</td>
           <td>
-            <a href="/downloads/buildroot-2025.11.tar.gz">
+            <a href="/downloads/buildroot-2025.11.1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.11.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.11.1.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.11.tar.xz">
+            <a href="/downloads/buildroot-2025.11.1.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.11.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.11.1.tar.xz.sign">[PGP sig]</a>
           </td>
         <tr>
           <th>Long-term support</th>
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.9<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.9/CHANGES">
+            2025.02.10<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.10/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2025-11-20</td>
+          <td>2022-01-20</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.9.tar.gz">
+            <a href="/downloads/buildroot-2025.02.10.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.9.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.10.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.9.tar.xz">
+            <a href="/downloads/buildroot-2025.02.10.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.9.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.10.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index bbb53ec429..71272ab7b7 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,44 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.11.1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 January 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.11.1 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.11 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11.1/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/f6496994-b279-46f4-b554-7dbe2df92782@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.11.1.tar.xz">2025.11.1 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.10 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 January 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.10 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.9 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.10/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/9b9654f8-6cdd-4108-b932-79509e455148@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.10tar.xz">2025.02.10 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
@@ -46,6 +84,7 @@
       </div>
     </div>
   </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
