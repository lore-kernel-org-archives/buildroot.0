Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A33D79765
	for <buildroot@archiver.kernel.org>; Sat, 31 Jan 2026 09:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5160840B24;
	Sat, 31 Jan 2026 09:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLeFsq5e8TWI; Sat, 31 Jan 2026 09:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3132240B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769850361;
	bh=ZgTFu/QURzWrPzuEsYhak74YXnuzeCVJ8ntJ9IkwldA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GSmWv9qOiicA0DeJZr8oa2Qo4nE48rOUp1syKvz2SKnCEJB/msxv2quz4WXOm1Fo+
	 uBsUan5+ohHAlW0ygyPAYEp/iwbB0j8r2VBX7axN5r+TVcV2YhOL5HZul0AsjfrMks
	 xUnsBByqzMU/Pa7Gsl+HlZ2WHXy/tDteNncImG2gMYIQ7rCx4ezZjG24iSBBx/mzZS
	 tVPBarL2lkbk4YT97NvGQLWIP+d9M1H2C7cLLleMkLzg280V1ksBRWApJsMZhZBAXz
	 U84dpSWFfcWZ8OQWQnuvPKJowrg2T8PfceJ4WsdeFPLoav5lgveYGyhvAYznGh3iaj
	 wDzTwLxS9G8SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3132240B11;
	Sat, 31 Jan 2026 09:06:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96A7B1E0
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 09:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90C86406A0
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 09:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eu75ACXzrsML for <buildroot@buildroot.org>;
 Sat, 31 Jan 2026 09:05:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8960140166
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8960140166
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 09:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 712D586091; Sat, 31 Jan 2026 09:05:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 31 Jan 2026 10:05:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fce728765632f5882d334f295586864043121cc9
X-Git-Newrev: 7ce07d07db0b293e447b85c12d23543660fbd21a
X-Patchwork-Hint: ignore
Message-Id: <20260131090557.712D586091@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: add a dedicated LTS page
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ce07d07db0b293e447b85c12d23543660fbd21a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the content referring to the LTS information from the 'support' page
into a dedicated page.

Also add LTS specific information about the sponsoring and the benefits.

This page also contains clarification on the release cycle of the LTS.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/contribute.html               |   2 +-
 docs/website/css/lts.css                   | 405 +++++++++++++++++++++++++++++
 docs/website/fonts/compagnon-light.woff    | Bin 0 -> 44788 bytes
 docs/website/fonts/terminal-grotesque.woff | Bin 0 -> 35360 bytes
 docs/website/header.html                   |   2 +
 docs/website/lts.html                      | 354 +++++++++++++++++++++++++
 docs/website/news.html                     |   2 +-
 docs/website/sponsors.html                 |   2 +-
 docs/website/support.html                  |  23 --
 9 files changed, 764 insertions(+), 26 deletions(-)

diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index 115b1fd8b8..c05bdda62d 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -51,7 +51,7 @@
 	  to organise those.</li>
 	<li>Practical help: providing a meeting room for developer meetings,
 	  providing autobuilder instances, etc.</li>
-	<li><a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsoring</a>,
+	<li><a href="/lts.html">Buildroot LTS Sponsoring</a>,
 	  a specific effort to finance the maintenance of the Long Term Support
 	  branch of Buildroot.</li>
       </ul>
