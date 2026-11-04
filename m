Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C046095287
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 19:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=J6+gEq5q
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B095607D5;
	Wed,  4 Nov 2026 19:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfR4oV-9n7zG; Wed,  4 Nov 2026 19:52:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BFBB76081E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793821949;
	b=AG1BjxzGBtEUFmTaYrUOKkHovXLHEiI9p4BGgY6dUMLiJ7w/abD/KRjXELoFWEjeZ2rw
	 ROQ0bqJHX1q+alJQvSQQtd4KRONcWeAgsmhofP4d4Bqfr+5ddjrp5GWS9mwKatTqQh2Ar
	 +5Getupqf3bkdtYoOTaTuIQ7MXp3w35PM5MgNsCiym+tXBc60Jph2BR4IigNqUsFVz93p
	 BHEThU9ZGdpCdGCmnhyAPz2p72+oIxOrgp6q9CvYzfn/HmBwNJKqM9R5jWDqHXomz76J3
	 jabDSBg5UUjQAQlDnpedjGaW7P2H1PEjsYg7/Q7SpTxQXFFcsveE4TbyiKbvWmlzbww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793821949;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SikkWW3TDSIy4x3BhX0JdylqAgYIbhv86KxYxiFJobE=;
	b=Q0f4ALG0Y3R6mnOFwFUYY6fPt5mPe+mgiH0H6pDp4Fzh1Fo4f18otitMJS0BSY+Mf+OO
	 WkQqQebGNLB8zcgoWFMrSYi4BcLpwEvrz++gSDAWUEXpmo7U/rIDPYwWtH7kgGFG+uD1E
	 XEnqDJK16l+CHozTVz2DWgct9Wk/PjkJqOHb5aj3zzgrlzMx118BJ1rUJhgf7UHE8l8lu
	 apOXppqC84Zdnm31dzruQ6DcOqosRL4PfqThkHKEZn8q4mqeHtYpIGe30ONg/eocGvgeL
	 hcpkyjIXkHKooitpoQX5FczLc3WoUSaB2289WWJwtimx25FcHVkMGrGk6S/sTcdXNqg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793821949;
	bh=SikkWW3TDSIy4x3BhX0JdylqAgYIbhv86KxYxiFJobE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J6+gEq5qENqkYe+ulMioF8cNcua6Rgkr3iqlsCoHTTqkhSGVfU/rkovNu4CWLGWKt
	 lbLp23YRknI7pGy8NTpHagEJvj1/DfU+1KC4jYGTh7PukxKp8Wt9OQvZx4tGD1KkmL
	 BkGTRTSVuNLpYmjtq5HCPhH35uNouevzmNmIa7BbkoiSLI1HmJ6Urpimz10mbVncVt
	 xUH8hjcIXM7EPysWYMhrmKKNaOT8kPE0t7B8i/infq2SgnlWf2OJeUzdVq1QLAShhs
	 ZeWYC145kq4OYRmpJ0U3tSjFg+7G84hK7ycJSN3fm2iuZbVElMCf0Hgc6Gg5El5Rq+
	 kvjyu4Cp4358A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFBB76081E;
	Wed,  4 Nov 2026 19:52:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AEB6D178B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9090E400B3
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOSwyaX4zAfD for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3CD9B40062
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CD9B40062
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 671769DD49; Wed,  4 Nov 2026 19:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 20:44:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 913e48076e9e6ee9fa106bfe812ceb8e54a70339
X-Git-Newrev: ea3075c74bb4f196ebcc02807439a97eaee9f6cc
X-Patchwork-Hint: ignore
Message-Id: <20261104195044.671769DD49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/lts: align page style with the
 rest of the website
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea3075c74bb4f196ebcc02807439a97eaee9f6cc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The LTS page used its own visual style (pixel and serif fonts, grid
backgrounds, offset shadows) which looked out of place compared to the
other pages of the website.

Rework it to use the website style:
- use the #headerwrap blue header from the main page, keeping a big
  title
- use Bootstrap primary panels for the sections, as done in the
  support and sponsors pages
- replace the big numbers with round badges and use the website
  fonts for the item titles
- use the website blue, font and panel shadow in the charts, widen
  the labels column of the weekly chart and allow the charts to
  scroll horizontally on small screens instead of overlapping
