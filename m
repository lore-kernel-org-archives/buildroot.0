Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DFEF94CB0
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 21:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A99AD611DC;
	Tue, 21 Apr 2026 21:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAjBLqZua_FG; Tue, 21 Apr 2026 21:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0E1F61556
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776805705;
	bh=85gRLR9YLVBzA/sPoT4+1QCxg3SGmu9D99jqy154z0s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qeJ52E7+5H47C0o4rcxJY7FlRHimhEuqldsk+ewqlrdk2ifqzBj1ozDlKd1Gwkaq/
	 RSmqo3n5yRp0iSxpruOl8qQxzX2D+ASk7x3+CGRaToARiSel0TDmG2/o8xXDEyzQY9
	 iE7jtWwE9d7R4uQb4MEy3uEQl+mmujlfWap6T3EpHZNgM3zvS2RhbLfbZhVglW1dVX
	 By5JcPsH2Dt2IOyqwAXk9G7m35TVxRJ0WAj2elLPGnatKvV9C3E4KcNjYWWtz+F3Bn
	 KmAjH8TJ1iE3r9QjPjhH1MkEvr/Vak+6RlHjroMFgDz9iXaKCLZPdX7PYHrdmjZm+r
	 9Ndv5bXZKafAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0E1F61556;
	Tue, 21 Apr 2026 21:08:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F66E183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01A6A8413B
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USXc3xr4q-YI for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 21:08:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22ECB84133
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22ECB84133
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:08:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDF69821FA; Tue, 21 Apr 2026 21:08:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 23:02:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80898249b7e06d409a8a9cd433d687ce24c5224f
X-Git-Newrev: 6b1aeefe2c930c470b1ca22ccdc1bb95f76444cf
X-Patchwork-Hint: ignore
Message-Id: <20260421210822.BDF69821FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2025.02.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b1aeefe2c930c470b1ca22ccdc1bb95f76444cf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 33f86ba877..5bfb5f232b 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -101,25 +101,25 @@
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.12<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.12/CHANGES">
+            2025.02.13<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.13/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-03-17</td>
+          <td>2026-04-21</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.12.tar.gz">
+            <a href="/downloads/buildroot-2025.02.13.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.12.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.13.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.12.tar.xz">
+            <a href="/downloads/buildroot-2025.02.13.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.12.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.13.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index 3431a0b22c..2cda1bb1dd 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.13 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 April 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.13 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.12 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.13/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2025.02.13-announce-1776805227@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.13.tar.xz">2025.02.13 release</a>.</p>
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
