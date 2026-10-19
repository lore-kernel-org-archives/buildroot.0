Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3643606A31A
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XAOMsvPN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D4A260792;
	Mon, 19 Oct 2026 21:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrWCiAUatjeX; Mon, 19 Oct 2026 21:51:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A5449607A5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446663;
	b=fIdGGpCX8G6gTDEBeftudzcxfamffA0QP2D9XCuifJvx9VjJlrtqpEAUNxEixRNfvxSR
	 xoBQyYrJB6641Z1FIiH63T3sHjbPCRcl7TZ3bJkQSRQAPfFc9pNDTKvGkwwSncAYpPTWz
	 t3e6V7aKrEUK6GALOHsfsyUbBs5O80JlRmumg7VSGAwrnoodOMnxGkLNM8Ilq67ySclyp
	 an+7cSn0p6a/3LGJk8XY8s2QY509IX41yrY5TcDKkwabP8xLxJgAdb3NgTizdQBgrdAen
	 l8ENBf/UhfOFalRGpUVSS2JiyOEtzlk+TaVrc0OccmpUdTafwE4xal9OnSpvnMrc7/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446663;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UKCE4KmWdBO538TBh+xNr1GCdoQhWq7L8mboUEhK990=;
	b=oJoPROsP+lfdrpVoj6neZ4S2hf5sjYLjEfGvq1ADNME3riWzL1DHLYV94M3Cfub5pOhL
	 SFBCSAHTlJzie4LJkbn2FFYQ6hXZwLuYAWkgK0pz68wTBVe85iF9dxMrMJ2mMWnKQ7WRp
	 Y789+BuGt7anDCPlfJI1e6XrOPMqnl+6xNYUnGV/y67x7wPbLQBAqzncpyMtVShzzW0O6
	 OF+PczwTgPGzT+2pFzVl6wJKF9dnfL7Yz14SmFNJwNZuhc8L/qYm269AZtg/k7ibDQ1Ls
	 ftlW/WzHPDuJIeFlb0prEN3lgXPx6cP283QLCFzvIgL7m6oRzmmnXE+kYxeNi8jTu2w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446663;
	bh=UKCE4KmWdBO538TBh+xNr1GCdoQhWq7L8mboUEhK990=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XAOMsvPNgilglhxSyPtFcw1wbeRn/PNwf6hi48PLQJuaGznhwoHG3w2tN4tehkFFC
	 1sSmo5M2w4+je5h/KSEWhtFrOvW9tjzHzfbSQLCbp5mvNMjPefBDTUO+wjxrrBn5OG
	 hzx9h+ZFKGW0EUBWZdEDOqCLjHG1RMZqhvr28B/cnkgKPdktSoZlLcCx77diPCctOH
	 zZmBp4TDLHgRbXWikxGYqouvjoT/Y2Ptr37QnpRDw6e4pfQXJcjqXwHsoSz2Pviwg6
	 ioCMdyhcDJH0W2okx8p34aISph77d/+hJrMWeuZ/bLxpAQRQF8r3xbg3iPO84HKMO1
	 SMHnqF/aMQwZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5449607A5;
	Mon, 19 Oct 2026 21:51:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB51523A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A079F607A5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oaexzziNkzEO for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:51:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9F17860792
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446660;
 b=F0I1WQCV4/87a6E/5geE0g8Zzm2TSmUwHUGRWFfKKKrdXGiWQQzlSKKsn6LVq34z8OH/
 Vm4oBAuOO/Mq4wC1jaeVI05oi6+IDFziFAI/HWQzwNAO8kPo5d9r42cTLws+laMHRMx3s
 j2VWuk2db4RPNz0MqYJ6oxhPrjiC/d4E+hPSsNQVvGvD1Eqd5YZkMb1gSj6Bf8kCYfbHo
 Y+yBM4nssgSq6b01UiIcvbHelxMgyi36V40R7FCDMMStm8s9Crf8JMpGrt7F0FsfpPRB8
 mcaMdY+/U6h9B/9AWuF2yS+1pUPj9XDAogft3TWl94USIU1Mz0HbG1PJP/nK6hMudWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446660;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=CAbdnwmidD0V6ARTQOOQnrao2msPmDIWIae7mbWtz4Y=;
 b=Qr5hurouFIrjY+x2ftQ3vEnA7EaeZL4HRICJ2WN/JHGWb5OqG0n9CGluv3FL9SXBFeOk
 6dNQHLCeDGYqkiosb394NKUHB0Ef6PQ7pTxmJYY6jTstD6E6RB8WogaX7jcXiPXyHbODj
 vkYa6eofKZF8grwaRvmVWSYMGfE32iv2M91leKJ3Ajibm4/4Z8ur9uDB2ykxX+InFF2Wx
 eDv242a3jhcc7pPPcDN5RkazlFlQL5rLjMX2oUzbHAq/d7IyDcDj6HSszMv3slsO3uwmh
 nNBbZoY3sLZm0HhNj9kW/RWi9ZNl2OCB45Ee5zWy3caDzrAWZX+grLfXFZcjpgsT9wg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kaKTAboL; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F17860792
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:50:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3A806C5CD5D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:51:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E8A8560582;
 Mon, 19 Oct 2026 21:50:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 33AA410328C52; 
 Mon, 19 Oct 2026 23:50:53 +0200 (CEST)
Date: Mon, 19 Oct 2026 23:50:52 +0200
To: Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>
Message-ID: <ataQkSFmjK-IjEcL@windsurf>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
 <20260816191830.533747-7-alseycmiller@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260816191830.533747-7-alseycmiller@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 6/8] package/sdl3_ttf: build plutosvg
 support when available
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

On Sun, Aug 16, 2026 at 03:18:28PM -0400, Alsey Coleman Miller wrote:
> Colour emoji fonts store their glyphs as SVG, which SDL3_ttf renders
> through plutosvg. Without it those glyphs are skipped and the rest of
> the font still renders.
> 
> plutosvg is packaged in the swift-linux ports tree rather than in
> Buildroot, so BR2_PACKAGE_PLUTOSVG is undefined on a plain Buildroot and
> the branch selects SDLTTF_PLUTOSVG=OFF - the behaviour before this
> commit. Not for upstream until plutosvg and plutovg are packaged there.
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>

I'm not sure what happened, but we don't have plutosvg in Buildroot at
the moment, so I changed this to a simpler commit that disables
plutosvg support entirely.

Could you resubmit the plutosvg package and its support, if you're
still interested into this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
