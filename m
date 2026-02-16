Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD91E83829
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 19:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF1C360DD9;
	Mon, 16 Feb 2026 19:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tztnK-Pld-Zl; Mon, 16 Feb 2026 19:33:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7CCC607FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771270421;
	bh=ppBoM+LEhLM9eUWG3WnKwIVqcJB4sKSuoATWpaNEm44=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oaWc5uwi4+Yzn7CnVhgaGxUIPCNbtXcT4iF5/+ZmbXyNsMNfmWvWKbVs8E/o3hkj5
	 yG6XnlPhfgfarTWdUa1fFX8q2NsJRr/rQE3IDupKoNJ6VZ1EAtxHfHSEXCjXcVtQiu
	 GAzMVoBaqNTJ/dDG1umT875foRkL0CQUDD64js0Qb4AbbFsozlnFWLETuLNTIbn6SZ
	 VBSrY77pyP0g9+qQyS27oqT10L3rcBxxaJsYRedonZmK1a7JpVebASvFpsROJyaSLR
	 AFx9L/nnTp3k/SeW20qcPQOmQ8110YO+eI1WGEsmwXpzQojCmMbflpTpmxSmU2Thys
	 pYhw9stSPC0YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7CCC607FB;
	Mon, 16 Feb 2026 19:33:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67EB335B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58C7E40A14
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrtjX1RsGrsp for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 19:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99728409F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99728409F5
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:33:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79CE986ED4; Mon, 16 Feb 2026 19:33:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 20:32:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5a1171ca3b5688eed233488744c5eb77ed69ec5
X-Git-Newrev: 541986065a4cb8e6edcff4ddafac85f4a88e33c7
X-Patchwork-Hint: ignore
Message-Id: <20260216193338.79CE986ED4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: add maintainer
 announcement
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/541986065a4cb8e6edcff4ddafac85f4a88e33c7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

It was recently announced on the list that Marcus joined the maintainer
team, so add a news entry about it as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 00bb718940..c85ff0d3f1 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,21 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">Marcus Hoffmann joins the maintainer team</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>5 February 2026</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>We are happy to announce that Marcus Hoffmann has joined
+        the team of Buildroot maintainers. For details, see the
+        <a href="https://lore.kernel.org/buildroot/aYRR-h2Ol98Svw2Y@windsurf/">announcement</a>.</p>
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
