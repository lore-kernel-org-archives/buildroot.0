Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D81E9272A
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A0A960AFC;
	Mon, 29 Dec 2025 14:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0sjTV4Rgr9a; Mon, 29 Dec 2025 14:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 810B86086A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017267;
	bh=MPE5TVcIaamzGAvxBYCtxwtUgRC/yUWpTimUiFzQ4xM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CVSB88DVrs5yk5fck+PY+8RqQCi2sWv6HaAY7ITIZGVtEWz4Hnc749muJ8Kn5Qfc7
	 OahOgRlIN1jSMJZTf9m0fZxYxTDqQcy8ohYCcYtPUegqKbCsbT51oicB5O9Sm4u6j3
	 PZyi+oBM5THpxApgTsxW0sJk2bMSTwZl8w3lTbomohyyqDJbFaOqA/pte5XQlgmPbu
	 BjxUPRsboIesqKSjQeawwgSrdh2YiFReJ4e28uPVCtPyVKMvD73rXGmf2xKOsXoDaG
	 bEBw1I90Fn/vJ4BW4fZ9RISI8kK7URk1n7S0k9Ie7qqBI21TEDXWsBoR+XeSt3YcNB
	 okq50rVpjbVZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 810B86086A;
	Mon, 29 Dec 2025 14:07:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E365354
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 635F540473
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9b9-3h1HgNV for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94D17403FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94D17403FE
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 909C387B4C; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 15:06:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b8c58ae03f87e047c14585b16de19c66b8344c8
X-Git-Newrev: 0b76139aa90828b3d58adc5853e1fddbe102b2a7
X-Patchwork-Hint: ignore
Message-Id: <20251229140743.909C387B4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opusfile: add CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b76139aa90828b3d58adc5853e1fddbe102b2a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
index 2ef08502ab..8e3be36cdf 100644
--- a/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
+++ b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
@@ -15,6 +15,7 @@ Thanks to https://github.com/xiph/opusfile/issues/36 for reporting.
 Signed-off-by: Timothy B. Terriberry <tterribe@xiph.org>
 Signed-off-by: Mark Harris <mark.hsj@gmail.com>
 
+CVE: CVE-2022-47021
 [Retrieved from:
 https://github.com/xiph/opusfile/commit/0a4cd796df5b030cb866f3f4a5e41a4b92caddf5]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
