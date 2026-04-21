Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4D4F94CB0
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 21:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B7E6155D;
	Tue, 21 Apr 2026 21:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHJdk7UTV7F2; Tue, 21 Apr 2026 21:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE1C960A9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776806315;
	bh=WoleaYG6S8NMw6quUW5JZkY4h2091+NA56SV6J6QX/s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IThVnEmlflld5D61brJpVilbgFnjDC5eCGTqIthjc5pVjQWwWnYWQ9bcvH+Wtxdwi
	 3F0gxl25OdyGkcELn27at6DnuhyKdUTeYxvAM9m60t5G9mW+XJCHs8MlI9aRngi3O8
	 3w35E52EoZGmlygIYoGbGwXdsrTejKWSeodHU+kGYWvkpS2NwQWB+M8u7skuEBws5L
	 n4PbyrhON0R5TeNKkRmgyQ2wgQMCmd90n20uK7BMpwNjBJdCtMm1Ukej0LrFfNFdKP
	 f9/sJuEgHUd/0pcza/VYlnrpRVGJqxhL4DSz9G+ZosRzCWsvuS+yMWEEO56JefUDws
	 GH+mR+woKnU+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE1C960A9B;
	Tue, 21 Apr 2026 21:18:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85108183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76A6C4042A
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKi_JpY-FMfo for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 21:18:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 888054041A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 888054041A
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:18:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 288AC8050F; Tue, 21 Apr 2026 21:18:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 23:10:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cab48e7f14062a093c7db6a3df0a17d2ebf6ac05
X-Git-Newrev: eb351836aa0683cdba6fc1407080592847be9950
X-Patchwork-Hint: ignore
Message-Id: <20260421211833.288AC8050F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2026.02.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb351836aa0683cdba6fc1407080592847be9950
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Remove the Old stable row, it is now thoroughly EOL.

Also remove the commented-out Candidate row. This update was done with
a (draft) script [1], and the script gets confused by the commented-out
row. The script is able to generate the row for a -rc1 release, so
there is no need for the commented-out row.

[1] https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/prepare-release?ref_type=heads

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 68 +++++-----------------------------------------
 docs/website/news.html     | 19 +++++++++++++
 2 files changed, 26 insertions(+), 61 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 5bfb5f232b..c21bd69a35 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -16,84 +16,30 @@
           <th>Latest release date</th>
           <th colspan="2">Downloads</td>
         </tr>
-<!--
-        <tr>
-          <th>Candidate</th>
-          <th>2026.02.x</th>
-          <td>June 2026</td>
-          <td>
-            2026.02-rc3<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02-rc3/CHANGES">
-              Changelog
-            </a>
-          </td>
-          <td>2026-03-02</td>
-          <td>
-            <a href="/downloads/buildroot-2026.02-rc3.tar.gz">
-              <img src="images/zip.png" width="24" alt="">
-              .tar.gz
-            </a><br/>
-            <a href="/downloads/buildroot-2026.02-rc3.tar.gz.sign">[PGP sig]</a>
-          </td>
-          <td>
-            <a href="/downloads/buildroot-2026.02-rc3.tar.xz">
-              <img src="images/package.png" width="24" alt="">
-              .tar.xz
-            </a><br/>
-            <a href="/downloads/buildroot-2026.02-rc3.tar.xz.sign">[PGP sig]</a>
-          </td>
-        </tr>
--->
         <tr>
           <th>Stable</th>
           <th>2026.02.x</th>
           <td>June 2026</td>
           <td>
-            2026.02<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/CHANGES">
+            2026.02.1<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.1/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-03-04</td>
-          <td>
-            <a href="/downloads/buildroot-2026.02.tar.gz">
-              <img src="images/zip.png" width="24" alt="">
-              .tar.gz
-            </a><br/>
-            <a href="/downloads/buildroot-2026.02.tar.gz.sign">[PGP sig]</a>
-          </td>
-          <td>
-            <a href="/downloads/buildroot-2026.02.tar.xz">
-              <img src="images/package.png" width="24" alt="">
-              .tar.xz
-            </a><br/>
-            <a href="/downloads/buildroot-2026.02.tar.xz.sign">[PGP sig]</a>
-          </td>
-        </tr>
-        <tr>
-          <th>Old stable (EOL)</th>
-          <th>2025.11.x</th>
-          <td>March 2026</td>
-          <td>
-            2025.11.3<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11.3/CHANGES">
-              Changelog
-            </a>
-          </td>
-          <td>2026-03-17</td>
+          <td>2026-04-21</td>
           <td>
-            <a href="/downloads/buildroot-202r.11.3.tar.gz">
+            <a href="/downloads/buildroot-2026.02.1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.11.3.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.02.1.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.11.3.tar.xz">
+            <a href="/downloads/buildroot-2026.02.1.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.11.3.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.02.1.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index 2cda1bb1dd..373240c92e 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.02.1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>21 April 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2026.02.1 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2026.02 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.1/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2026.02.1-announce-1776805568@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.02.1.tar.xz">2026.02.1 release</a>.</p>
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