diff --git a/docs/website/css/lts.css b/docs/website/css/lts.css
new file mode 100644
index 0000000000..76411413ce
--- /dev/null
+++ b/docs/website/css/lts.css
@@ -0,0 +1,405 @@
+@font-face {
+  font-family: "Compagnon Light";
+  src: url("/fonts/compagnon-light.woff") format("woff");
+  font-weight: 300;
+  font-style: normal;
+  font-display: swap;
+}
+
+@font-face {
+  font-family: "Terminal Grotesque";
+  src: url("/fonts/terminal-grotesque.woff") format("woff");
+  font-weight: normal;
+  font-style: normal;
+  font-display: swap;
+}
+
+:root {
+    --br-blue: #2b7de0;
+    --br-grid: #dceeff;
+    --br-yellow: #dcb045;
+    --font-pixel: "Terminal Grotesque", sans-serif;
+    --font-serif: "Compagnon Light", serif;
+    --br-grid-size: 40px;
+}
+
+@keyframes slideDownFade {
+    0% {
+        opacity: 0;
+        transform: translateY(-30px);
+    }
+    100% {
+        opacity: 1;
+        transform: translateY(0);
+    }
+}
+
+@keyframes growBar {
+    from { transform: scaleX(0); opacity: 0.5; }
+    to { transform: scaleX(1); opacity: 1; }
+}
+
+/**
+ * Header with the grid pattern background used by the Buildroot LTS
+ *   graphical chart
+ */
+.br-lts-header {
+    margin-top: 50px;
+    position: relative;
+    width: 100%;
+    min-height: 400px;
+    background-color: #ffffff;
+    overflow: hidden;
+    border-bottom: 4px solid var(--br-blue);
+    display: flex;
+    justify-content: center;
+    padding: 40px 20px;
+}
+
+.br-lts-header-bg {
+    position: absolute;
+    top: 0;
+    left: 0;
+    width: 100%;
+    height: 100%;
+    background-image:
+        linear-gradient(var(--br-grid) 2px, transparent 2px),
+        linear-gradient(90deg, var(--br-grid) 2px, transparent 2px);
+    background-size: 120px 120px;
+    z-index: 1;
+    pointer-events: none;
+}
+
+.br-lts-header-content {
+    position: relative;
+    z-index: 10;
+    max-width: 1200px;
+    display: flex;
+    flex-direction: column;
+}
+
+.br-lts-header-title {
+    color: var(--br-blue);
+    font-family: var(--font-pixel);
+    font-size: 8rem;
+    display: inline-block;
+    background: white;
+    padding: 10px;
+    margin: 10px;
+    border: 2px solid var(--br-blue);
+    box-shadow: 6px 6px 0 var(--br-blue);
+
+    transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
+    opacity: 0;
+    animation: slideDownFade 0.8s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;
+}
+
+.br-lts-header-title:nth-of-type(2) {
+    font-size: 6rem;
+    line-height: 6rem;
+    animation-delay: 0.2s;
+}
+
+.br-lts-header-title:hover {
+    background-color: var(--br-blue);
+    color: #ffffff;
+    box-shadow: 8px 8px 0 var(--br-grid);
+    transform: translateY(-2px) translateX(-2px);
+}
+
+/**
+ * <main> wrapper.
+ */
+.br-lts-main {
+    max-width: 1200px;
+    margin: 40px auto;
+    padding: 0 20px;
+}
+
+/**
+ * Custom dotted separator using the BR-LTS theme.
+ */
+.br-lts-separator {
+    width: 100%;
+    max-width: 900px;
+    height: 10px;
+    border-bottom: 2px dotted var(--br-blue);
+    margin: 10px 0;
+}
+
+/**
+ * Intersection subtitle <div> with grid background
+ */
+.br-lts-section-header {
+    position: relative;
+    width: 40%;
+    height: calc(var(--br-grid-size) * 3);
+    background-color: #fff;
+    display: flex;
+    align-items: center;
+    padding-left: var(--br-grid-size);
+    margin: var(--br-grid-size) 0;
+    border: 2px solid var(--br-grid);
+
+    text-decoration: none;
+    cursor: pointer;
+    scroll-margin-top: 20px; /* Offset for jump to anchor */
+}
+
+.br-lts-section-header:hover {
+    border: 2px solid var(--br-blue);
+    box-shadow: 6px 6px 0 var(--br-blue);
+    transition: border-color 0.3s ease, box-shadow 0.3s ease;
+}
+
+.br-lts-section-header .br-lts-bg-grid {
+    position: absolute;
+    top: 0;
+    left: 0;
+    width: 100%;
+    height: 100%;
+    background-image:
+        linear-gradient(var(--br-grid) 2px, transparent 2px),
+        linear-gradient(90deg, var(--br-grid) 2px, transparent 2px);
+    background-size: var(--br-grid-size) var(--br-grid-size);
+    background-position: -1px -1px;
+    z-index: 1;
+    pointer-events: none;
+}
+
+.br-lts-section-header .br-lts-title-box {
+    position: relative;
+    z-index: 10;
+    background-color: #fff;
+    border: 2px solid var(--br-blue);
+    color: var(--br-blue);
+    font-family: var(--font-pixel);
+    font-weight: 400;
+    font-style: normal;
+    font-size: 24px;
+    line-height: 1;
+    padding: 10px 15px;
+}
+
+.br-lts-section-header .br-lts-decoration-dot {
+    position: absolute;
+    z-index: 10;
+    width: 10px;
+    height: 10px;
+    background-color: var(--br-yellow);
+    border-radius: 50%;
+    bottom: 0;
+    left: 0;
+    transform: translate(-50%, 50%);
+}
+
+/**
+ * Numbered titled list.
+ * The number is spanning on the left.
+ * The content is on this right.
+ */
+.br-lts-item-row {
+    display: flex;
+    gap: 25px;
+    max-width: 900px;
+    position: relative;
+}
+
+.br-lts-item-number {
+    font-family: var(--font-pixel);
+    color: var(--br-yellow);
+    font-size: 160px;
+    line-height: 0.8;
+    flex-shrink: 0;
+    user-select: none;
+    margin-top: 20px;
+    text-align: center;
+    width: 60px;
+}
+
+.br-lts-item-content {
+    display: flex;
+    flex-direction: column;
+    gap: 15px;
+    padding-top: 5px;
+}
+
+.br-lts-item-title {
+    font-family: var(--font-serif);
+    font-style: italic;
+    font-weight: 300;
+    font-size: 42px;
+    line-height: 1.1;
+    color: var(--br-blue);
+    letter-spacing: 1px;
+}
+
+.br-lts-item-text {
+    font-family: var(--font-mono);
+    font-size: 16px;
+    line-height: 1.4;
+    color: #333;
+    max-width: 750px;
+}
+
+/**
+ * 'timeline' grid to represent how tasks are expanding across time.
+ */
+.br-lts-chart {
+    display: grid;
+    grid-template-columns: 120px repeat(12, 1fr);
+    gap: 0;
+    width: 100%;
+    max-width: 1000px;
+    background-color: #fff;
+    border: 2px solid var(--br-blue);
+    box-shadow: 6px 6px 0 var(--br-blue);
+    position: relative;
+    overflow-x: auto;
+}
+
+.br-lts-chart::before {
+    content: "";
+    position: absolute;
+    top: 45px;
+    left: 120px;
+    right: 0;
+    bottom: 0;
+    background-size: calc(100% / 12) 100%;
+    z-index: 0;
+    pointer-events: none;
+}
+
+.br-lts-chart-head {
+    grid-column: 1 / -1;
+    display: grid;
+    grid-template-columns: 120px repeat(12, 1fr);
+    border-bottom: 2px solid var(--br-blue);
+    background-color: color-mix(in srgb, var(--br-blue) 6%, white);
+    font-weight: bold;
+    position: relative;
+    z-index: 2;
+}
+
+.br-lts-chart-head-label {
+    text-align: center;
+    padding: 10px;
+    border-left: 2px solid var(--br-grid);
+    font-family: var(--font-pixel);
+    font-size: 20px;
+    color: var(--br-blue);
+}
+
+.br-lts-span-year { grid-column: span 4; }
+.br-lts-span-day { grid-column: span 2; }
+.br-lts-head-spacer { grid-column: span 1; border-right: 2px solid var(--br-blue); }
+
+.br-lts-chart-row {
+    grid-column: 1 / -1;
+    display: grid;
+    grid-template-columns: 120px repeat(12, 1fr);
+    align-items: center;
+    height: 50px;
+    border-bottom: 1px dashed #ddd;
+    position: relative;
+    z-index: 1;
+    transition: background-color 0.2s ease;
+}
+
+.br-lts-chart-row:last-child { border-bottom: none; }
+
+.br-lts-chart-row--tall {
+    height: 100px;
+}
+
+.br-lts-chart-row--faded {
+    color: #999;
+    font-style: italic;
+}
+
+.br-lts-chart-row:hover {
+    background-color: color-mix(in srgb, var(--br-blue) 8%, transparent);
+    z-index: 2;
+}
+
+.br-lts-chart-label {
+    padding: 0 15px;
+    font-weight: bold;
+    color: #555;
+    border-right: 2px solid var(--br-blue);
+    height: 100%;
+    display: flex;
+    align-items: center;
+    background-color: #fff;
+    font-size: 14px;
+    transition: color 0.2s ease, background-color 0.2s ease;
+}
+
+.br-lts-chart-row:hover .br-lts-chart-label {
+    background-color: transparent;
+    color: var(--br-blue);
+}
+
+.br-lts-bar {
+    height: 24px;
+    border-radius: 4px;
+    display: flex;
+    align-items: center;
+    padding-left: 10px;
+    font-size: 12px;
+    color: white;
+    font-weight: bold;
+    box-shadow: 2px 2px 0 rgba(0,0,0,0.1);
+    white-space: nowrap;
+    overflow: hidden;
+    position: relative;
+    background-color: var(--br-blue);
+    grid-column-end: span 1;
+    cursor: default;
+
+    transform-origin: left center;
+    animation: growBar 0.8s cubic-bezier(0.16, 1, 0.3, 1) forwards;
+    opacity: 0;
+
+    transition: transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275),
+                box-shadow 0.2s ease,
+                filter 0.2s ease;
+}
+
+.br-lts-chart-row:nth-child(2) .br-lts-bar { animation-delay: 100ms; }
+.br-lts-chart-row:nth-child(3) .br-lts-bar { animation-delay: 200ms; }
+.br-lts-chart-row:nth-child(4) .br-lts-bar { animation-delay: 300ms; }
+.br-lts-chart-row:nth-child(5) .br-lts-bar { animation-delay: 400ms; }
+.br-lts-chart-row:nth-child(6) .br-lts-bar { animation-delay: 500ms; }
+.br-lts-chart-row:nth-child(7) .br-lts-bar { animation-delay: 600ms; }
+.br-lts-chart-row:nth-child(8) .br-lts-bar { animation-delay: 700ms; }
+.br-lts-chart-row:nth-child(9) .br-lts-bar { animation-delay: 800ms; }
+.br-lts-chart-row:nth-child(10) .br-lts-bar { animation-delay: 900ms; }
+.br-lts-chart-row:nth-child(11) .br-lts-bar { animation-delay: 1000ms; }
+
+.br-lts-bar:hover {
+    transform: scale(1.05) translateY(-2px);
+    box-shadow: 4px 6px 12px rgba(0,0,0,0.2);
+    z-index: 10;
+    filter: brightness(1.1);
+}
+
+.br-lts-bar--long {
+    background-color: var(--br-yellow);
+    color: color-mix(in srgb, var(--br-yellow), black 45%);
+    grid-column-end: span 12;
+    border: 2px solid color-mix(in srgb, var(--br-yellow), white 20%);
+}
+
+.br-lts-bar--span-2 { grid-column-end: span 2; }
+.br-lts-bar--span-6 { grid-column-end: span 6; }
+
+.br-lts-col-start-2 { grid-column-start: 2; }
+.br-lts-col-start-3 { grid-column-start: 3; }
+.br-lts-col-start-4 { grid-column-start: 4; }
+.br-lts-col-start-5 { grid-column-start: 5; }
+.br-lts-col-start-6 { grid-column-start: 6; }
+.br-lts-col-start-7 { grid-column-start: 7; }
+.br-lts-col-start-8 { grid-column-start: 8; }
+.br-lts-col-start-9 { grid-column-start: 9; }
+.br-lts-col-start-10 { grid-column-start: 10; }
diff --git a/docs/website/fonts/compagnon-light.woff b/docs/website/fonts/compagnon-light.woff
new file mode 100644
index 0000000000..b0c6e87649
Binary files /dev/null and b/docs/website/fonts/compagnon-light.woff differ
diff --git a/docs/website/fonts/terminal-grotesque.woff b/docs/website/fonts/terminal-grotesque.woff
new file mode 100644
index 0000000000..d721311c12
Binary files /dev/null and b/docs/website/fonts/terminal-grotesque.woff differ
diff --git a/docs/website/header.html b/docs/website/header.html
index 548ed7ad53..8d610bb442 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -41,6 +41,8 @@
 					<span class="glyphicon glyphicon-question-sign"></span> Support</a></li>
 				<li><a href="/contribute.html">
 					<span class="glyphicon glyphicon-share"></span> Contribute</a></li>
