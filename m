Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFB5606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XEAdv/so
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6E7D80D3E;
	Thu, 22 Oct 2026 21:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFNWTd5i0Pgj; Thu, 22 Oct 2026 21:20:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 79B7C80D49
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704032;
	b=MYORsUmpFbPeAGuqSkCA1kg0AzKPfR9AotXeuzlXG0/4sWbR9egnsZuKVjp6UTT+qZT+
	 lBj9To7peO0EcUOQsnTxjobAfXcUGB24q0Csd/9JZlJqGWZWQ6SZ2+NIjeQGnUGPhCykz
	 GoLj/E2j7uj8W+qLLeAfpZCeS1g5Q4Abd3IWmoXMWxAlQss6ydsQEw1dFXOKSrQh5oPQs
	 CX99lmJpmNS5MHxrdcvoeBAXAHHC7YZD34bsVKMSgbjSRJehoOtVeOBymixNKAlgtBuq2
	 4a7qyTq7AbzyFiy2NPwiLHoJLmZ19odXnR8oMwdtg6cCHp6xib7eD0GRyR1cNyJJH3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704032;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=blZy4+OIjF5CyboLTd6k2KRs5j2qqONKDxngl1F5lFY=;
	b=VM4IfoEye8LDYuEumMguFFeEpXjN7XwqjyfO6pB6fW/vV7cnzd4Of+Af0+6zqRamdSDk
	 a+DGcOJYw1+ivPCSQUMtbv6m1n6pk/HcxscfLNFPBAC2dsn4/m1j+RI8YASitc5fvTJdE
	 3ysRxETJEvVo4lt8p+0dIBHT339vhLt89pm9c1tissqN+LVJVjD+TrM+TR5qNdfizx6j2
	 rspJha5HwLgcklDVaVw/ZGITGTxSK0MpO9r5cRIQKc3j2Vx974vYsdNupij+UJBWAC5+n
	 teQ83vGRQLxztBuIplrLvgTaJwe8FMw4qJzJLB2VNKtqVGMdgqwifnYryR8JF+EHjjA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704032;
	bh=blZy4+OIjF5CyboLTd6k2KRs5j2qqONKDxngl1F5lFY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XEAdv/so4XrGmTtd8adYZAM1HoNXxE5TQVRPfgF8epcGdEetFsD0EzKkSqCN3RGrp
	 ijzxHPWhaKJj0nzvut0FDI55D/YsI46LOFzaJo4DlDSkhbh3ymGkcvBPlyIBVlcnM4
	 v87WD3+rS8I3XkYRXWViN7jdce0j71ITfmlJVnpiYkw+NA01CeKYHQiFKgYMMMtw3M
	 J83O3DjWSQMn6GFaGOc7HMsJX/IuA2n/KpSsyp367o8pCA3qTOhlMp9xTW1KZwhZEY
	 Sea/rq8P9M7jujtI73xstydnNvd2USkB5qudVbPa3LL3TH0Y3UsAYSfkKGnaTnY/8G
	 dt6nctkcRMIQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79B7C80D49;
	Thu, 22 Oct 2026 21:20:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 328B3356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1906E40270
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VI6BjRLkbXGc for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:20:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AE348401D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704030;
 b=mPbV0krqUFj1jAovlymOu2NPJNoJGWu6lgo4SIqy+cV5cRo4OZHwozo8LaKGBBq7j/wq
 uu+oPsLS5gDf0J30X7KRTV+s8ZfT5xRwfgBRX5jJY2tmD9r0b2lIsxXjQtrs2FIWDNrQ0
 iG0RN3QyoM/HZGHvPJjpCscoOVbGBbqdY+QWE18VFxi+FJSIHjM6W3rsdG9HYlF54mVhd
 BLT3yDFHyJYOHn9exgfpaLPrBfzXpgV1WLjBdZeT8GrATgIHtLnL7tDX6QadP1KPXYlWl
 myzm24WiHutAEgmz/kBwdbLiWdxAApKArFurzg/uq9+mS+nZIScJDvCpSncXLZpU7vw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704030;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=uYkX7A3NhEBOrH3o/nhB6h0olibTAFwnjtevro0BHyU=;
 b=ZuYHGQL2SsbGKgf1gmxOsqCaM7n1Gn3rRkh7dst7h9W30CLNUHML+LFYKDeRU5CJQeXU
 h+FsDN+RV0ULt5yTalRuoGmso1FIBGG/cxUcw74LDBvAVH0viRMtA7vPDn7IRTyZc3QFI
 oFa3bRTTZXQBZ8jABkxTQD9N8DYAL8/p4BacXo/UajQQ7eSREcm4ycGwfB1pCDJYNyu6b
 wkjEOdsTWjnTWabJ11YkD/EHSKurPK44+IETP3GYby8BaKzvNlVMGswgAW0/vfzbwZr/q
 5dN9jK9nurpTvxUhHY3k/ipTVwi459KvXD9qXPd6MGje4ZnpoaAITidVj47f9SuhDUA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hCGFRX6d; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE348401D0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:20:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 68E421A12DD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:20:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2F24060763;
 Thu, 22 Oct 2026 21:20:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E5DEB103281B0; 
 Thu, 22 Oct 2026 23:20:21 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:20:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Mikhail Boiko <mikhailboiko85@gmail.com>
Message-ID: <atp-ERAZ5s_-kJFs@windsurf>
References: <20261022204056.2236446-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022204056.2236446-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/libfribidi: bump version to
 1.0.17
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:40:56PM +0200, Bernd Kuhls wrote:
> https://github.com/fribidi/fribidi/releases/tag/v1.0.17
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Updated license hash due to upstream commit
> https://github.com/fribidi/fribidi/commit/5d829288e00b9dd709c8050f469ad0b2737f822c
> 
> Switched build system to meson to avoid fixing autoconf-related build
> errors which would be introduced by this bump. Even after adding
> upstream commit
> https://github.com/fribidi/fribidi/commit/1d42f35e26f7ee4cde23a4103ace0f9f4f86a1aa
> the build is still broken:
> 
> cp: './fribidi.1' and 'fribidi.1' are the same file
> make[4]: *** [Makefile:834: fribidi.1] Error 1
> make[3]: *** [Makefile:507: all-recursive] Error 1
> make[2]: *** [Makefile:416: all] Error 2
> 
> We would not only need to add autoreconf but also a _POST_EXTRACT_HOOKS
> entry to remove bin/fribidi.1 from the extracted tarball.
> 
> Instead of fixing these errors we switch the build system to meson which
> is supported upstream since version 1.0.2:
> https://github.com/fribidi/fribidi/blob/master/NEWS#L117
> when it was added in 2018 by commit
> https://github.com/fribidi/fribidi/commit/a991b009b11fb791a9217af23659b092eb45377e
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
