Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F41D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 941D681122;
	Mon, 29 Dec 2025 14:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtnQuxem3lw6; Mon, 29 Dec 2025 14:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 869E780F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017265;
	bh=DZmqPC+8idcdKYuOQOD+bfnbPwhcxThHjcSnrmCTnqc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e4VpYFg6Ow9cMlR5IDh8c0oY0oDsgh0HXSL7Y3u/qEWZcXXboMKPWN0JEFNGsxi/N
	 AMkyY8TplAZWCndr2pKQYo9Gvt5aYPcOLns8WNcM0EjbivZUYA555i4JaXknth4Hkx
	 yLNDRa6ZbDozAwArNEJUCwe0TIb3i+GvBs3n1aSaKtLSTqFlW1RsOthxDTYzUz2BQu
	 qbUxL4YYm0JkEkRu3LC+XWwHZeQZe3ycDWF6yOw4YhIx4hCLNERbR1VdMbdQD2oLel
	 vagJWATAsJNzNxBegyMQ2XzRfSm5OksVyMlvhvRxR+nvBJGjAmgg1jCFCiAP9ToKti
	 y3rEN1UaemcXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 869E780F01;
	Mon, 29 Dec 2025 14:07:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E1EF177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6003781068
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TFX2udJQoFR for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A731180EBC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A731180EBC
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9870C87B48; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 15:06:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b76139aa90828b3d58adc5853e1fddbe102b2a7
X-Git-Newrev: 848d7dc51f1ce2576cb071b0f91063e4687cc088
X-Patchwork-Hint: ignore
Message-Id: <20251229140743.9870C87B48@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-http: add CVE trailer in patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=848d7dc51f1ce2576cb071b0f91063e4687cc088
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
index fdbf5243f5..7672ff3794 100644
--- a/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
+++ b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
@@ -8,6 +8,7 @@ then return `EPIPE`.
 This fixes a potential infinite draining loop when trying to trying to
 `:shutdown()` a stream.
 
+CVE: CVE-2023-4540
 Upstream: https://github.com/daurnimator/lua-http/commit/ddab2835c583d45dec62680ca8d3cbde55e0bae6
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
