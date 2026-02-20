Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27009C53200
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 08:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C481960F7C;
	Fri, 20 Feb 2026 08:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_7oOgaD8PbA; Fri, 20 Feb 2026 08:22:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFC5760FBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771575744;
	bh=XJiTYF8d39qDaPgKH24SYng9OCPB9WDLPNdTQHxgZps=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ae5MEi5SSliTnLpvFVyvLx6OOB/kBwy8dtS6UagXigUedAwweEhFZaqlwT+kXSq3q
	 K3WlaJhglPPkSUS7hHO1xtcMkBgjEYSqunelrg94yTLzgwbd9GFDLf0s9ue84izFeY
	 nI/UMffSWWo9XrtHsMLZvnMUuGZ/QkvNCVsRUPAL23BjdIdnMKc05aDUyPG6ouc7I2
	 Kdprc2qFAkfY04ouK0Jh7pYRzZ7uM0/uZnPQIzQaFy+IIbPgpZR72S2tedv90m0Uzv
	 +o6ZUPmOt4jm1u0HL/uXxT0kzNzfnDHVCp6frE1XuUXBlZ5g/722THEwrhOOwKxsVn
	 rMKGdMYTKyUuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC5760FBC;
	Fri, 20 Feb 2026 08:22:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95B4A183
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 08:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86E2060FBC
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 08:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iex6cKvFzR35 for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 08:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F28560F7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F28560F7C
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 08:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85EF787160; Fri, 20 Feb 2026 08:22:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Feb 2026 09:19:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91a0ef51833094ed932535f6e4760b85914f5a06
X-Git-Newrev: c5b3baacafd3424e3512fd7ffc442eb41ca80d95
X-Patchwork-Hint: ignore
Message-Id: <20260220082222.85EF787160@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/{download,
 news}.html: update for 2025.02.11 and 2025.11.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c5b3baacafd3424e3512fd7ffc442eb41ca80d95
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 26 +++++++++++++-------------
 docs/website/news.html     | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 13 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 521c2b603f..9048927bda 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -47,50 +47,50 @@
           <th>2025.11.x</th>
           <td>March 2026</td>
           <td>
-            2025.11.1<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11.1/CHANGES">
+            2025.11.2<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11.2/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-01-20</td>
+          <td>2026-02-20</td>
           <td>
-            <a href="/downloads/buildroot-2025.11.1.tar.gz">
+            <a href="/downloads/buildroot-2025.11.2.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.11.1.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.11.2.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.11.1.tar.xz">
+            <a href="/downloads/buildroot-2025.11.2.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.11.1.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.11.2.tar.xz.sign">[PGP sig]</a>
           </td>
         <tr>
           <th>Long-term support</th>
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.10<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.10/CHANGES">
+            2025.02.11<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.11/CHANGES">
               Changelog
             </a>
           </td>
           <td>2026-01-20</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.10.tar.gz">
+            <a href="/downloads/buildroot-2025.02.11.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.10.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.11.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.10.tar.xz">
+            <a href="/downloads/buildroot-2025.02.11.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.10.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.11.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index 4a9092dd3f..3597d99d75 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,44 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.11.2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 February 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.11.2 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.11 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11.2/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/de9c890a-760a-4e6d-86b8-f8e5000a07ff@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.11.2.tar.xz">2025.11.2 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.11 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 February 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.11 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.9 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.11/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/e0164268-1836-426e-8a81-5e2790b8cc3e@rnout.be/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.11.tar.xz">2025.02.11 release</a>.</p>
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
