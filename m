Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22653606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pBAA40k4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF44880D7A;
	Sun, 25 Oct 2026 20:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVUOyA6MzVxS; Sun, 25 Oct 2026 20:38:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2EA2980DB8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792960684;
	b=J2y2ZhuEJ8AgxfD7Aw5xFULxPcmMewiDm+xaLmmZpwTF4H6oCuvo+ua58HfoK6udA11Z
	 Hud6v9NmuPCVoXsGEArQFzWQqEGWy+Yt1JIORS/rhNCPjbxh7EyVGwfAVU3xyfd6jwOib
	 Js97Etw7Pcy+SwpjQpHJGRlJ8LribsIKA73X5L/lbIFiEbh2OHskFAD/B4LoyLe3JCkKI
	 J73T960OBG0s75qRWEdYcZpQ6F1b0dOJwdo9NcHnfj2ER0GOtpe1sqqnj91Rgl33XPJXJ
	 fO8OehOtm/KtsTh9Ggkxw/rKCDchGITQsk+PT97Jl5DmsvEyPB3bKuKogiRtzexlXqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792960684;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/xjPhmaGjd6mTfggJzYTYrL0hSpnoq4fd9VpzJdTSQk=;
	b=BXZ8mKwO5CNWD0bRevRoiJAIefT0fSkj9iddotCBibSZ57I6fF45vWe2q7BfqjIc3Im0
	 vqKgvOO/sq4e8IiFVWrpfR/+X24r0sEUVH4qQRrc4titViO5Y9AIE9A0c6UyCRfzNeIID
	 iMiolUZyF3kkaCBi2NvBPhrprTJsL5weKn0bp4f5VNhXAHr4JDFxTaHTyKsfhLGp3hLbS
	 NRbcRor0oAzT7MxqeXIJLmIHRqiiuXC2JB0jsi0lTWSoHwRZMKZyP9FOyA0ySP/ka/v6F
	 F3m+TPbMXrWYBCF6sCgdQU00GW7a+1ABTo5b8uD7pOpJW37koG9gmFoeqyTkmRu9u9w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792960684;
	bh=/xjPhmaGjd6mTfggJzYTYrL0hSpnoq4fd9VpzJdTSQk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pBAA40k4QJvBCja1V/+CEkPGjP82rqItd6NV4+3OAUX5yBQ7a0z8EVZXoR4fK3xlM
	 LwEZ0FVE5Y1gsNkiurMvDb62PReBD9j+ufS63O6DZ2CzT2I+VFi2TP5M2E8hwHiwHG
	 a8+pdZnUjWri18gjKOsqkx3kMHRw/cPELGT7zKdxK3TuMLhcKd700NtCUgOQ0ubF/8
	 fbe6yqdn3bc6gLAdF2QtVQWY8Lnzj6ZGIpnp5sqF46Ziowdal8IHwFZUwza4VkjAd/
	 uKYU4C5wLahuZTDoMO5mIsw7tKj4msj+tf9iVnqPBGUg8ryGIAK9YwpzK8YvA31/Zu
	 mHPcmPCZ4ZvYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EA2980DB8;
	Sun, 25 Oct 2026 20:38:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C11D356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81842405C4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxOJKnYpDse5 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:38:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 98FFB405FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792960681;
 b=oTusIPUJkymoO5fQUUvp66rDeCtCAmFCnj0EvHyXf5t7s5RPesNfu+pbibFKmdEsIiVp
 ywux+ZHkBe65JbYYorMlttE/dC+GT18Gl+WWz0kJfMcbivQRVhwK1o3Piz1oZdlG7eyYW
 Vep+gtmx4XbiQUFkRXftasFXwtvFcMU5vWi+1BxVH/xf3kMB8ftiQ91YLGYz1d/R3roOg
 ao7gr0bpgR7HsY2fvltxq9PVVlWwuEC6E+12VB9LvmCNBrD/bNW9YH9tr9pnJKIpC4pZs
 slQAOweoIp9k2/FJpZMNt5QQ0LVlyBjGl931Vfbb9aq+16aJLu/Vjg9Nq3+v6grJCGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792960681;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=6SUnMZTgxLNQZjKFc0cOt5JwaL3I4B4TfrkBEtX2uKs=;
 b=Ld/YCfTO7F7gyE0duMvlj4n+HUE/ppmzEXxDhMXU2W/Q0i/+ptV73YIS/7NEDBVjjRhi
 dle7WTpdGxm3uTbTBTkOZxcZGFtJzn1J1LIF+I8zpwgRWcANALbsmuyq2wqPFaINr/Nmx
 jBL30SnACXtWXixQc9M3HFUGeOzw74omYQH7TKfq7CmIBNfXbciZZjS3HKgapSzt9Kmoz
 WIPjUBfNDltOOf2ZBHfqgq3XrCuecYYCSLC72x9DEcOxrBPS1zbiMNmXML0JhyjFoIyFC
 uba8mXXer65Iy5/BNX/fNYuFyZIe0Nv7BTKij1IP9cUgGCt7KlyMTRP3LG9z+r8DnQA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hCj5DkR4; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98FFB405FF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:38:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5AD124E41308
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:37:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2478D60740;
 Sun, 25 Oct 2026 20:37:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4D64E10328E76; Sun, 25 Oct 2026 21:37:57 +0100 (CET)
Date: Sun, 25 Oct 2026 21:37:56 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <at5ooNNyFjb4SqTe@windsurf>
References: <20261025200946.537342-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025200946.537342-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] linux: fix headers version selected by
 6.6 LTS kernel
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 09:09:46PM +0100, Bernd Kuhls wrote:
> Buildroot commit 5e8705263cf4592d8c02fac71803053e17d4f83b selects the
> wrong kernel headers for kernel 6.6 causing a build error:
> 
> Incorrect selection of kernel headers: expected 6.12.x, got 6.6.x
> 
> Fixes:
> https://autobuild.buildroot.net/results/857/8570296451fed025c248530da8186ad5c7b237a3/
> 
> Fixes: 5e8705263cf4592d8c02fac71803053e17d4f83b
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
