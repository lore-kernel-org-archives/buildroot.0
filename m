Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B13CD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 21:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7707B6F585;
	Tue, 16 Jun 2026 21:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IShSiTtUOJoJ; Tue, 16 Jun 2026 21:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 822456F558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781644531;
	bh=bFHJ0ZQ8b+GBJ73ti5kY1/XFWKKJRDO1ELElgXEYSuw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FGvySQJj/4SLLWGhRlZjATkqwO9csUPXdnqLKqMbtatxig2Zsx8snW0XNYCcyNfnI
	 ty1ijwAasl+qAotN+VuVvu+Pd3ibSpnLzHD9Xh9YiuuUIDFWT1hR4LY7RHz3vp1dHd
	 Tk+d/pYNfQZMd6zQ+s5s0KVRwiMbZzts/ewVbJgJ/ASce+dmLfTJYJskC8N8TBmjws
	 h+3g8Vhr18iy2m/jFrTDUYiwG5xp0Tu6mMsYTwSSwzG69uZX2X5x8ax2OLgz3wEmts
	 LdPFgX5JE5QLPUcrLVO8msjA+BUEbAiEnN/Q3nVOnLk3l4slvKzw5k7jbjKORxYhwn
	 xIjjx5qa314NQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 822456F558;
	Tue, 16 Jun 2026 21:15:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1481A347
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06C0842E95
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsOlc34vODUT for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 21:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B96442E7A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B96442E7A
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:15:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDE3F80F4B; Tue, 16 Jun 2026 21:15:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 23:14:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2448f2d2b0d0cf08686f193d60f9b5cb9a3d5079
X-Git-Newrev: c1f82f7ae226e33e891a0d0091a96b865feb82ef
X-Patchwork-Hint: ignore
Message-Id: <20260616211507.CDE3F80F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2025.02.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1f82f7ae226e33e891a0d0091a96b865feb82ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 8066793ce1..993ade9644 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -101,25 +101,25 @@
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.14<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.14/CHANGES">
+            2025.02.15<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.15/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-05-20</td>
+          <td>2026-06-16</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.14.tar.gz">
+            <a href="/downloads/buildroot-2025.02.15.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.14.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.15.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.14.tar.xz">
+            <a href="/downloads/buildroot-2025.02.15.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.14.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.15.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index 25535bee1c..0bf6d4d4e1 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.15 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>16 June 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.15 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.14 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.15/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2025.02.15-announce-1781644433@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.15.tar.xz">2025.02.15 release</a>.</p>
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