- add a contact button to the sponsor section

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/css/lts.css | 272 ++++++++++++-----------------------------------
 docs/website/lts.html    | 164 +++++++++++++---------------
 2 files changed, 146 insertions(+), 290 deletions(-)

diff --git a/docs/website/css/lts.css b/docs/website/css/lts.css
index c1e9b198a8..deee73eee3 100644
--- a/docs/website/css/lts.css
+++ b/docs/website/css/lts.css
@@ -1,26 +1,7 @@
-@font-face {
-  font-family: "Compagnon Light";
-  src: url("/fonts/compagnon-light.woff") format("woff");
-  font-weight: 300;
-  font-style: normal;
-  font-display: swap;
-}
-
-@font-face {
-  font-family: "Terminal Grotesque";
-  src: url("/fonts/terminal-grotesque.woff") format("woff");
-  font-weight: normal;
-  font-style: normal;
-  font-display: swap;
-}
-
 :root {
-    --br-blue: #2b7de0;
+    --br-blue: #3498db;
     --br-grid: #dceeff;
     --br-yellow: #dcb045;
-    --font-pixel: "Terminal Grotesque", sans-serif;
-    --font-serif: "Compagnon Light", serif;
-    --br-grid-size: 40px;
 }
 
 @keyframes slideDownFade {
@@ -40,234 +21,109 @@
 }
 
 /**
- * Header with the grid pattern background used by the Buildroot LTS
- *   graphical chart
+ * Header, based on the website #headerwrap
  */
 .br-lts-header {
-    margin-top: 50px;
-    position: relative;
-    width: 100%;
-    min-height: 400px;
-    background-color: #ffffff;
-    overflow: hidden;
-    border-bottom: 4px solid var(--br-blue);
-    display: flex;
-    justify-content: center;
-    padding: 40px 20px;
-}
-
-.br-lts-header-bg {
-    position: absolute;
-    top: 0;
-    left: 0;
-    width: 100%;
-    height: 100%;
-    background-image:
-        linear-gradient(var(--br-grid) 2px, transparent 2px),
-        linear-gradient(90deg, var(--br-grid) 2px, transparent 2px);
-    background-size: 120px 120px;
-    z-index: 1;
-    pointer-events: none;
-}
-
-.br-lts-header-content {
-    position: relative;
-    z-index: 10;
-    max-width: 1200px;
     display: flex;
-    flex-direction: column;
+    align-items: center;
+    padding-top: 80px;
+    padding-bottom: 40px;
 }
 
-.br-lts-header-title {
-    color: var(--br-blue);
-    font-family: var(--font-pixel);
-    font-size: 8rem;
-    display: inline-block;
-    background: white;
-    padding: 10px;
-    margin: 10px;
-    border: 2px solid var(--br-blue);
-    box-shadow: 6px 6px 0 var(--br-blue);
-
-    transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
+#headerwrap.br-lts-header h1 {
+    font-size: 90px;
     opacity: 0;
     animation: slideDownFade 0.8s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;
 }
 
