Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B294D41C2F
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 12:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8335C40F81;
	Thu, 11 Dec 2025 12:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAbEx3Q8PDZQ; Thu, 11 Dec 2025 12:41:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82A6F40F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765456895;
	bh=jfBvvvcn4ZjMsBiEacJzggMLu6SUpUE5MXwnos5q+9o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d5r0WAYdoQmc3wBqds4XT40vlLBNUKbDXZwxkQhDw24+BWu1HdZcYqeCbnEBeY7f8
	 zJktxZIp23iYcISdcg5vWpLwaQyVmC5JzxyBx+fg4UL5jVZrWFJjIDkl6w5LdprQCR
	 Q+GwdImWY5w9+7GhZZzhzRXMU4Y33bPuM/nXhs9e2q5RzIOmWXoM5QGQ94UgOIqs9u
	 XYSa0pSE2N1EVnBZKkyaTmfx6U6prERza4A+v9EClAN/2Nk2C7QBev6B7y1EVLQsSy
	 vInF963zAnu1knZejK7srYZ5/veXdjIKyAHWiS8adZJZ2kNoCQphhh4eTOfBKLsQ4K
	 VTUged64CKy2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82A6F40F83;
	Thu, 11 Dec 2025 12:41:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DEE2DE7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB19B4030D
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnnLOhB5dRmo for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 12:41:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E16D5404F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E16D5404F7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:41:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2DDC86A7F; Thu, 11 Dec 2025 12:41:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 13:40:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a09176f8a9919c5b1222be6de16f1c01ccbb6bdd
X-Git-Newrev: 9dd501bcc9fe95ff315e1b92539a6989e08d049c
X-Patchwork-Hint: ignore
Message-Id: <20251211124130.D2DDC86A7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/{download,
 news}.html: update for 2025.02.9 and 2025.08.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9dd501bcc9fe95ff315e1b92539a6989e08d049c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 26 +++++++++++++-------------
 docs/website/news.html     | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 6aa1cdfa2b..1414631429 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -47,50 +47,50 @@
           <th>2025.08.x</th>
           <td>December 2025</td>
           <td>
-            2025.08.2<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.2/CHANGES">
+            2025.08.3<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.3/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2025-11-20</td>
+          <td>2025-12-11</td>
           <td>
-            <a href="/downloads/buildroot-2025.08.2.tar.gz">
+            <a href="/downloads/buildroot-2025.08.3.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.08.2.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.08.3.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.08.2.tar.xz">
+            <a href="/downloads/buildroot-2025.08.3.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.08.2.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.08.3.tar.xz.sign">[PGP sig]</a>
           </td>
         <tr>
           <th>Long-term support</th>
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.8<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.8/CHANGES">
+            2025.02.9<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.9/CHANGES">
               Changelog
             </a>
           </td>
           <td>2025-11-20</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.8.tar.gz">
+            <a href="/downloads/buildroot-2025.02.9.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.8.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.9.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.8.tar.xz">
+            <a href="/downloads/buildroot-2025.02.9.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.8.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.9.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index dac3185270..71f9283daf 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,43 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.9 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 December 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.9 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.8 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.9/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/903acb17-d505-44b1-a4c8-6ee1d1e04853@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.9.tar.xz">2025.02.9 release</a>.</p>
+      </div>
+    </div>
+  </li>
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.08.3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>11 December 2025</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.08.3 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.08.2 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.3/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/31aa9f3b-d429-46c6-8bd5-1a153f5e86f6@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.08.3.tar.xz">2025.08.3 release</a>.</p>
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
