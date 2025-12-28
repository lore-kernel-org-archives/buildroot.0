Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B44E92725
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE3C840678;
	Sun, 28 Dec 2025 21:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7PvRVYbUa3C; Sun, 28 Dec 2025 21:00:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D65A240639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766955630;
	bh=HzmCXDDPHDAcYC2YgcUer0YpnbAfB3mudlhyaTm2YI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DxtzRf+Y7V+5+gMuLXJkgGIYR7rqCKvI6foKKORipKecd8TOwmxZHMYayBioZVbKa
	 k2xBNLVOXivl0j0nA2Ny+YGFEEuvJ05WhOfdGH2ZlVls7Ikymm5U685ismG00LSmjD
	 W91LFTxycGfvgn2rXsPeizA+5GI69A5xzldiNPRsKTu7szJg5KNP64S6QmTdEWiDly
	 1TLcbjqmjSELJOp1mpZ6QkOpC255oX9vm6ZTGvTAJyxHS0iXv1QxHYhHlwszn4w+SY
	 EIHGhNxolEr10+McxdI29n9M30G+cAZd178lBWSIjzuqHqMXeKXLYJAvxViW7wNLCJ
	 6i4EeYTSYkNUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D65A240639;
	Sun, 28 Dec 2025 21:00:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 363B7353
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1926660A77
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aErZneMP7w6y for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46BE460A72
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46BE460A72
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 335BE87971; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:00:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77d1dcd2eaa75386f8f044d213877543e46c72be
X-Git-Newrev: 1b656345ecb8353a788f809a2aeca5c580fa0d8f
X-Patchwork-Hint: ignore
Message-Id: <20251228210024.335BE87971@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yasm: add CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b656345ecb8353a788f809a2aeca5c580fa0d8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
index 976c2f7a13..b563fda71c 100644
--- a/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
+++ b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
@@ -10,8 +10,8 @@ For more info see:
   - https://nvd.nist.gov/vuln/detail/CVE-2021-33454
   - https://github.com/yasm/yasm/pull/244
 
+CVE: CVE-2021-33454
 Upstream: https://github.com/yasm/yasm/pull/244
-
 Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
 ---
  libyasm/expr.c | 2 +-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