-.br-lts-header-title:nth-of-type(2) {
-    font-size: 6rem;
-    line-height: 6rem;
-    animation-delay: 0.2s;
-}
-
-.br-lts-header-title:hover {
-    background-color: var(--br-blue);
-    color: #ffffff;
-    box-shadow: 8px 8px 0 var(--br-grid);
-    transform: translateY(-2px) translateX(-2px);
+.br-lts-header h1 small {
+    display: block;
+    margin-top: 20px;
+    font-size: 39px;
 }
 
-/**
- * <main> wrapper.
- */
-.br-lts-main {
-    max-width: 1200px;
-    margin: 40px auto;
-    padding: 0 20px;
-}
+@media screen and (max-width: 768px) {
+    #headerwrap.br-lts-header h1 {
+        font-size: 56px;
+    }
 
-/**
- * Custom dotted separator using the BR-LTS theme.
- */
-.br-lts-separator {
-    width: 100%;
-    max-width: 900px;
-    height: 10px;
-    border-bottom: 2px dotted var(--br-blue);
-    margin: 10px 0;
+    .br-lts-header h1 small {
+        font-size: 26px;
+    }
 }
 
 /**
- * Intersection subtitle <div> with grid background
+ * Content wrapper.
  */
-.br-lts-section-header {
-    position: relative;
-    width: 40%;
-    height: calc(var(--br-grid-size) * 3);
-    background-color: #fff;
-    display: flex;
-    align-items: center;
-    padding-left: var(--br-grid-size);
-    margin: var(--br-grid-size) 0;
-    border: 2px solid var(--br-grid);
-
-    text-decoration: none;
-    scroll-margin-top: 20px; /* Offset for jump to anchor */
-}
-
-@media screen and (max-width: 768px) {
-  .br-lts-section-header {
-    width: 100%;
-  }
-}
-
-.br-lts-section-header:hover {
-    border: 2px solid var(--br-blue);
-    box-shadow: 6px 6px 0 var(--br-blue);
-    transition: border-color 0.3s ease, box-shadow 0.3s ease;
-}
-
-.br-lts-section-header .br-lts-bg-grid {
-    position: absolute;
-    top: 0;
-    left: 0;
-    width: 100%;
-    height: 100%;
-    background-image:
-        linear-gradient(var(--br-grid) 2px, transparent 2px),
-        linear-gradient(90deg, var(--br-grid) 2px, transparent 2px);
-    background-size: var(--br-grid-size) var(--br-grid-size);
-    background-position: -1px -1px;
-    z-index: 1;
-    pointer-events: none;
-}
-
-.br-lts-section-header .br-lts-title-box {
-    position: relative;
-    z-index: 10;
-    background-color: #fff;
-    border: 2px solid var(--br-blue);
-    color: var(--br-blue);
-    font-family: var(--font-pixel);
-    font-weight: 400;
-    font-style: normal;
-    font-size: 24px;
-    line-height: 1;
-    padding: 10px 15px;
+.br-lts-main {
+    margin-top: 40px;
+    margin-bottom: 40px;
 }
 
-.br-lts-section-header .br-lts-decoration-dot {
-    position: absolute;
-    z-index: 10;
-    width: 10px;
-    height: 10px;
-    background-color: var(--br-yellow);
-    border-radius: 50%;
-    bottom: 0;
-    left: 0;
-    transform: translate(-50%, 50%);
+.br-lts-main .panel {
+    scroll-margin-top: 80px; /* Offset for jump to anchor */
 }
 
 /**
  * Numbered titled list.
- * The number is spanning on the left.
+ * The number is a round badge on the left.
  * The content is on this right.
  */
 .br-lts-item-row {
     display: flex;
-    gap: 25px;
-    max-width: 900px;
-    position: relative;
+    gap: 20px;
+    padding: 15px 0;
+}
+
+.br-lts-item-row + .br-lts-item-row {
+    border-top: 1px solid #eee;
 }
 
 .br-lts-item-number {
-    font-family: var(--font-pixel);
-    color: var(--br-yellow);
-    font-size: 160px;
-    line-height: 0.8;
     flex-shrink: 0;
-    user-select: none;
-    margin-top: 20px;
+    width: 48px;
+    height: 48px;
+    border-radius: 50%;
+    background-color: var(--br-blue);
+    color: #fff;
+    font-size: 24px;
+    font-weight: 400;
+    line-height: 48px;
     text-align: center;
-    width: 60px;
-}
-
-.br-lts-item-content {
-    display: flex;
-    flex-direction: column;
-    gap: 15px;
-    padding-top: 5px;
+    user-select: none;
 }
 
 .br-lts-item-title {
-    font-family: var(--font-serif);
-    font-style: italic;
-    font-weight: 300;
-    font-size: 42px;
-    line-height: 1.1;
-    color: var(--br-blue);
-    letter-spacing: 1px;
-}
-
-.br-lts-item-text {
-    font-family: var(--font-mono);
-    font-size: 16px;
-    line-height: 1.4;
-    color: #333;
-    max-width: 750px;
+    margin-top: 8px;
 }
 
 /**
  * 'timeline' grid to represent how tasks are expanding across time.
  */
 .br-lts-chart {
+    --br-lts-label-width: 120px;
     display: grid;
-    grid-template-columns: 120px repeat(12, 1fr);
+    grid-template-columns: var(--br-lts-label-width) repeat(12, minmax(45px, 1fr));
     gap: 0;
     width: 100%;
-    max-width: 1000px;
     background-color: #fff;
-    border: 2px solid var(--br-blue);
-    box-shadow: 6px 6px 0 var(--br-blue);
+    border: 1px solid #ddd;
+    border-radius: 2px;
+    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3);
+    margin: 20px 0;
     position: relative;
     overflow-x: auto;
 }
 
+.br-lts-chart:last-child {
+    margin-bottom: 0;
+}
+
 .br-lts-chart::before {
     content: "";
     position: absolute;
     top: 45px;
-    left: 120px;
+    left: var(--br-lts-label-width);
     right: 0;
     bottom: 0;
     background-size: calc(100% / 12) 100%;
@@ -278,7 +134,7 @@
 .br-lts-chart-head {
     grid-column: 1 / -1;
     display: grid;
-    grid-template-columns: 120px repeat(12, 1fr);
+    grid-template-columns: var(--br-lts-label-width) repeat(12, minmax(45px, 1fr));
     border-bottom: 2px solid var(--br-blue);
     background-color: color-mix(in srgb, var(--br-blue) 6%, white);
     font-weight: bold;
@@ -289,9 +145,9 @@
 .br-lts-chart-head-label {
     text-align: center;
     padding: 10px;
-    border-left: 2px solid var(--br-grid);
-    font-family: var(--font-pixel);
-    font-size: 20px;
+    border-left: 1px solid var(--br-grid);
+    font-size: 18px;
+    font-weight: 400;
     color: var(--br-blue);
 }
 
@@ -302,7 +158,7 @@
 .br-lts-chart-row {
     grid-column: 1 / -1;
     display: grid;
-    grid-template-columns: 120px repeat(12, 1fr);
+    grid-template-columns: var(--br-lts-label-width) repeat(12, minmax(45px, 1fr));
     align-items: center;
     height: 50px;
     border-bottom: 1px dashed #ddd;
@@ -313,8 +169,18 @@
 
 .br-lts-chart-row:last-child { border-bottom: none; }
 
+.br-lts-chart--wide-labels {
+    --br-lts-label-width: 240px;
+}
+
+@media screen and (max-width: 768px) {
+    .br-lts-chart--wide-labels {
+        --br-lts-label-width: 140px;
+    }
+}
+
 .br-lts-chart-row--tall {
-    height: 100px;
+    height: 64px;
 }
 
 .br-lts-chart-row--faded {
@@ -337,6 +203,7 @@
     align-items: center;
     background-color: #fff;
     font-size: 14px;
+    line-height: 1.3;
     transition: color 0.2s ease, background-color 0.2s ease;
 }
 
@@ -347,6 +214,7 @@
 
 .br-lts-bar {
     height: 24px;
+    margin: 0 4px;
     border-radius: 4px;
     display: flex;
     align-items: center;
diff --git a/docs/website/lts.html b/docs/website/lts.html
index caa9344f4a..2ecafceef0 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -2,48 +2,45 @@
 
 <link href="css/lts.css" rel="stylesheet">
 
-<header class="br-lts-header">
-    <div class="br-lts-header-bg"></div>
-
-    <div class="br-lts-header-content">
-        <div class="br-lts-header-title">
-            Buildroot LTS
-        </div>
-        <div class="br-lts-header-title">
-            3-year long-term support with security fixes
-        </div>
+<div id="headerwrap" class="br-lts-header">
+  <div class="container">
+    <div class="row">
+      <div class="col-sm-12 centered">
+	<h1>Buildroot LTS<br>
+	  <small>3-year long-term support with security fixes</small></h1>
+      </div>
     </div>
-</header>
+  </div>
+</div>
 
-<main class="br-lts-main">
-    <div id="objectives" class="br-lts-section-header">
-        <div class="br-lts-bg-grid"></div>
-        <div class="br-lts-title-box">LTS Objectives</div>
-        <div class="br-lts-decoration-dot"></div>
-    </div>
+<div class="container br-lts-main">
+<div class="row">
+<div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
+
+    <div id="objectives" class="panel panel-primary">
+    <div class="panel-heading">LTS Objectives</div>
+    <div class="panel-body">
 
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">1</div>
         <div class="br-lts-item-content">
-            <h2 class="br-lts-item-title">
+            <h3 class="br-lts-item-title">
                 3-year LTS support
-            </h2>
-            <p class="br-lts-item-text">
+            </h3>
+            <p>
             Starting with version <code>2025.02</code>, the LTS support has been extended to
             <strong>3 years</strong>, replacing the previous 1-year cycle.
             </p>
         </div>
     </div>
 
-    <div class="br-lts-separator"></div>
-
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">2</div>
         <div class="br-lts-item-content">
-            <h2 class="br-lts-item-title">
+            <h3 class="br-lts-item-title">
                 Vulnerability tracking & reporting
-            </h2>
-            <p class="br-lts-item-text">
+            </h3>
+            <p>
             Tracking of the vulnerabilities affecting Buildroot
             is available at
             <a href="https://security.buildroot.org/">security.buildroot.org</a>.
@@ -54,15 +51,13 @@
         </div>
     </div>
 
-    <div class="br-lts-separator"></div>
-
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">3</div>
         <div class="br-lts-item-content">
-            <h2 class="br-lts-item-title">
+            <h3 class="br-lts-item-title">
                 Sponsored LTS stewards
-            </h2>
-            <p class="br-lts-item-text">
+            </h3>
+            <p>
             To ensure a consistent release cadence and maintenance
             workflow, paid LTS stewards are assigned to the weekly LTS
             maintenance tasks.
@@ -70,15 +65,13 @@
         </div>
     </div>
 
-    <div class="br-lts-separator"></div>
-
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">4</div>
         <div class="br-lts-item-content">
-            <h2 class="br-lts-item-title">
+            <h3 class="br-lts-item-title">
                 Dedicated backports
-            </h2>
-            <p class="br-lts-item-text">
+            </h3>
+            <p>
             Vulnerability fixes applied to the <code>master</code> branch will be
             prioritized for backporting to stable branches.
             </p>
@@ -86,24 +79,22 @@
     </div>
 
 
-    <div id="releases" class="br-lts-section-header">
-        <div class="br-lts-bg-grid"></div>
-        <div class="br-lts-title-box">Releases</div>
-        <div class="br-lts-decoration-dot"></div>
     </div>
+    </div>
+
+    <div id="releases" class="panel panel-primary">
+    <div class="panel-heading">Releases</div>
+    <div class="panel-body">
 
     <p>
     The Buildroot LTS sponsorship initiative has evolved from a more
     comprehensive understanding of the needs of our user base.
-    <br/>
     To address these requirements, the release model evolves into the following.
-    <br/>
     Starting with 2025.02, the first release of every odd-numbered year is a long-term
     support (LTS) release supported for three years.
     In between, non-LTS releases are made every 3 months.
     </p>
 
-    <br/>
 
     <div class="br-lts-chart">
         <div class="br-lts-chart-head">
@@ -163,14 +154,13 @@
         </div>
     </div>
 
-    <br/>
-    <br/>
 
-    <div id="organization" class="br-lts-section-header">
-        <div class="br-lts-bg-grid"></div>
-        <div class="br-lts-title-box">How we work</div>
-        <div class="br-lts-decoration-dot"></div>
     </div>
+    </div>
+
+    <div id="organization" class="panel panel-primary">
+    <div class="panel-heading">How we work</div>
+    <div class="panel-body">
 
     <p>
     Each week, the LTS stewards define the set of commits to
@@ -200,9 +190,8 @@
     For more information about the development workflow, see the
     <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/README.md">documentation</a>.
     </p>
-    <br/>
 
-    <div class="br-lts-chart">
+    <div class="br-lts-chart br-lts-chart--wide-labels">
         <div class="br-lts-chart-head">
             <div class="br-lts-head-spacer"></div>
             <div class="br-lts-chart-head-label br-lts-span-day">Monday</div>
@@ -244,19 +233,20 @@
         </div>
     </div>
 
-    <div id="benefits" class="br-lts-section-header">
-        <div class="br-lts-bg-grid"></div>
-        <div class="br-lts-title-box">Sponsorship benefits</div>
-        <div class="br-lts-decoration-dot"></div>
     </div>
+    </div>
+
+    <div id="benefits" class="panel panel-primary">
+    <div class="panel-heading">Sponsorship benefits</div>
+    <div class="panel-body">
 
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">1</div>
         <div class="br-lts-item-content">
-            <h2 class="br-lts-item-title">
+            <h3 class="br-lts-item-title">
                 Long-term sustainability
-            </h2>
-            <p class="br-lts-item-text">
+            </h3>
+            <p>
                 Sponsors ensure the long-term sustainability of the Buildroot
                 LTS effort with dedicated stewards assigned to tasks such as
                 backporting, security monitoring and LTS releases.
@@ -264,15 +254,13 @@
         </div>
     </div>
 
-    <div class="br-lts-separator"></div>
-
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">2</div>
         <div class="br-lts-item-content">
-            <h2 class="br-lts-item-title">
+            <h3 class="br-lts-item-title">
                 Recognition of your sponsorship
-            </h2>
-            <p class="br-lts-item-text">
+            </h3>
+            <p>
                 Sponsors can be publicly acknowledged on the Buildroot website.
                 Sponsors may provide a logo linking to a webpage of their
                 choice.
@@ -280,30 +268,26 @@
         </div>
     </div>
 
-    <div class="br-lts-separator"></div>
-
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">3</div>
         <div class="br-lts-item-content">
-            <h2 class="br-lts-item-title">
+            <h3 class="br-lts-item-title">
                 Direct interaction with LTS stewards
-            </h2>
-            <p class="br-lts-item-text">
+            </h3>
+            <p>
                 Sponsors may submit queries and requests regarding
                 Buildroot LTS and security updates.
             </p>
         </div>
     </div>
 
-    <div class="br-lts-separator"></div>
-
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">4</div>
         <div class="br-lts-item-content">
-            <h2 class="br-lts-item-title">
+            <h3 class="br-lts-item-title">
                 Assignment of priorities for package tracking
-            </h2>
-            <p class="br-lts-item-text">
+            </h3>
+            <p>
                 Buildroot integrates more than 2000 open source packages,
                 many of which do not offer long-term stable releases or
                 security updates.
@@ -316,15 +300,13 @@
         </div>
     </div>
 
-    <div class="br-lts-separator"></div>
-
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">5</div>
         <div class="br-lts-item-content">
-            <h2 class="br-lts-item-title">
+            <h3 class="br-lts-item-title">
                 Testing of your packages
-            </h2>
-            <p class="br-lts-item-text">
+            </h3>
+            <p>
                 To make sure the packages of interest to the sponsors don't
                 include regressions between releases.
                 Sponsors may submit a list of packages to be tested
@@ -333,15 +315,13 @@
         </div>
     </div>
 
-    <div class="br-lts-separator"></div>
-
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">6</div>
         <div class="br-lts-item-content">
-            <h2 class="br-lts-item-title">
+            <h3 class="br-lts-item-title">
                 Personalized security reports
-            </h2>
-            <p class="br-lts-item-text">
+            </h3>
+            <p>
                 Sponsors receive personalized security reports for their
                 Buildroot packages in the form of
                 <a href="https://security.buildroot.org/">security.buildroot.org</a>
@@ -350,17 +330,25 @@
         </div>
     </div>
 
-    <a href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?" id="sponsor" class="br-lts-section-header">
-        <div class="br-lts-bg-grid"></div>
-        <div class="br-lts-title-box">Sponsor now !</div>
-        <div class="br-lts-decoration-dot"></div>
-    </a>
+    </div>
+    </div>
+
+    <div id="sponsor" class="panel panel-primary">
+    <div class="panel-heading">Sponsor now!</div>
+    <div class="panel-body">
     <p>
     Interested ? Contact us at
     <a href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">buildroot-lts@buildroot.org</a>
     to learn more about the different sponsorship tiers and get all the
     details about the sponsorship.
     </p>
-</main>
+    <a class="btn btn-success btn-lg" href="mailto:buildroot-lts@buildroot.org?subject=[buildroot-lts] Sponsorship information&body=Thanks for showing interest in the Buildroot LTS Sponsorship. We would appreciate if you could introduce yourself and your company by answering the following questions: in which products do you use Buildroot ? How are you using Buildroot ? How many different configurations do you have ? How long do you support your products ?">
+      <span class="glyphicon glyphicon-envelope"></span>&nbsp; Contact us</a>
+    </div>
+    </div>
+
+</div>
+</div>
+</div>
 
 <!--#include file="footer.html" -->
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
