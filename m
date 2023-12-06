Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AE0C4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 13:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D1E98125B;
	Wed,  6 Dec 2023 13:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D1E98125B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDcFqkwNV9iR; Wed,  6 Dec 2023 13:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A814813C1;
	Wed,  6 Dec 2023 13:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A814813C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3071BF34C
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 13:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB09360B1C
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 13:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB09360B1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xWTAXxe9QG5 for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 13:00:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69D1761495
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 13:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D1761495
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3191887A1C; Wed,  6 Dec 2023 13:00:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Dec 2023 13:59:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cf0f2a7eb249f498c325fb0ae137a8d4c3ef8d8
X-Git-Newrev: 5ec5cb8ab75db095576ec8a065a3c9e32267cd58
X-Patchwork-Hint: ignore
Message-Id: <20231206130009.3191887A1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: add Talos security
 vulnerabilities info
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ec5cb8ab75db095576ec8a065a3c9e32267cd58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 58299062d5..366be02c58 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-exclamation-sign"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">Talos security vulnerabilities</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>6 December 2023</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>Talos has recently published
+	<a href="https://talosintelligence.com/vulnerability_reports/TALOS-2023-1844">TALOS-2023-1844</a>
+	and
+	<a href="https://talosintelligence.com/vulnerability_reports/TALOS-2023-1845">TALOS-2023-1845</a>
+	advisories, describing vulnerabilities in the download hash
+	verification logic of Buildroot. These issues are fixed in the
+	2023.02.8, 2023.08.4 and 2023.11 releases. For more details,
+	see the
+	<a href="https://lore.kernel.org/buildroot/87y1e7sq4u.fsf@48ers.dk/T/#u">announcement</a>.</p>
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
