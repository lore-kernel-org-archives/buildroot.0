Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D12CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 21:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CD8B61B90;
	Fri, 29 May 2026 21:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4Nyz5zlKNsH; Fri, 29 May 2026 21:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3A4061B86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780091642;
	bh=0AdRvKd8MuJ7ym7VfzBd5pXsAaKoiuzfKuqauUo+WD8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EcSWcUBOMguBC/Us4HiY54gL1fGAIzDBa/dYb15i62yIEoOOPKmR7i2UpLNASr9AX
	 mCqL8FddkHeFE2BWN2SXB5NndJoyzmB5RKz3NENmUExh4NPGuoEY7a9UhlUVdkI5Rh
	 B1EoMuSWrM8COXXvKxuzrN+6VHEyG7GfvlKH8lty4tPqgZM5ZRlA3VbHph1aGJvLxW
	 TnMuX4KQ7FeQriVrWGlDAWbAGUe10WLcnUpEidC1yUdr4Lp/+a54MeepZlyaXTIetW
	 CbeBC2DgjnxAnSDJ/+lH3AkyHVA+nXRP1+IahVhXjGBLPmk+q9l+ZG/CznvtaEKWs7
	 1ah7Vp2Mhmbgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3A4061B86;
	Fri, 29 May 2026 21:54:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD97AF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EA1584AD8
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPE1C6fGbtLU for <buildroot@buildroot.org>;
 Fri, 29 May 2026 21:54:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A82E284ACC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A82E284ACC
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A82E284ACC
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:53:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EE2BAC62464;
 Fri, 29 May 2026 21:53:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 10B83601FA;
 Fri, 29 May 2026 21:53:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8470910888650; 
 Fri, 29 May 2026 23:53:56 +0200 (CEST)
Date: Fri, 29 May 2026 23:53:56 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <ahoK5_5H4gymLIQb@windsurf>
References: <20260418155515.9980-1-chakrabortyshubham66@gmail.com>
 <20260418155515.9980-2-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260418155515.9980-2-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780091636; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=ZYgIFE62Cqs7DrYEhjQSux6P0vv6bVlO3e9CXkjK6aQ=;
 b=nY8uwpZT+2WRDH/SMhYY+Zv9YHEF36DpM8YyawtSsLRQ1C/t9JFxcdDLPSqvxnh+vylzOY
 79h77YBhiahXmMj1/DPPBzb4UzC5jSXWEqlorGP+5jmJhdtgMcj3QLUzIJClzuhRe5QkqI
 mhzrssN7mFm/t2obQirw7NcSRBqH6hy9jZvZltCvbScRPOwrFHO3EnZsRECNIuIMnKwADL
 zmc5DSGvdDsmH4GNkOiT9mt+HhVHo5FE5/03q7Lzho6sOx0RJ4t9997Esi67DwU178xr/G
 PfvZ8bIqvUsO3JXOC3/RW2LJb2dTdtop8b/9fUkBY1d0EuvvdCCoay7TStDYWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=nY8uwpZT
Subject: Re: [Buildroot] [PATCH 2/3] DEVELOPERS: add Shubham Chakraborty for
 libenca
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

On Sat, Apr 18, 2026 at 09:25:11PM +0530, Shubham Chakraborty wrote:
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to next!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
