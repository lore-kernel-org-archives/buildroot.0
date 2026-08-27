Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9204CC61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 19:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C272880E4D;
	Thu, 27 Aug 2026 19:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNLUlet-Km6w; Thu, 27 Aug 2026 19:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787860067;
	bh=CuN4eC5tVMbWXXJAIZJDHPrtL5LfYTjvstWkkxC98TI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qaL1pEU82xRkS7YZlNg3HMwwliJElRa98/CTFmwirXXOFjwNpNPy2d3TRJ3ru1FHk
	 5sX0mXoTT7GWiz1ZSY/L4jUSakQ0SxhELiTghM0mov/06jQ9q8vEvqGTGLrfuiBw2x
	 LcrHzbc5h2445ROakW2thgrTDU6pm7bxSJ8s/CTDPIdZV4bLA0TUsWk2xSDbXxtCMR
	 SpuWTD5zOOhoa58mqyr/sWXt+GrQba3Sb6aC/E+QwLcYTXQ0aeMEOSMowtkrpgKy8v
	 H8ZoQEsJDX4Nf4u4qEmTvUorQFqbTwJISA51/3queK4qK4NcUhOt6nac/kVgzsaH9M
	 d2mRm9CX+Cr1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1644E80D66;
	Thu, 27 Aug 2026 19:47:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66AEE105
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C4B9607E6
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSNdhJB6lyBt for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 19:47:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B2C4607A9
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:47:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 244AD5FFA3;
 Thu, 27 Aug 2026 21:47:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 27 Aug 2026 21:47:42 +0200
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 21:47:42 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260826210042.212245-1-romain.naour@smile.fr>
References: <20260826210042.212245-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.18
Message-ID: <5bd6fed37b9bbfd14c113099cb859595@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/qt6: fix c++ static_assert issue
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

On 26/08/2026 23:00, Romain Naour via buildroot wrote:
> Since the last qt6 version bump to 6.11.1 [1], the TestQuazipQt6 fail 
> to
> build due to a c++ static_assert issue.
> 
> Backport a patch from v6.11.2 release.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/16060153667 
> (TestQuazipQt6)
> 
> [1] 
> https://github.com/qt/qtbase/commit/2983318421d623c6c9feff95ff947ca489f4313d
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
