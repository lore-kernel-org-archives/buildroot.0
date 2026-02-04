Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E10E9D416
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD75160D76;
	Wed,  4 Feb 2026 17:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRYIGK7ygdMQ; Wed,  4 Feb 2026 17:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7B1C6105D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224806;
	bh=vA0VcpyqvZZufdITbK0VcqabyCWj3hV7/66/CFG3mIk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WI7SaPI4F8//oRFm3DDGG9rwJKrXDVgbuELhbr9zdCpDNV6L8XYN/n0gk8jnC6AJO
	 WvCxuEyMpJuA6jgM533L9va1sgSNdhxVWuJH8dasSGvv99xnR5pyrNhc6iVBBSHEC1
	 Rt8ZMh149CAbhy2+qH2/j8/Z3dIgFENnf5b6haZmCTf+gPohf8LNBUSz5nTX/x7h3z
	 aReen99XU+n3MoqigzPSoc95zDLziIubn/2C94Q21jjk/CqzcX7BH3Y+bMPjsZJaEP
	 FG9SWhJLXu+9rSp28DIR1E7A5VnwdTeMvLxe63/6TFSIqljtSwp68MIPovJoGYlSOf
	 x5TRnXANqhnCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B1C6105D;
	Wed,  4 Feb 2026 17:06:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87DDEF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62AD883F37
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ES8gxDPT_rk5 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74B2383C6B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74B2383C6B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FA6486979; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:28:06 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9741729c8af80397c98a92c1ba5f45b9e02f5aac
X-Git-Newrev: 503b13b3cab0734a2af842aedd9f89c6b33a40ec
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.4FA6486979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] arch/Config.in.arc: fix
 'operations' typo
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/503b13b3cab0734a2af842aedd9f89c6b33a40ec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f7447c0d86e55d973d69e92c70a55087e24320a5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 arch/Config.in.arc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index f367c49131..f8e749bab9 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -31,7 +31,7 @@ config BR2_archs38_full
 	bool "ARC HS38 with Quad MAC & FPU"
 	help
 	  Fully featured ARC HS with additional support for
-	   - Dual- and quad multiply and MC oprations
+	   - Dual- and quad multiply and MC operations
 	   - Double-precision FPU
 
 	  It corresponds to "hs38_slc_full" ARC HS template in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
