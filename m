Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C673FC5DF8C
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 19:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90CE2809CA;
	Fri, 21 Aug 2026 19:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxPJX2lECIPe; Fri, 21 Aug 2026 19:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787341742;
	bh=AYNxVBc+eiggl1osrtZERhdwgLHgPZa1adaQfXVTaes=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mSZW10R5iZnqn06CzmK8Mk0ghbVNicdQUUUWeOmcAeN0vcjFlCZ3TGJgbSfPhyeLw
	 sITSML8HM3w0zBYxh76rXUTlT7QLb5QmsMoDsJJtLUKGfBpVM+7wm5uYRFdMWg+LWa
	 lQWywmjqluH7LkLn6lBpWXi+TE6WkbXcS5HLqeIo39iNeHhny4KdKT1Ov18FF6nHLt
	 wb1drvBTTCvXNRQm77voDtyRHdbDzjLL0InNw01meWo7o0/YStww4ecZEjHunoTJhS
	 EG70r/G/Z5RYPsOk/8Au2tjeytXf2p/e4VXmGoG5MXfmPAaqKKGKQhhcKX5raFu39L
	 dxzAn3bcA1PyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C541581173;
	Fri, 21 Aug 2026 19:49:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9CDE93F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB99081173
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PR5aqgOUrvcO for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 19:49:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0A248116A
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:48:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 403995FF95;
 Fri, 21 Aug 2026 21:48:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Aug 2026 21:48:57 +0200
MIME-Version: 1.0
Date: Fri, 21 Aug 2026 21:48:57 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260819162406.1945796-2-romain.naour@smile.fr>
References: <20260819162406.1945796-1-romain.naour@smile.fr>
 <20260819162406.1945796-2-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.18
Message-ID: <bb54b76627a6af6530b33489fb5608ca@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] support/testing: remove TestGdbArc
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

On 19/08/2026 18:24, Romain Naour via buildroot wrote:
> The Arc specific gdb version was removed by commit [1]
> but we still have the TestGdbArc that was testing this
> version of gdb.
> 
> We can now safely remove TestGdbArc.
> 
> [1] 0b3d526226662af8b16525aecec7da5ff0e5fa1d
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