+				<li><a href="/lts.html">
+					<span class="glyphicon glyphicon-send"></span> LTS</a></li>
 				<li><a href="/sponsors.html">
 					<span class="glyphicon glyphicon-usd"></span> Sponsors</a></li>
 				<li><a href="/association.html">
diff --git a/docs/website/lts.html b/docs/website/lts.html
new file mode 100644
index 0000000000..7538fa72de
--- /dev/null
+++ b/docs/website/lts.html
@@ -0,0 +1,354 @@
+<!--#include file="header.html" -->
+
+<link href="css/lts.css" rel="stylesheet">
+
+<header class="br-lts-header">
+    <div class="br-lts-header-bg"></div>
+
+    <div class="br-lts-header-content">
+        <div class="br-lts-header-title">
+            Buildroot LTS
+        </div>
+        <div class="br-lts-header-title">
+            3-year long-term support with security fixes
+        </div>
+    </div>
+</header>
+
+<main class="br-lts-main">
+    <a href="#objectives" id="objectives" class="br-lts-section-header">
+        <div class="br-lts-bg-grid"></div>
+        <div class="br-lts-title-box">LTS Objectives</div>
+        <div class="br-lts-decoration-dot"></div>
+    </a>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">1</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                3-year LTS support
+            </h2>
+            <p class="br-lts-item-text">
+            Starting with version <code>2025.02</code> the LTS support has been extended to
+            <strong>3 years</strong>, replacing the previous 1-year cycle.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">2</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Vulnerability tracking & reporting
+            </h2>
+            <p class="br-lts-item-text">
+            Tracking of the vulnerabilities affecting Buildroot
+            is available at
+            <a href="https://security.buildroot.org/2025.02.x/vulnerability">security.buildroot.org</a>.
+            <br/>
+            LTS stewards ensure this data remains up-to-date by actively
+            maintaining Buildroot packages metadata.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">3</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Sponsored LTS stewards
+            </h2>
+            <p class="br-lts-item-text">
+            To ensure a consistent release cadence and maintenance
+            workflow, paid LTS stewards are assigned to the weekly LTS
+            maintainance tasks.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">4</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Dedicated backports
+            </h2>
+            <p class="br-lts-item-text">
+            Vulnerability fixes applied to the <code>master</code> branch will be
+            prioritized for backporting to the LTS & stable branches.
+            </p>
+        </div>
+    </div>
+
+
+    <a href="#releases" id="releases" class="br-lts-section-header">
+        <div class="br-lts-bg-grid"></div>
+        <div class="br-lts-title-box">Releases</div>
+        <div class="br-lts-decoration-dot"></div>
+    </a>
+
+    <p>
+    The Buildroot LTS sponsorship initiative has evolved from a more
+    comprehensive understanding of the needs of our user base.
+    <br/>
+    To address these requirements the release model evolves into the following.
+    <br/>
+    The LTS releases are now extended for a 3-year period. An LTS release
+    is started every 2 years.
+    In between, stable releases are made every 3 months.
+    </p>
+
+    <br/>
+
+    <div class="br-lts-chart">
+        <div class="br-lts-chart-head">
+            <div class="br-lts-head-spacer"></div>
+            <div class="br-lts-chart-head-label br-lts-span-year">2025</div>
+            <div class="br-lts-chart-head-label br-lts-span-year">2026</div>
+            <div class="br-lts-chart-head-label br-lts-span-year">2027</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2025.02</div>
+            <div class="br-lts-bar br-lts-bar--long br-lts-col-start-2">3 Years Support (LTS)</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2025.05</div>
+            <div class="br-lts-bar br-lts-col-start-3">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2025.08</div>
+            <div class="br-lts-bar br-lts-col-start-4">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2025.11</div>
+            <div class="br-lts-bar br-lts-col-start-5">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2026.02</div>
+            <div class="br-lts-bar br-lts-col-start-6">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2026.05</div>
+            <div class="br-lts-bar br-lts-col-start-7">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2026.08</div>
+            <div class="br-lts-bar br-lts-col-start-8">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2026.11</div>
+            <div class="br-lts-bar br-lts-col-start-9">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2027.02</div>
+            <div class="br-lts-bar br-lts-bar--long br-lts-col-start-10">3 Years Support (LTS)</div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--faded">
+            <div class="br-lts-chart-label">...</div>
+        </div>
+    </div>
+
+    <br/>
+    <br/>
+
+    <p>
+    More details about the LTS workflow at <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools">buildroot.org/buildroot-lts-tools</a>.
+    </p>
+
+    <a href="#organization" id="organization" class="br-lts-section-header">
+        <div class="br-lts-bg-grid"></div>
+        <div class="br-lts-title-box">How we work</div>
+        <div class="br-lts-decoration-dot"></div>
+    </a>
+
+    <p>
+    Each week the LTS stewards defines the set of commits to
+    analyze based on the previous week commits to the master branch. The
+    commits are then annotated to define a list of candidates for the LTS
+    branches.
+    <br><br>
+    On Thursday the candidates are cherry-picked to a staging branch to be
+    reviewed by the other maintainers. On Thursday evening the branch is
+    synced with upstream and contributors are notified. Feedback from
+    users, sponsors and autobuilders are then collected and vulnerability
+    analyses updated.
+    </p>
+    <br/>
+
+    <div class="br-lts-chart">
+        <div class="br-lts-chart-head">
+            <div class="br-lts-head-spacer"></div>
+            <div class="br-lts-chart-head-label br-lts-span-day">Monday</div>
+            <div class="br-lts-chart-head-label br-lts-span-day">Tuesday</div>
+            <div class="br-lts-chart-head-label br-lts-span-day">Wednesday</div>
+            <div class="br-lts-chart-head-label br-lts-span-day">Thursday</div>
+            <div class="br-lts-chart-head-label br-lts-span-day">Friday</div>
+            <div class="br-lts-chart-head-label br-lts-span-day">...</div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--tall">
+            <div class="br-lts-chart-label">Freeze weekly commit set from master</div>
+            <div class="br-lts-bar br-lts-col-start-2"></div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--tall">
+            <div class="br-lts-chart-label">Apply branch specific patches</div>
+            <div class="br-lts-bar br-lts-col-start-2"></div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--tall">
+            <div class="br-lts-chart-label">Analysis & commit annotation</div>
+            <div class="br-lts-bar br-lts-bar--span-6 br-lts-col-start-2"></div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--tall">
+            <div class="br-lts-chart-label">Cherry picking to staging branch</div>
+            <div class="br-lts-bar br-lts-bar--span-2 br-lts-col-start-7"></div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--tall">
+            <div class="br-lts-chart-label">Sync with upstream branch</div>
+            <div class="br-lts-bar br-lts-col-start-9"></div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--tall">
+            <div class="br-lts-chart-label">Update vulns</div>
+            <div class="br-lts-bar br-lts-col-start-10"></div>
+        </div>
+    </div>
+
+    <a href="#benefits" id="benefits" class="br-lts-section-header">
+        <div class="br-lts-bg-grid"></div>
+        <div class="br-lts-title-box">Sponsorship benefits</div>
+        <div class="br-lts-decoration-dot"></div>
+    </a>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">1</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Long-term sustainability
+            </h2>
+            <p class="br-lts-item-text">
+                Sponsors ensure the long-term sustainability of the Buildroot
+                LTS effort with dedicated stewards assigned to tasks such as
+                backporting, security monitoring and LTS releases.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">2</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Recognition of your sponsorship
+            </h2>
+            <p class="br-lts-item-text">
+                Sponsors can be publicly acknowledged on the Buildroot website.
+                Sponsors may provide a logo linking to a webpage of their
+                choice.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">3</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Direct interaction with LTS stewards
+            </h2>
+            <p class="br-lts-item-text">
+                Sponsors may submit queries and requests regarding
+                Buildroot LTS and security updates.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">4</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Assignment of priorities for package tracking
+            </h2>
+            <p class="br-lts-item-text">
+                Buildroot integrates more than 2000 open source packages,
+                many of which do not offer long-term stable releases or
+                security updates.
+                <br/>
+                <br/>
+                Sponsors may submit a priority list indicating: <br/>
+                - Packages of interest<br/>
+                - Architectures of interest<br/>
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">5</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Testing of your packages
+            </h2>
+            <p class="br-lts-item-text">
+                To make sure the packages of interest to the sponsors don't
+                include regressions between releases.
+                Sponsors may submit a list of packages to be tested
+                before an LTS & stable release.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">6</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Personalized security reports
+            </h2>
+            <p class="br-lts-item-text">
+                Sponsors receive personalized security reports for their
+                Buildroot packages in the form of
+                <a href="https://security.buildroot.org/">security.buildroot.org</a>
+                with comparison with the upstream branches.
+            </p>
+        </div>
+    </div>
+
+    <a href="#sponsor" id="sponsor" class="br-lts-section-header">
+        <div class="br-lts-bg-grid"></div>
+        <div class="br-lts-title-box">Sponsor now !</div>
+        <div class="br-lts-decoration-dot"></div>
+    </a>
+    <p>
+    Interested ? Contact us at
+    <a href="mailto:buildroot-lts@buildroot.org">buildroot-lts@buildroot.org</a>
+    to learn more about the different sponsorship tiers and get all the
+    details about the sponsorship.
+    </p>
+</main>
+
+<!--#include file="footer.html" -->
diff --git a/docs/website/news.html b/docs/website/news.html
index 71272ab7b7..38599d66ef 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -1181,7 +1181,7 @@
 	  and join this initiative that's shaping the future of Buildroot.</p>
 	<p>
 	<p>Find more information on the
