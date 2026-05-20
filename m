Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454ABCD5BA6
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 12:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01DC83B55;
	Wed, 20 May 2026 12:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSAjDeZngNGY; Wed, 20 May 2026 12:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A145C83B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779278756;
	bh=0Wj0vll/h2w4ar3bG7yumdY/MxqkrCDor9iUwWnZiDI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=erFDtMlljX0XDD6/15M02VSNIrRa1M4uQJJmHUjoXzem9/VrgdPUgcbcCo9LISfIu
	 07vbOGLmgWTYNu/aZSBsxVceLbP13LTaZv5Xw7AEhiHgPSctmiuemwN037+3fBkEI8
	 gkG4Oa9JzzrhiuPp9QpQ1RzIiE0HHLvF2YyrQrxYP7V6ajZQN1qExy/wgcJtcfOeE2
	 U9rCC7qsu0DGsbZ4InOVSYjjNhKqD4HkIHGktg5pj/Mc844x2mh7pmqwvq21WmPteo
	 2t+KN5AZWxv4+RTbPMWzAFjGqm+IzmUDiRK2l/Pk3ArLfB9KwHGUYzv5cj3uI6JYLQ
	 7CZCTftCvk3gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A145C83B6A;
	Wed, 20 May 2026 12:05:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2BF3357
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE96940889
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGFR3DDzfZUI for <buildroot@buildroot.org>;
 Wed, 20 May 2026 12:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B994C406A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B994C406A1
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:05:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4D9E868AE; Wed, 20 May 2026 12:05:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 14:02:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c17d110b10d4462822d712e327ee0579cf45af10
X-Git-Newrev: 01f9b3d7f2068911af7d3f8e9cfde0037bf8279c
X-Patchwork-Hint: ignore
Message-Id: <20260520120542.A4D9E868AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2025.02.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/01f9b3d7f2068911af7d3f8e9cfde0037bf8279c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 7e1462bbb3..9c4cc7ba0d 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -73,25 +73,25 @@
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.13<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.13/CHANGES">
+            2025.02.14<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.14/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-04-21</td>
+          <td>2026-05-20</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.13.tar.gz">
+            <a href="/downloads/buildroot-2025.02.14.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.13.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.14.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.13.tar.xz">
+            <a href="/downloads/buildroot-2025.02.14.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.13.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.14.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index fb2ecd527b..e50272188c 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.14 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 May 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.14 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.13 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.14/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2025.02.14-announce-1779278521@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.14.tar.xz">2025.02.14 release</a>.</p>
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
