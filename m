Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7FBC61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 20:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62AC4606CC;
	Thu, 27 Aug 2026 20:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTz_jN2BSoNn; Thu, 27 Aug 2026 20:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787862867;
	bh=hss0O8wWxGr8YhT46i6dyNakc80bLHDQgzoMyOTGjXY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O6C9inplSHwV2YR7QvfAcmeFOv8cYpTy8mXsfFVw27lKXabyhseZL4sWcky47265M
	 zfWw2LEs/ql3kK8IgBmDGFdgsJXpB4OaQJQMvItIWy3wm3YVb2zsQpqR8Wh26iuDLS
	 Lkl6kzcfwRmYCHs1AUGPL8GXbijWSrOLEXEELC7LmREVt61VYrH2fuV2VfOJ8ZTj7a
	 nOY7tWmupT7OraBmN6yRLsBsL5/mazkdY+ER/+4UlWN+58SX5JgoKt/dIVzYPAR2sn
	 Dx90M1LeIrBt0UuSli5qDUVBGdSxHFoVsvsFzsTBNS57gfPc7p4nw1+92t13IYGMcG
	 yVUp2HjcKGGkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 830B06070B;
	Thu, 27 Aug 2026 20:34:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2207334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A40AA80EC6
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfGBIUmLAI4s for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 20:34:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EFF780EDB
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:34:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1D27F780383;
 Thu, 27 Aug 2026 22:34:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 27 Aug 2026 22:34:20 +0200
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:34:20 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Francois Perrad <francois.perrad.86@gmail.com>
In-Reply-To: <20260826203304.387458-1-thomas.petazzoni@bootlin.com>
References: <20260826203304.387458-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <e603fd6ea129b675cc5c15fd827b1e55@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/perl: fix build issue with musl
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/08/2026 22:33, Thomas Petazzoni via buildroot wrote:
> perl does not build with musl due to memrchr() being unavailable. This
> is caused by a perl-cross bug, which does function availability
> detection with _GNU_SOURCE defined, but then does the build without
> _GNU_SOURCE defined. At least OpenEmbedded and NixOS have faced the
> same issue, and worked it around in slightly different ways.
> 
> On our side, we create a patch, which was submitted upstream, to solve
> the issue.
> 
> This issue has been introduced in perl-cross commit b40c560f5d5e,
> which was first merged in perl-cross release 1.4.1. From a Buildroot
> perspective, we bumped from perl-cross 1.4 to 1.4.1 in commit
> 8a289667f5dba6fffb3a21faa14517e9b49726a4, which was merged
> 2023.05. And indeed the build failure can be reproduced even on our
> LTS 2025.02.x, so the fix needs to be backported there.
> 
> It should be noted that even if the patch is against perl-cross, we
> add it to package/perl/ directly, as patches in perl are applied after
> perl has been extracted *and* perl-cross has been extracted on top.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/3e47ade0963642988fd8e1be9a6e8042700619ec/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