-	  <a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsoring
+	  <a href="/lts.html">Buildroot LTS Sponsoring
 	  page</a>.</p>
       </div>
     </div>
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index ba11b4b081..eef82d2cfa 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -9,7 +9,7 @@
     <div class="panel-body">
       <p>The maintenance of the Long Term Support branch of Buildroot is
          possible thanks to the sponsors of the
-         <a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsorship
+         <a href="lts.html">Buildroot LTS Sponsorship
          Program</a>.</p>
     </div>
     <div class="panel-body">
diff --git a/docs/website/support.html b/docs/website/support.html
index 81f7e863e0..f4eaa8fdbd 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -94,29 +94,6 @@
     </div>
   </div>
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Buildroot LTS</div>
-    <div class="panel-body">
-      <p>Buildroot's Long Term Support (LTS) branch is maintained thanks to the
-	<a href="https://mind.be/buildroot-lts">LTS Sponsoring program</a>. Its
-	goal is	to provide three or more years of stable support for your
-	Buildroot deployments. The success of this venture depends on the
-	generosity of sponsors like you, willing to make a change and ensuring
-	the longevity of Buildroot's reliability.</p>
-      <p>Prior to this initiative, LTS maintenance was handled by volunteers.
-        As a result, it was limited to just one year. In addition, it diverted
-        maintainer time away from mainline development, slowing  down the overall
-        progress of the project.</p>
-      <p>Thanks to LTS sponsoring, the entire community gets access to a better
-        and longer maintained LTS branch. The sponsors get access to some
-        additional perks, such as selecting which packages to focus on, reports
-        with information that is relevant for you, and direct contact with the
-        LTS maintainers.</p>
-      <p style="text-align: center;"><a href="https://mind.be/buildroot-lts">Ready
-        to sponsor?</a></p>
-    </div>
-  </div>
-
   <div class="panel panel-primary">
     <div class="panel-heading">Commercial support</div>
     <div class="panel-body">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
