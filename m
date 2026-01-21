Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF71C44536
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 18:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D86CF46E35;
	Wed, 21 Jan 2026 18:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZjF4WtKH3-T; Wed, 21 Jan 2026 18:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74C6B45FD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769019438;
	bh=uYSO88peLWfS9wV4FNPKlx0oOY3cvWkMF86TXigjCGo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nGf+U4+L3rRbvyxSBaSyOE3P3+jNHRTRtpwDeD8js6VnP5TzlSy2rh2CoQYBmSncV
	 RQlYop1cArucQo1LA7rvycZFK2IJD3hL6GzKGEzOA/W6nht9YHkfc/52agoISpiJ6b
	 OVaXz69g/C2L7xX/pFhsYQUGJyxfe+98iAH9M2KOSHpuOovwRuRzr7OCg9LCWqB/yV
	 OhApNbhYLcJZgW3Gh8IyyBhKFSuHdgoP4eRirnB6huKWuWinYLb+YuBkA4faECE64A
	 /qo3uoS1REME4OfJdDV9SUbS0s+3c8nQdAL0EvCpkmZonFOgKqOv2Wnlgg9Z52Y05Z
	 iEl7QuZ7MrEkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74C6B45FD7;
	Wed, 21 Jan 2026 18:17:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70E32160
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F45040639
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPFGgl_LOo6h for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 18:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EB1C4018D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EB1C4018D
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6AB39873EF; Wed, 21 Jan 2026 18:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 19:13:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37862b394decbbdf9e6b2c36835f0dec6f05e83c
X-Git-Newrev: f7447c0d86e55d973d69e92c70a55087e24320a5
X-Patchwork-Hint: ignore
Message-Id: <20260121181716.6AB39873EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.arc: fix 'operations' typo
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f7447c0d86e55d973d69e92c70a55087e24320a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.arc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 7dd564d7f7..f250ae5eeb 100644
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
