Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F363ECA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCF5E8267C;
	Fri, 29 Aug 2025 10:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00v5EyrD_4-3; Fri, 29 Aug 2025 10:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CAC583B5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CAC583B5E;
	Fri, 29 Aug 2025 10:06:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D73BD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3CBF61567
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOG0pBcBOhRV for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20250614D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20250614D1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:06:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C53584993; Fri, 29 Aug 2025 10:06:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:06:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c84762675c760c471f09244cca87067ef43e545f
X-Git-Newrev: 5a63bbb85e1410cf37534ebcc33ec33a7e7aef15
X-Patchwork-Hint: ignore
Message-Id: <20250829100653.0C53584993@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/download: rework download section
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a63bbb85e1410cf37534ebcc33ec33a7e7aef15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Display active Buildroot versions as a table, similarly to kernel.org
- Add latest release date for all version
- Add expected End of Life dates for all versions
- Add link to the changelog

This makes the section much more compact, which makes it easier for
users to compare the versions and know what to expect from them

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/download.html | 190 +++++++++++++++++++++------------------------
 1 file changed, 88 insertions(+), 102 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index ee466e3d85..46887a0511 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -7,108 +7,94 @@
   <div class="panel panel-primary">
     <div class="panel-heading">Download</div>
     <div class="panel-body">
-
-      <h3 style="text-align: center;">Latest long term support release: <b>2025.02.5</b></h3>
-
-      <div class="row mt centered">
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2025.02.5.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2025.02.5.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-	  <h3><a href="/downloads/buildroot-2025.02.5.tar.gz">buildroot-2025.02.5.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.02.5.tar.gz.sign">PGP signature</a></p>
-	</div>
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2025.02.5.tar.xz"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2025.02.5.tar.xz"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3><a href="/downloads/buildroot-2025.02.5.tar.xz">buildroot-2025.02.5.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.02.5.tar.xz.sign">PGP signature</a></p>
-	</div>
-      </div>
-
-      <h3 style="text-align: center;">Latest stable release: <b>2025.05.1</b></h3>
-
-      <div class="row mt centered">
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2025.05.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2025.05.1.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-	  <h3><a href="/downloads/buildroot-2025.05.1.tar.gz">buildroot-2025.05.1.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.05.1.tar.gz.sign">PGP signature</a></p>
-	</div>
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2025.05.1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2025.05.1.tar.xz"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3><a href="/downloads/buildroot-2025.05.1.tar.xz">buildroot-2025.05.1.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.05.1.tar.xz.sign">PGP signature</a></p>
-	</div>
-      </div>
-
-      <h3 style="text-align: center;">Latest release candidate: <b>2025.08-rc3</b></h3>
-      <div class="row mt centered">
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2025.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2025.08-rc3.tar.gz"><img src="images/zip.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3><a href="/downloads/buildroot-2025.08-rc3.tar.gz">buildroot-2025.08-rc3.tar.gz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.08-rc3.tar.gz.sign">PGP signature</a></p>
-	</div>
-	<div class="col-sm-6">
-	  <div class="flip-container center-block" ontouchstart="this.classList.toggle('hover');">
-	    <div class="flipper">
-	      <div class="front">
-		<a href="/downloads/buildroot-2025.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	      <div class="back">
-		<a href="/downloads/buildroot-2025.08-rc3.tar.xz"><img src="images/package.png" width="180" alt=""></a>
-	      </div>
-	    </div>
-	  </div>
-
-	  <h3><a href="/downloads/buildroot-2025.08-rc3.tar.xz">buildroot-2025.08-rc3.tar.xz</a></h3>
-	  <p><a href="/downloads/buildroot-2025.08-rc3.tar.xz.sign">PGP signature</a></p>
-	</div>
-      </div>
+      <table class="table">
+        <tr>
+          <td></td>
+          <th>Series</th>
+          <th>End of Life</th>
+          <th>Latest release</th>
+          <th>Latest release date</th>
+          <th colspan="2">Downloads</td>
+        </tr>
+        <tr>
+          <th>Candidate</th>
+          <th>2025.08.x</th>
+          <td>December 2025</td>
+          <td>
+            2025.08-rc3<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08-rc3/CHANGES">
+              Changelog
+            </a>
+          </td>
+          <td>2025-08-28</td>
+          <td>
+            <a href="/downloads/buildroot-2025.08-rc3.tar.gz">
+              <img src="images/zip.png" width="24" alt="">
+              .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.08-rc3.tar.gz.sign">[PGP sig]</a>
+          </td>
+          <td>
+            <a href="/downloads/buildroot-2025.08-rc3.tar.xz">
+              <img src="images/package.png" width="24" alt="">
+              .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.08-rc3.tar.xz.sign">[PGP sig]</a>
+          </td>
+        </tr>
+        <tr>
+          <th>Stable</th>
+          <th>2025.05.x</th>
+          <td>September 2025</td>
+          <td>
+            2025.05.1<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05.1/CHANGES">
+              Changelog
+            </a>
+          </td>
+          <td>2025-08-11</td>
+          <td>
+            <a href="/downloads/buildroot-2025.05.1.tar.gz">
+              <img src="images/zip.png" width="24" alt="">
+              .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.05.1.tar.gz.sign">[PGP sig]</a>
+          </td>
+          <td>
+            <a href="/downloads/buildroot-2025.05.1.tar.xz">
+              <img src="images/package.png" width="24" alt="">
+              .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.05.1.tar.xz.sign">[PGP sig]</a>
+          </td>
+        </tr>
+        <tr>
+          <th>Long-term support</th>
+          <th>2025.02.x</th>
+          <td>March 2028</td>
+          <td>
+            2025.02.5<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.5/CHANGES">
+              Changelog
+            </a>
+          </td>
+          <td>2025-08-11</td>
+          <td>
+            <a href="/downloads/buildroot-2025.02.5.tar.gz">
+              <img src="images/zip.png" width="24" alt="">
+              .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.02.5.tar.gz.sign">[PGP sig]</a>
+          </td>
+          <td>
+            <a href="/downloads/buildroot-2025.02.5.tar.xz">
+              <img src="images/package.png" width="24" alt="">
+              .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.02.5.tar.xz.sign">[PGP sig]</a>
+          </td>
+        </tr>
+      </table>
 
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
