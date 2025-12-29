Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAB3E9272B
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D683E407F8;
	Mon, 29 Dec 2025 14:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnqC0-WCfNv0; Mon, 29 Dec 2025 14:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F4CA407F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017274;
	bh=96dtazkhP/SFshscQHaRKNoAEBg+43FFz2DP7BpcrXM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LjXGPZi9FvRuB0fM6E5cU8bIQ+PRqLzy2Mmgs7sw1wNkDBk7pJAtnpYm5XVRS3S8t
	 ZXW6sF50uE1WYlPP36CVgzvAw/10ShwNiSR8XyGmY1uC+C2GTSTdJXkrBGKns4WDNH
	 ZrSDx4MZUIJwAhx0AYLroiO8lBvIg1QUvcki4IpToDhC9yOHTFCgZMx/rGvGN3FVb4
	 73KlTP3MTZIF7En2q6NAlHiUnLw8r/6KRX0Uf5026+mywxShtlOpwCaU0UQ5nHkJ/o
	 Kt/HICUeIEbyiz6HZ+2Zjf/nb6tN1T3euLxSHflEW0hzX82nUOVKu08gncQhWYnLCH
	 32bd4O/a142IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F4CA407F5;
	Mon, 29 Dec 2025 14:07:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A18B71E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7826A40259
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Csm04BUNvdUX for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3BCF404FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3BCF404FC
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2CBA87B48; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 15:06:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba51d53019bbc6f862b87389a90695a3dbe0670c
X-Git-Newrev: 9265e6973593240104c8f9e2a675c01c6c8e37a3
X-Patchwork-Hint: ignore
Message-Id: <20251229140743.C2CBA87B48@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtomcrypt: add CVE trailer in
 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=9265e6973593240104c8f9e2a675c01c6c8e37a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtomcrypt/0001-fix-CVE-2019-17362.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtomcrypt/0001-fix-CVE-2019-17362.patch b/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
index 91e2145853..adf5020049 100644
--- a/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
+++ b/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] Fixes #507
 Fix a vulnerability in der_decode_utf8_string as specified here:
 https://github.com/libtom/libtomcrypt/issues/507
 
+CVE: CVE-2019-17362
 [for import into Buildroot]
 Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
