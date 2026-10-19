Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BDCCCF2E6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 14:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 601A780E02;
	Mon, 19 Oct 2026 14:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id St6NE8cvGXcO; Mon, 19 Oct 2026 14:15:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E9E0980E17
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792419352;
	b=neCiWa2rMylFev58vBbNMUdFtjeYk+wRY4JINyZgWYmKEXottk+x8L/BOT2jiZ4HjH6l
	 0FLTybmxkZq8mzuB/cy9wJueY/+h1J2wxGuGa+/v3ujgHEn+IuZxJKVjDIVppUGvJ9EXq
	 wzukAMbJH/Rp7RazXEdTSeew6TpbOG+Vmlys26N9KNB8pwF4SXxyRae42aiQDq3b877FC
	 9q5p2zABTxroH6nQQRZySzaxGCA+oZxcin7OEpqY8IB+kEkTh8wgCpp0F60Qt+Enksgnd
	 sL7ZE5KY7G+e2Py6o/DpaEeU5I2v/D1zoxxxXiQC9+nzOdZdHAmi3DQ6qj18wyb1cfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792419352;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FdcsCEWNh1JO1mQK6oqiXuAqhzQSd3442qmmspbWiYU=;
	b=QdOulFOqPD4YGMesUBzr0l/6rwedP7Lyzzs22PwAjT7wzj/4XXHLj9dJ+sAtHch++kU/
	 YJGwV9kjPo69A0oseUpzosCYdHpyq+nspz7ZdHNo9JRSfNjZLVBqAHhBHAPAYjK3jGkoY
	 He+knPK/LGte76Vz3CWbrCrmBn5K7dw3I7adDfxrACcDdjxx822WMXryNKKkaS9GEWM1M
	 6LTthQLevQuRNJk2GWHmnU3hOzZt0pWwvdhVirIaFHLrhzs1Y4BzWeYTCYKwUFVBcK2yD
	 g6nH1IFJfzHqsWewGwgjEFZL1f9kuCbhK7mq6iWXVDcnjQxrBRvrqlo+819SKqKGOcQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792419352;
	bh=FdcsCEWNh1JO1mQK6oqiXuAqhzQSd3442qmmspbWiYU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nS+dQOGOSJaSlQZxze/nE+tYFq5Vtue7omU1mYYfEbQLbD///dodClbmc1zhhhb2V
	 Xfl7w+zdoTnLLi3bM7ZFh+cvViYWn17SPSdB5haWtwhJNIDuXqWawZjKD3S5x8tqh+
	 ipHbmoMbaPqll+XN/6fBN0rQRbWf+yP+4bqzw7WTRqIFmeH9iSxjD0WGQHmkgjbNga
	 Zi6TJWyLzu3ChE1UorhYB2loRrJoDBG8Wv52LcMy10wklEqbwOZZTSqrL+6AKFzyR6
	 AJ0f8wdTB98/xYonPUpVmgCpnbPRXI8JNlOdghX/+FjSVMaI/bPa9yayXwSJRv9ROR
	 /ArZi3f0v7mQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E0980E17;
	Mon, 19 Oct 2026 14:15:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19881263
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3984606BA
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JP7ekSTqNwQX for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 14:15:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7E6D060662
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792419348;
 b=CeXqn2n0FX+ez5ML87ujdo8IgGto4aTH2k/zbVnTkKFlKuNM+o4k3ptdr+e4usulMXdh
 HzolBUAXqva+CEzbNjhqE3p1VhN1WKwmclkQFsDg2Ojn17/rAjgTXJZglKIHO5O30Rk3l
 rM275iL57u4A4L/uwlXqKTDTeTL8SFYwdViKqU3hCQhpdjqf4EPABsFKS4+RT2GXqV/LW
 CTnNpgKPsnTkL9t03lgoJfd3t55UsH4tQ4X7fnaFf5Zp+XXh6uVGrG6VS0qx5G/yvAnIP
 S0QOhmR3F3PRpUfZ57jsYM1TRJY0aq7JHyKpEo11/zj0i7Lo4J0ByjhxP3DfrNYknEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792419348;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=HHU/JxId55PFzVPSAyfSxLwjs/bLNLANT/V6sLex1EA=;
 b=gHPJ5dBhqf3j5N5wmw+QwkPxQcBX3jlizD6gL+1OHuTSFQSHc0TlTnvibQkz+6mo/2qM
 7XgXDU2IxkeU3ZqEcOeaKmi3disn7DD+xugLrCPPFjV/QT8+y9Akxvz6hY/uQDT2sHqIN
 sE+/wognPVCk+LgTwTkQXeetYQYqBxa0bmQs8A6+5WhDAWRIaH5CDObeYgiO/V/4kcbX+
 Ejf0P/XOtnKfd01Bhzn+moAmMckbuXRi2SmkrsrriscJ8+qhosdTzPc2iUV9rHhb/fDNG
 JIidrr8KrA/GCp0Zqe567q9sKhqyjdldIKY042d7umCuFvcnNuf0bBA8yj3Q73KFu/g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=PlxrW5ul; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E6D060662
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:15:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 57A95C653EB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:16:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 308DA60582;
 Mon, 19 Oct 2026 14:15:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4105D10328429; 
 Mon, 19 Oct 2026 16:15:37 +0200 (CEST)
Date: Mon, 19 Oct 2026 16:15:36 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <atYl8GuwJY6TfMeY@windsurf>
References: <20261019123133.1631472-1-yegorslists@gmail.com>
 <20261019135721.1648298-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019135721.1648298-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/sysprof: fix build on 32-bit x86
 with AVX2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Oct 19, 2026 at 03:57:21PM +0200, Yegor Yefremov wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The bundled CRoaring code enables its x64 specific code paths as soon
> as __AVX2__ (or __POPCNT__ and __SSE4_2__) is defined, which also
> happens on 32-bit x86 targets such as i686 with BR2_x86_haswell. This
> results in calls to 64-bit only intrinsics:
> 
>   roaring.h:260:18: error: implicit declaration of function '_mm_popcnt_u64'; did you mean '_mm_popcnt_u32'? [-Wimplicit-function-declaration]
> 
> Backport the upstream patch that defines DISABLE_X64 when building
> for 32-bit x86, so that the portable implementation is used instead.
> 
> This issue has been present since commit 0d57555407 ("package/sysprof:
> update to version 46.0"), which switched to the new sysprof code base
> bundling CRoaring in contrib/eggbitset. It therefore affects 2024.08
> and later.
> 
> Fixes:
> https://autobuild.buildroot.org/results/f00d523aa13923c9eb73ae4e1b1f04f297512351
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

I've added a proper Fixes: tag pointing to the commit that first
caused the issue, and applied to master. Thanks!

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
