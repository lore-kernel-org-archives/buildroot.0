Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CFDC61CE0
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 19:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE60E80D77;
	Sun, 23 Aug 2026 19:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yhj8cucqyX4f; Sun, 23 Aug 2026 19:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787514526;
	bh=JzpXvsG8fnUoJ6B9CD9gM8hL3VywilQbedRMT0qTOzg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JFs97/JytDm09pX2YmtprTOdK3zjzmOC1l2zwkULvpVbwCzCLuYfd3KqZQYjlziFo
	 GD6F51F4h5T0gNgLmDZHxoFPHL94UzZFjTOh3LNiKmzdrOn9hNl4wDweD6l6PcCtgB
	 jAqWoswa/QKnyS6byioaviS8mhMaY5vN3XEYQXFrPZhHUS7W/rKEkWi59qlAlfFncV
	 xjYkGKGymn3JPBigV/tn85t5Qxy9VGsVyVBPluiU45mMFDazh3LMFEnjYxXXcUVbRL
	 9t/ERRLjXz8l7QqOP92RPvDCPDX/N/PBF9S8O3taTV7ihOA4jdc7iS5eGSqZbivIEK
	 MBotwHJg3A42g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C72080D9D;
	Sun, 23 Aug 2026 19:48:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB8402FD
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D02EC80B6A
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pL_FT4HrWMnh for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 19:48:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D081780B56
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:48:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24C1E8EE91; Sun, 23 Aug 2026 19:47:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 21:44:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f292bb7a1dc383c4b552a155c07040ef3e4ea9e
X-Git-Newrev: 3e0d162011e4fc31da30a7e899acd22d59a89ab4
X-Patchwork-Hint: ignore
Message-Id: <20260823194744.24C1E8EE91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: link LTS tooling
 documentation and staging branch
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e0d162011e4fc31da30a7e899acd22d59a89ab4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Users asked where the notes are available and if the information are
publicly available.

Those changes clearly explain the location and convention of the staging
branches and also link to more documentation on how to read the
annotations.

Also update the timing of the different steps to be less specific.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/lts.html | 40 ++++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/docs/website/lts.html b/docs/website/lts.html
index 3bfd2a4374..8384d3a88b 100644
--- a/docs/website/lts.html
+++ b/docs/website/lts.html
@@ -46,7 +46,7 @@
             <p class="br-lts-item-text">
             Tracking of the vulnerabilities affecting Buildroot
             is available at
-            <a href="https://security.buildroot.org/2025.02.x/vulnerability">security.buildroot.org</a>.
+            <a href="https://security.buildroot.org/">security.buildroot.org</a>.
             <br/>
             LTS stewards ensure this data remains up-to-date by actively
             maintaining Buildroot packages metadata.
@@ -166,10 +166,6 @@
     <br/>
     <br/>
 
-    <p>
-    More details about the LTS workflow at <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools">buildroot.org/buildroot-lts-tools</a>.
-    </p>
-
     <div id="organization" class="br-lts-section-header">
         <div class="br-lts-bg-grid"></div>
         <div class="br-lts-title-box">How we work</div>
@@ -181,12 +177,28 @@
     analyze based on the previous week's commits to the master branch. The
     commits are then annotated to define a list of candidates for the LTS
     branches.
-    <br><br>
-    On Thursday, the candidates are cherry-picked to a staging branch to be
-    reviewed by the other maintainers. On Thursday evening the branch is
-    synced with upstream and contributors are notified. Feedback from
-    users, sponsors and autobuilders are then collected and vulnerability
-    analyses updated.
+    </p>
+
+    <p>
+    Mid-week, the candidates are cherry-picked to a staging branch hosted on
+    <a href="https://gitlab.com/essensium-mind/buildroot/">gitlab.com/essensium-mind/buildroot</a>.
+    Every maintained branch has a staging branch, with the <code>.x</code>
+    suffix replaced by <code>.pre</code>. The staging branch allows other
+    maintainers to review the changes before they are pushed upstream.
+    </p>
+
+    <p>
+    By the end of the week, the staging branches are pushed upstream and
+    contributors are notified. Feedback from users, sponsors and
+    <a href="https://autobuild.buildroot.org/">autobuilders</a>
+    are then collected and
+    <a href="https://security.buildroot.org/">vulnerability analyses</a>
+    updated.
+    </p>
+
+    <p>
+    For more information about the development workflow, see the
+    <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/README.md">documentation</a>.
     </p>
     <br/>
 
@@ -222,13 +234,13 @@
         </div>
 
         <div class="br-lts-chart-row br-lts-chart-row--tall">
-            <div class="br-lts-chart-label">Sync with upstream branch</div>
-            <div class="br-lts-bar br-lts-col-start-9"></div>
+            <div class="br-lts-chart-label">Push to upstream branch</div>
+            <div class="br-lts-bar br-lts-bar--span-2 br-lts-col-start-9"></div>
         </div>
 
         <div class="br-lts-chart-row br-lts-chart-row--tall">
             <div class="br-lts-chart-label">Update vulns</div>
-            <div class="br-lts-bar br-lts-col-start-10"></div>
+            <div class="br-lts-bar br-lts-bar--span-2 br-lts-col-start-10"></div>
         </div>
     </div>
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
