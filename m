Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEA4FF6E74
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 20:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CD40606ED;
	Tue, 17 Mar 2026 20:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CINh1Q6hA-yy; Tue, 17 Mar 2026 20:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E0AA614C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773779729;
	bh=CI2PxxCBG88HrSVfQSmY5Do41b7refOX8/ibIOsUjnU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r14OpeH/36mX1KASqIpCOo70GXnIWqZySmDSQebkroUKHcBfGORYuYZ0zJ2qoQ8ZG
	 2sGTLyuUGnxj1CzoIvvNWXdKXVBmQdY/M90axbVqhT9KLqjGE4Q3a/tCNBBh42kA2E
	 QPJKMvmUirf+xxcKaTk2OUd9gYmwZ3fnfjDyPmswdvkQZR+Hq2DSlFGkK/PBZUFU5w
	 TijwWToGEryU3OJCgNTAWWWGjCUwyuW/OHBk2cqMlPEVnqgpk3z7a/eRxFpBJW6JWO
	 jbGBGPbuuq9FsD7CXoK8YBIsjOWyzezN9Shq/h9PwFFxdmID1vQ/HJOtPQhtE/P90C
	 VPCb7rlfLQd6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E0AA614C1;
	Tue, 17 Mar 2026 20:35:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B21111B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 20:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97DAF8340C
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 20:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_DoprDBYNRt for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 20:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC61D821F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC61D821F6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 20:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE59287394; Tue, 17 Mar 2026 20:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 Mar 2026 21:27:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09bc5515fc6ef50c9071bc113225e9756b03ce5e
X-Git-Newrev: b6cd84644360e8fc59e074b3baffaaa685f6c64a
X-Patchwork-Hint: ignore
Message-Id: <20260317203526.EE59287394@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/{download,
 news}.html: update for 2025.02.12 and 2025.11.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6cd84644360e8fc59e074b3baffaaa685f6c64a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The 2025.11.x series was dropped with the 2026.02 release, so
(temporarily) re-add it. It will be dropped again with the 2026.02.1
release.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 41 ++++++++++++++++++++++++++++++++++-------
 docs/website/news.html     | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 7 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index d9bdb640ac..33f86ba877 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -69,30 +69,57 @@
             </a><br/>
             <a href="/downloads/buildroot-2026.02.tar.xz.sign">[PGP sig]</a>
           </td>
+        </tr>
+        <tr>
+          <th>Old stable (EOL)</th>
+          <th>2025.11.x</th>
+          <td>March 2026</td>
+          <td>
+            2025.11.3<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11.3/CHANGES">
+              Changelog
+            </a>
+          </td>
+          <td>2026-03-17</td>
+          <td>
+            <a href="/downloads/buildroot-202r.11.3.tar.gz">
+              <img src="images/zip.png" width="24" alt="">
+              .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.11.3.tar.gz.sign">[PGP sig]</a>
+          </td>
+          <td>
+            <a href="/downloads/buildroot-2025.11.3.tar.xz">
+              <img src="images/package.png" width="24" alt="">
+              .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.11.3.tar.xz.sign">[PGP sig]</a>
+          </td>
+        </tr>
         <tr>
           <th>Long-term support</th>
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.11<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.11/CHANGES">
+            2025.02.12<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.12/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-02-20</td>
+          <td>2026-03-17</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.11.tar.gz">
+            <a href="/downloads/buildroot-2025.02.12.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.11.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.12.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.11.tar.xz">
+            <a href="/downloads/buildroot-2025.02.12.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.11.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.12.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index 7cc9dd5761..3431a0b22c 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,44 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.11.3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 March 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.11.3 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.11.2 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11.3/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/124c21a6-5810-495e-8b85-f3db41afa1a9@rnout.be/T/#t">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.11.3.tar.xz">2025.11.3 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.12 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>17 March 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.12 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.11 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.12/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/20260317200223.774600-1-arnout@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.12.tar.xz">2025.02.12 release</a>.</p>
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
