Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B8DC982D0
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 508796061D;
	Wed, 16 Sep 2026 20:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4yN7KDBhl6C; Wed, 16 Sep 2026 20:35:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 32E0B6062D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789590928;
	b=KCCSxa/hG7qocOtF/VCejD5mLJWHfFPvrFSb7FClOnxrstoHCHch9Sn4tDL6ENEiOE8k
	 TRlEja9nA4L542K5Qgw0SLKrgAkwAIpxOOhtDYKqpa4fjikIWhD9t6J623fY471wDCRhq
	 BjfytthZgByahXNZchmzLDdI92M+Lu5J/6b6ISNQ049vY2VguJBFiC4Uz1RInJmdXabza
	 kT+5W9KW1zlOQGqYCAGoPhTqzqKC7eyaon7GCpW+PvIqa90e7o7iXzwvqAC+3tTfO1qm6
	 g8i6bXnhKiTGuuNhr/nevRaSW1t3SIpjzACvn/mGhiDd2AV99a1PVNRz7fr5bLO2Z8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789590928;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CI3FC8MZRWGy7V1nFZB6JWT1zxHIN7dvBEeuoGR9Vhc=;
	b=RpA6r+if3avy7/ihhD63iwgTxwKnGBHxgf89KA+7QC2+tyo8GHhMp9HT8z1rqx5qKlWm
	 W0VnWBVu4m4XTk+4jkx8XfipNR9f/Kf1M2ngXZsjNVzbuouU+hPY+3d4U6AsyMg3dJXYm
	 14B9hhRwBzuX/HNu/O6Q3ufR2oooQ9KFJ5MRCE9JzM0bDhifwtVRiF4BobxK7ph8cVjH6
	 yl3OXYmoJPrjKKfN288ZVIzREZcVsmc0i9Ukvcko4/1oS5aqjAwcOh6hovsZsSFJppw8X
	 vrkxsHLyI71cPxgre1L0qh9+BkCNX3ukn6bhie0V0IZBPa8xUw7oNnZy7Z1P9VE5iXw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789590928;
	bh=CI3FC8MZRWGy7V1nFZB6JWT1zxHIN7dvBEeuoGR9Vhc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hVVqBYbVpttksevlbtw3fvI1KDr4GSAh6z/XuQrpoIvLCY/kn3KCbi0VaVTt2Rc3N
	 1nuVHt7wuM/VEuMIUBxGXhCxaYlRTXaaoxyupsl/l7/WJkIAhndZAAijYm+nYK5Nnz
	 VHZddm0yg3SiqxJmgx+aTvWs1TR1PoSBSaJ33gpwiwph0PojeRYSFiYXbd4jf1fVcb
	 gNCrceTCOkEVs6BtNG5DNLI21/jq+dRnOWP1S2/Vd37hk4+hCBwfMwRsAVb+54v/8p
	 blpAtGMM3CxZJiw3nUfEJIBgpIE2l3Rjn7kXcU9O8lmv9hqJ3Q9dXJ+WdTXpazSRDY
	 5PLB9PyndEK3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32E0B6062D;
	Wed, 16 Sep 2026 20:35:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E1B4388
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E69DB80E35
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDv8a13OI68V for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:35:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 708F380C0D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789590925;
 b=Hzr+UbBrhPqhpFWmyayreJLINDtZizV5E58UHVlhselRWwbje1+4NlWVCFr0joNKrD2n
 GyBQ1iaO0toEfELfi7t0KsJX80+xixIdBWZSJP5VWrZKemeDGSnC0+KEaviIXt1xu9tV5
 kzZdCYHEQ9XxiyS1+JpkB33JoF0L96auk1GTwoNYJ7gIKpkPZxptIuM4XPBuK/zvcqikx
 nASJyxoQGpmTOG5r8TuFxT/LOlWkFqVA/hGSlpLEhBATY9ovBvAAClpraMaOU5O1HnhP0
 iV13uXGcDjuw78uDcxLcrXExMj2T5vy1cOH0pjQEfcCqkF5lK8vpzjSnxf/KKyYygGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789590925;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=vbkGsFh1YKen7xlrEaRxujDZuFNVLIwFckv/QynccqQ=;
 b=gTKJQlI+nt/+HJLhNTnqBvPTFDowCxbT1f6Cqg76oIyBod3e+ds43oOwpomJFQzp5DTK
 UdrEUKAN3NVJW/RVL00sR1WAR1kserFt8FO/tNKAXjcifK3wmeYXIDRu/sYbmTEKlmmpM
 NME/JKpdkj6B0eehVriGCjYYiZt86W0GXSIiTEIHJC6LOP+kNqJOw2pAbdRdfMJ+tHnKr
 SrvgrHYFBPGR/OoE4nmPd7+YODpgXF65U3khBQpRO9bXggkbkT7WgfHOTuUlM9DPJ6mM2
 t4tcrBzckLp3+Cduiyl/BHmlvM8YBoS7H/D9miLJhVhIsPM2Hp1WwIAHdnbRLYusN8w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ag4zqomT; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 708F380C0D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:35:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 45F444E40754;
 Wed, 16 Sep 2026 20:35:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0462160337;
 Wed, 16 Sep 2026 20:35:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D2A1111C7B00D; 
 Wed, 16 Sep 2026 22:35:14 +0200 (CEST)
Date: Wed, 16 Sep 2026 22:35:13 +0200
To: Philippe Proulx <eeppeliteloop@gmail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Message-ID: <aqr9YjH8PW0Xc_UJ@windsurf>
References: <20260909081345.3114385-1-bernd@kuhls.net>
 <20260909081345.3114385-3-bernd@kuhls.net>
 <aqrpq30jh80sswHi@windsurf>
 <CAB4xu_2iabS+DTc8bah_bssPhx9QtEBTFPhvDbWcecmOLcaVeg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB4xu_2iabS+DTc8bah_bssPhx9QtEBTFPhvDbWcecmOLcaVeg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/4] package/lttng-tools: bump version to
 2.16.0
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

Hello Philippe,

On Wed, Sep 16, 2026 at 03:57:14PM -0400, Philippe Proulx wrote:

> Actually this was five years ago; in the meantime, we've had
> `--disable-tests` available since commit 6ba949601 ("common: Provide
> --disable-tests configuration option"), included in both v2.15 and
> v2.16.
> 
> Kienan wrote the patch to be able to build LTTng-tools on a system that
> doesn't have libbabeltrace2 (tests need that now). So it wasn't written
> with your use case in mind, but `--disable-tests` achieves the
> same thing.

Nice, thanks for the heads up!

Bernd: could you have a look and see if we can drop our patch?

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
