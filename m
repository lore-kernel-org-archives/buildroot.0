Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF130C44536
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 18:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24FD540C62;
	Wed, 21 Jan 2026 18:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7TcdN_6uHNV; Wed, 21 Jan 2026 18:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07E4147121
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769019442;
	bh=qSz+T1432vQWAMsAIHPh9gaB16KRbKq+4jsXseY6UeY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QhEFWegyMkYa9SrY7kh/aDGTjdF1DOhevyDgMZlTaK2Ct7sb+xtSeRL76ypvT75vw
	 iLUnMf8YIoDMHtxute0/4hYDEL4MPotjlSVpoAVGmvZUUrLgEP5XW+0K8Uvb+Zxc2R
	 l99f+ZvtEBfdELrnvyvVeB5NMFBAto7TpIxRQY2wegXT8M2Jms8weW66gMH9hKln/u
	 xju/Bp1+Y/20QpNLT1Fkonl3zjaTHTopSuqh1fBboDqj30spjVtvc6doBDUVdaf2kw
	 2aAEaXkwwEUqV4dcbI3oR8j4oVaQXg6Ve51ungiiNpOUBGf5b8Ub1WxkYK55aSKFfY
	 vdHFAs9gb1cRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07E4147121;
	Wed, 21 Jan 2026 18:17:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 491D0160
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3913440639
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIxkCy3Es24K for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 18:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70FC04046C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70FC04046C
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61A34873EE; Wed, 21 Jan 2026 18:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 19:13:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51a10663580833388e10941e1ec70376a1b1d5bc
X-Git-Newrev: 37862b394decbbdf9e6b2c36835f0dec6f05e83c
X-Patchwork-Hint: ignore
Message-Id: <20260121181716.61A34873EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: fix 'targeting' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=37862b394decbbdf9e6b2c36835f0dec6f05e83c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/grub2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 3a50ec0ad7..8cd56cad00 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -118,7 +118,7 @@ config BR2_TARGET_GRUB2_LOONGARCH64_EFI
 	depends on BR2_loongarch64
 	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
 	help
-	  Select this option if the platform you're targetting is a
+	  Select this option if the platform you're targeting is a
 	  64bit LoongArch platform and you want to boot Grub 2 as an EFI
 	  application.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
