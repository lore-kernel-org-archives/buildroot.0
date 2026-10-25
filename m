Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C97E606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PHSw5Vfz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEE15405FF;
	Sun, 25 Oct 2026 20:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1mF0e00ZV30; Sun, 25 Oct 2026 20:53:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2143F405F5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961580;
	b=iA8VHeKt7mJHXXP6xXagWJhfZ23okk+sRVhiQuLbylmZwciaXaQ33/1i8Sl2NL6JOMK7
	 wMfCvcyioyV0EDmA96U8YufYZBOcManx6h/fGnK0sU97+2VCph2k2giVos/uwnM8Tge3b
	 tACh2OlBiXlaPNoRMnZOjkuhjJtU90EuaW/ab0xqERJ9p/cnQjsnLYk6fNLfYokDHKY1O
	 kGp8wBVSRwirJCR9DEZ0Gpq84b9girA5aLihKX+kuc1980k5S65OIRjbtE8TnGKFw76Ya
	 dUgymH5dP3jkaWdqDHaWMX2yjDevLfVs17CeMgIBExRlkcU3eic/yY4QV5O2qty4nAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9od81cKL7mscpQbjr+3Z4j36xvsFv6FGOrBV9vvmRLA=;
	b=VhiXb8pPsRwXZz+na24QJe/Rlb0tI4VCm3Jq94EzfXCxLWjfjKXsUAb86A8f5aqpNtBf
	 8VGleuF+lcobPnz9ZhNlTNbSt5kdPFDhWEukewdbnmxFd2Y/pyw9hm3yhu9+u8Oxo82jw
	 kNhNoq+5uoLf5CVUZD5t9uhOlg2HPTXHeic2ClenPo5QPBHzVRtSFEpIEk5vMLGubj4DS
	 0rlhvm8QIE/Z37u3+XKvp1JUOmhQMJ25PKymIBuIVhR0SbdHEWbNvbPlfq4wa2tzInHKI
	 tSsFwWxwmpPM2LALmWP1eORKQVZyStzNRElsa8ERp+x/C1crRPhU9H2D3lqt5WD/ktg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961580;
	bh=9od81cKL7mscpQbjr+3Z4j36xvsFv6FGOrBV9vvmRLA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PHSw5Vfz5dIvJzzujRHUglOEPW3NJLKrNQGNbGXWjEZVZA5+SUVVy5zTSBF2ppxvd
	 BHU5S7vbFvm3x0KO/b1cUxyrIjdnSqWHwlR5MxG+WvySUo6f14xPrVeiloGuXL9s0z
	 /dn9k1wnNsqHl0ilc7x//ip2LuRWtcH8XxnObQC+b8+rfi8OylPrHw+LrUpx3wsRwv
	 Tpzlla1SHn5anmDRl/0RDktv3XD2UQsghqSu9vUS3NsEfGaje4/WoHqmh4xEB/tOwf
	 TSB1M/TEaLaltuOjMXWQ0cevFCpIwq1M4opGxs/u7bJYiEjJ1YZvCCB1YYeMobAyrP
	 7LDw/7r6f3dnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2143F405F5;
	Sun, 25 Oct 2026 20:53:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57383380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49357405F5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5aNXtOn4l5r9 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:52:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4D4C2405F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961577;
 b=BjlF1kynK/Glll5MVbdR46FvMd9jXVl7jF58/aqAYfml+DZSnVd4P8SeDxKRGyuiqTlo
 qe+Y+yEQ805UfaMBx8N3oDh+pLnamSBvL/kvfZ8+A3BN9EJ4jc6DzuygKANcVf/7AFTR6
 NE51mtSi5+YAmpL2P2RfanWixVJNsGkT1FpmThm/DXUDkZdQar6wlTP3kGwkfwS4mUYbM
 qFb+hH8K7fbu4WcR1dV4YrdGcHrdEqUr1vOXMQbVBubpJ4TE1p9+npV1Y1hgrHbG3dbW3
 dentcyP+DuLW+bLzb60FENpkDNwWT7sKZpHsbTs9O092RJ/x7ZjK91La/an/MAqZsTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961577;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Op8o5kOUYKPA9Kp4mpVo4ke0iGoch2TgI36ujTqidko=;
 b=oKdK92wBjlRVDIPKZsy8gCO8+AgOewUYheh47vjTu2TLRvN5fJ8k7oTR4u0PLNFywmtk
 xGpEjG3sgbPnP2PKj92zTeU9p8BB675eCExutuNBSvut/hXbNWYVfOsB00a3jWXq+D4Kt
 G8appwBNWU9nNAQ0MWe/oUnFZ8AC/ZzzIbWRkgUDbIhPsS1BbEgvcTJAw4cic/XrA8KvJ
 GRKCqmK6APVb/f2wlWlFdFHmwvpUv7Aw/AtPJ/I3gGrxv4YfIuFkusgNDDdqWWXXmpprS
 mOnO6yrvNcy1QMRKetzbvcMd32aUcukkyeHm83m8cl+LJr6Lj93yrATJ6wJL17tsxEg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ni5whbGX; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D4C2405F4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:52:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 491C34E41308
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:52:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 17C4B60740;
 Sun, 25 Oct 2026 20:52:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 71D3310328E76; Sun, 25 Oct 2026 21:52:54 +0100 (CET)
Date: Sun, 25 Oct 2026 21:52:53 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <at5sIIWcxy_2O2mc@windsurf>
References: <20261024161704.4144810-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024161704.4144810-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/ebtables: fix arm64 build with
 kernel headers >= 7.3
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 06:17:04PM +0200, Yegor Yefremov via buildroot wrote:
> With kernel headers 7.3, ebtables fails to build on arm64:
> 
>   [...]/sysroot/usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
> 
> Linux 7.3 changed arm64's asm/sigcontext.h to use the __u128 type from
> linux/types.h. ebtables bundles an old copy of linux/types.h, lacking
> __u128, which shadows the one from the kernel headers.
> 
> Backport the upstream commit dropping the bundled copy. ebtables only
> needs __be16 and __be32 from it, which all supported kernel headers
> provide.
> 
> This issue has been present since commit b216661a73f7
> ("{toolchain, linux-headers}: add support for 7.3 headers"), which made
> 7.3 the latest kernel headers version. It only affects master, no
> release or maintenance branch has 7.3 headers.
> 
> Fixes: b216661a73f7b8e21290a1bc9033e7f9b5fb230e ("{toolchain, linux-headers}: add support for 7.3 headers")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

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
