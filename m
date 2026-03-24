Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C02109C057
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 19:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AAF640A94;
	Wed, 25 Mar 2026 19:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQQ22kuxk-bF; Wed, 25 Mar 2026 19:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92B1840AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774467624;
	bh=MQ4lhGnry4MOfPmTtwC4hXprgCloTDN3n9PAt/1IOdE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jIvQhX5XjA0X1sAuPXfE0s198m46MDtzfheeKx5d31NteNRB4KFC3L0tHFZF2V3+G
	 rZDb3Ts/Q5NY+/F3f1GelydVpSsB8wvtnbBs8GX7luNYihu591THjFEwxyxkkqD/5T
	 3YXxXdH+BXJII+VPfg8hR0JMcXnu3erINW0PmHrhzzikrVFCkz4Rm21kUjqbod0kDn
	 e1gTIqUq/t5XlDFr27we/hi0nziw61tTY3Ce/L59q1NjMnmMALwKZqquKSAb51VchA
	 5/mBTLjRZa2dJylunnD9QMG1dofgVNIzj/cK+84R/X0NjC9CSA2NYbuIfWxYMdkuLf
	 euE3g6wHuviIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92B1840AA1;
	Wed, 25 Mar 2026 19:40:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B72A1D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6570560B35
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3b6eoOTlxkkr for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 19:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E978960D57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E978960D57
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:40:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35FB484294; Tue, 24 Mar 2026 21:22:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Mar 2026 22:14:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d18f7e09162ac3dbe4538fd0e2a3e5ec192e88a4
X-Git-Newrev: b4889d8b1cfcf4ec79487787c61e8033fb74df2c
X-Patchwork-Hint: ignore
Message-Id: <20260324212247.35FB484294@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/lts: remove the href on section
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b4889d8b1cfcf4ec79487787c61e8033fb74df2c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

We have received report from people about the section pointer that makes
them want to click on the "Sponsor Now !" section.

The original idea was to be able to link sub-section but let's make this
section is not clickable instead.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/css/lts.css |  1 -
 docs/website/lts.html    | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/docs/website/css/lts.css b/docs/website/css/lts.css
index 76411413ce..5f05288188 100644
--- a/docs/website/css/lts.css
+++ b/docs/website/css/lts.css
@@ -142,7 +142,6 @@
     border: 2px solid var(--br-grid);
 
     text-decoration: none;
-    cursor: pointer;
     scroll-margin-top: 20px; /* Offset for jump to anchor */
 }
 
diff --git a/docs/website/lts.html b/docs/website/lts.html
index 7538fa72de..988415482c 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -16,11 +16,11 @@
 </header>
 
 <main class="br-lts-main">
-    <a href="#objectives" id="objectives" class="br-lts-section-header">
+    <div id="objectives" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">LTS Objectives</div>
         <div class="br-lts-decoration-dot"></div>
-    </a>
+    </div>
 
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">1</div>
@@ -86,11 +86,11 @@
     </div>
 
 
-    <a href="#releases" id="releases" class="br-lts-section-header">
+    <div id="releases" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">Releases</div>
         <div class="br-lts-decoration-dot"></div>
-    </a>
+    </div>
 
     <p>
     The Buildroot LTS sponsorship initiative has evolved from a more
@@ -170,11 +170,11 @@
     More details about the LTS workflow at <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools">buildroot.org/buildroot-lts-tools</a>.
     </p>
 
-    <a href="#organization" id="organization" class="br-lts-section-header">
+    <div id="organization" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">How we work</div>
         <div class="br-lts-decoration-dot"></div>
-    </a>
+    </div>
 
     <p>
     Each week the LTS stewards defines the set of commits to
@@ -232,11 +232,11 @@
         </div>
     </div>
 
-    <a href="#benefits" id="benefits" class="br-lts-section-header">
+    <div id="benefits" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">Sponsorship benefits</div>
         <div class="br-lts-decoration-dot"></div>
-    </a>
+    </div>
 
     <div class="br-lts-item-row">
         <div class="br-lts-item-number">1</div>
@@ -338,11 +338,11 @@
         </div>
     </div>
 
-    <a href="#sponsor" id="sponsor" class="br-lts-section-header">
+    <div id="sponsor" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">Sponsor now !</div>
         <div class="br-lts-decoration-dot"></div>
-    </a>
+    </div>
     <p>
     Interested ? Contact us at
     <a href="mailto:buildroot-lts@buildroot.org">buildroot-lts@buildroot.org</a>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
