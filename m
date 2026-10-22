Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8519606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qnfdY/QY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 792A84083D;
	Thu, 22 Oct 2026 15:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWIAH7G3ZE-2; Thu, 22 Oct 2026 15:28:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 87B29408DE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792682909;
	b=QSn72jb0KnZgc3B53mfsQ7NkjKsxWXTpPc9a5W4g7tcSqWWwNnoICsZlmHwjYICVO/hM
	 Pa6y/sCGq/Ysw10G3CRXNISXU76GApAke54cUA37i60/9GzOqQ+DXxwFxlVyf6TkKs592
	 uzucnIX5SIKO2rdJDUsdewjOGKoEOWkP0OJZS1vQ03pNyCvei64/n5oYxVXOE3tbcKvSp
	 /RS5ZlegsVCdIYDAsCOovFBxNQAl0FDFVw+CqowyJYjPAgorrGJkQ29xJJ33SG6YP2a45
	 rhqJCMV6FkR3t9Y51xFQhYUcAhtrq5E5Td1P4Jqhw8aP3YHIXzCp/5GJ8MNUMdg+JNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792682909;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=26epqBTiTg7L1Dp8Dxb8/PuZQgiPwYP7zIF4xk2uf9A=;
	b=bYe/V0AgjcTSEKnB1EGaRfjRK/o2i0Odb9Li1LB6VnHnldvRmjWgZYRfMEzC1dnPK1aQ
	 HgYsHAH91phT6v4TdWGz+R4xciemmPG/lxnOlQLVjWMSwliNUfraP46lepxGDdpL/yzNc
	 W5+q8weaZXQZ85ichFYrfk9NAo0ZAVwOBrHBRFqxlAWXAxpzVwvGzwFw9cR+dSO9HJYC6
	 RZ2PvUCjbdUaBuVo+ogdPAjpE6bzVtddZpeoBMKDddIn09uzemZj3SUYCr9cV13fPQwVM
	 OM2b6O1+0s+KUMxTXpikN+3b88LjxClF4uYWGniNHqsRW0V2CPijzPq5VKgGC8oXKNQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792682909;
	bh=26epqBTiTg7L1Dp8Dxb8/PuZQgiPwYP7zIF4xk2uf9A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qnfdY/QY+JIS9LHbZPjJFJebppt6EBWJ8qmcV1nLlBh2hN1x9seTzIOsMhqpdgIfO
	 LQ758cQ/2NCa1lMN/WjzxPekqOmVf6Z2O3tayGqwm34oCA7Xr0JW4+/+oe2Qf6qtpP
	 DvfviRBzJkwoVAZN64JHYSEfR7F8Xjgq6qNSballmCtJTMYgLPDs2+5n4woWArMdIs
	 MQHWbvEh2Hb/Xliww/+UtXBqBHKegovSQV0wBzl8bET649qJ/P7c1rF2+RtKDLN/Dv
	 GIeuxGHCOlpYsM7nzdAVYe8Lcs51cZt6lJt1rw0sfj0YsKfQsciLfAQxfPHVJ05soE
	 OZy5cjSeokrxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87B29408DE;
	Thu, 22 Oct 2026 15:28:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E2E33C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33A9F408DE
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoh1Msy2Q75w for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:28:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E694E4083D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792682903;
 b=TUro69R5FRlthGvIn7+tXGP8ufHWYTw9plqLTy5CRsI+Yqp0tDAjR5+iV4oZumeCKl+U
 bj58bmKH1N/WEJsYJj6Yph+suEcitkaWtgtPBxfsV9GErogMOepp4r5CxC/elzpEXqZo7
 6ZFEo7zb9YAsYG8HTHrcd7/kvpD7KZRKcFWIo2asvjnMGClv4LRtQLKqve9jPccdJ7fGL
 ABN8NPJuOw1GJwHLYcbZ0fpln8bhgpjqpCHgnkzq6b8FIzsgQtNe2VazhoVZ6pOz3ClBW
 +er5Ksw09lbXia2OB2Jpl01NBMwbwoN1fG/gwttlUlEa7A9HgGdx5vjZu7zgBNtdQ9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792682903;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7NyqhhkZgvzK1vE7iXVanyEvw96vTq4u6looxSPRPDE=;
 b=VAPXzBI826EDqcecPJHIiClqK5ibbxMHSVMRbriEyK9PzCAHxVGsN3cQ6XE53Csc0Zsr
 3pdeH84L9FRXvXMGCGeOJGK1rm6XTgTGdFLFBFNKVKwjQlCbto+WoClZSezx9VS4Adgbw
 8Q+gGDD6D4hcU/oa62B+GibHBzqGvOQ+FSpqzd19PupQ2f5MrW8WgViLgynb5o4yEJhJb
 88rfhUF56Kr4OyQMcPrAsmrPkXmU8OzqaAwIkmUJ5lxzWc3KpmxwJuZD7yDb+tzajhw7P
 jnih68dsai0KujxK4C1sx+ePLCX6vtR4SquYaa9On1KO88573erYHR5ZmwhkEi4EjEA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E694E4083D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:28:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC06A9B9F9; Thu, 22 Oct 2026 15:26:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 17:26:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83142f3f79537de47593f34fb5a90affe0ffa8ae
X-Git-Newrev: 25b9201f59e531809f9a2cb9ff32a7d17c9d4b27
X-Patchwork-Hint: ignore
Message-Id: <20261022152659.CC06A9B9F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2026.08.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/25b9201f59e531809f9a2cb9ff32a7d17c9d4b27
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 30 +++++++++++++++---------------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index d6f260bc77..a940e6f7a5 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -22,52 +22,52 @@
           <th>2026.08.x</th>
           <td>December 2026</td>
           <td>
-            2026.08-rc3<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08-rc3/CHANGES">
+            2026.08.1<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08.1/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-08-23</td>
+          <td>2026-10-22</td>
           <td>
-            <a href="/downloads/buildroot-2026.08-rc3.tar.gz">
+            <a href="/downloads/buildroot-2026.08.1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.08-rc3.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.08.1.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.08-rc3.tar.xz">
+            <a href="/downloads/buildroot-2026.08.1.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.08-rc3.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.08.1.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
 -->
         <tr>
           <th>Stable</th>
-          <th>2026.08.x</th>
+          <th>2026.08.1.x</th>
           <td>December 2026</td>
           <td>
-            2026.08<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08/CHANGES">
+            2026.08.1<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08.1/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-09-04</td>
+          <td>2026-10-22</td>
           <td>
-            <a href="/downloads/buildroot-2026.08.tar.gz">
+            <a href="/downloads/buildroot-2026.08.1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.08.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.08.1.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.08.tar.xz">
+            <a href="/downloads/buildroot-2026.08.1.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.08.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.08.1.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index b8f9e92852..61bacda51a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.08.1 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 October 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2026.08.1 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2026.08 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08.1/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2026.08.1-announce-1792682049@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.08.1.tar.xz">2026.08.1 release</a>.</p>
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
