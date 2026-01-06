Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03161D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACBF7834C7;
	Wed,  7 Jan 2026 18:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3SWvxPJ2QkZ; Wed,  7 Jan 2026 18:03:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9184834AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808985;
	bh=q52ShwQ+/CVd6vzGJwOOodax5jqjMzr2lNbWoGZhKyc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H4Fbo36aVDVjtPHVw489F7dUAygEcjNfK9k9pvJaipHS4pElYB3IPMI1dCFcJBdic
	 4vwYk2qr0yQTzpmNJMPcH2fjBz2cRL9ywhRlm4Du6ke5q2D3hkjOEEZqVJZ4fysu6c
	 9zDB1tkkWEPthvHdbox1L7ZajCldp3NpBtsY4Ypb6LZt1KKjnT9SWQBoF4dv3dIovs
	 B/c13wNWkqJ1GHNiSSf5irhhmDmCedJ8oABfZ37XTRDPY26ipR5R7dliu/AyNYIxiU
	 yzTVg+WNFR0BuR4A0zQY/r55Pkm0vOizXF9ycna87vFCrlnhYZadTMyEgjIMG5yDKt
	 1Uick+PCE6r2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9184834AE;
	Wed,  7 Jan 2026 18:03:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06CA325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F0F6810D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2O6z8FMdRR8 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A9B781105
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A9B781105
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 875A180333; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:56:35 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 8d4db92e66f2c7a7b7322bcb94aeb48f7f491731
X-Git-Newrev: 94e3d1a7414f896d8d2b2ca2dc3719d6a8ba46dd
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.875A180333@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/yasm: add CVE
 trailer in patch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=94e3d1a7414f896d8d2b2ca2dc3719d6a8ba46dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1b656345ecb8353a788f809a2aeca5c580fa0d8f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
