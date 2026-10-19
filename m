Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AF5CCF2DB
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 13:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC6D880DDF;
	Mon, 19 Oct 2026 13:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvkPppen6a5F; Mon, 19 Oct 2026 13:19:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CAAA980DB0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792415944;
	b=qYWLojldaan/Uh7x4REHTWntflzM3SmTYbTtJPTsd0ONaJY8/0uH9nhdhorIqCjYJoW9
	 WIa25bGyQp5Cz7t+Xje4TpwwTS9MSFfztc1BZzgFWpua8nggwJdLk19dRVlE2k+Kn3KPD
	 7rI+CK+sXr1MMGdRYPNeMuUktifGvwcIL96uBJ7n6b4tCyheftlcJSAAsm6oiNWaNtpjP
	 9lx/cx7nh0V7EngF9AHczQVgMyovV9JuR1a6jC3ZNpJds/dEFCr/CSdiLOMTeZ+va37rT
	 ZVMN2Ng7tR4EAc01uk6Y8ezOE3bhpu538Xtp9nKiReGr1/4hGxLu60Z4ISQV2G9836A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792415944;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DR95GUfJVUeBwj/v37rz4VWNNQTMESJZofJd2zzhALk=;
	b=byIh/zP0oFdrDcP3C5X+21G6mjFV1kcl70+45Tni7C/+XeKUNwoR4MUZoX0NWfGdQgOD
	 PdqEpjCHCN9/gqLtzKZJgm/ET63WDyYS+xuGEP52Xe0f4dvzrg+M6+wNbXWy5UdT5dq8w
	 mM2sSoXg8xY3AgpOQg1uENcqrxWv2oLcs1pj6vGmL5iXkeyg6rzcm00oPB/Ikft6y8tEo
	 NQyURe4a/ldTVcWDXcLnzZiFqVNmiKrh4hmua/y6sKDOilb4R3r/NHucfmiyhkA/reVuZ
	 +WbXUJud5i13r64M24tRPN8yX+USLMFi0LnVzpf1NgLrls0QD6Tjqdcdz9j/Kwc/x5g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792415944;
	bh=DR95GUfJVUeBwj/v37rz4VWNNQTMESJZofJd2zzhALk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S2XW1wa3zY7I0S4VNPLKp+WH6kl1dOpKiDN+l4YR/Y8+slOvC7H7KAAiWGhYu2Fnk
	 oC9icoYT0X+oF7Ogzho6dNy+6BICcn1s5t5TBb8vrQ7h74ZNkr4+J+NYIWGvS//VUZ
	 uKWqlB/FaTNgdA0DPbYShI23bz40delWcLz0Tv5M9flw/A6ITdh++vsyaNUKNZ9jlF
	 /X8fbNJK+039eRoOBJTDAI5jNfHRwAEolhaKUDKTG1XYlntJsUW6zJAwvLDnwdmSxZ
	 3K8iCiUge2pG+gqSXAbKr3zaeDaqKorMELw/ZhHKmvDeDEYLPzg8/uCJ3AGjVEPfWz
	 wdf7m1CEY/vHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAAA980DB0;
	Mon, 19 Oct 2026 13:19:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B29F9263
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98C4E80DB0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UeCijzpq99IE for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 13:19:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C41C280DA7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792415943;
 b=oZvtiGxch8UuBEcQP08zkXTTKa5LlngeJ7CiHIqgaiNeW8D9EDp8bgFtzqpmmYORxkj0
 xidlkqVvG+oJLzgTCBUf2JZthpnc8/G83T/u5cqQ5lonWpXlCUaSryXY/9iL0C92zS896
 lgM5nc9JAFVJDoWlxMcIoNbIDPYY38jIoq4qBylWXppOpVpOdpuk+0zFHYnyGA1x9Fsz5
 JDmjEuTUoH7d00lOFdAgvsfuQPiepgqiwDvjupkSEUSk3OqZdK0qNotSXN8VScEnJetJk
 cWsDnoyuilyWmNf2pEXueHQm/UOdz9iEiwVSgUgLrosVVCdHbpXx0JXBgRAjXZY4ifQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792415943;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=VwYS7p7ImvUNv7hty9KD3w8PMeUbIA91Eth57m4HAaY=;
 b=md8icvvqCB1LBY6+mImmizE2XAR9LckOZOqP0eJgoWAuQ6Jzxgsq0rnMRMUQDsNY5F0z
 8fwQmxAuq4BHxn6KxYmrStHCfVTw2Y/OUXG7PM+nvNFOXY4hertv0QZWtpwTZ7bRmAq88
 Tv0lJmcFoiK2KPSp4yCYCqIwuXbPGumzN/l2PubmZEnjRTGE1cB0GXl47ajBdhVhQDrZU
 6dPyl7GUMKbDiZqNmJ1MHm1uNUkjriKZXpoiq+eF6v9ADv4s128pxvCsT1cfYdfmxdNnH
 Xzo5cIgu6KHVs7lO0uFsIvoAi9dKY2j1NsJ+lAcNfu4EsevDhwJivShOX9TrJis+y5w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UAW5lnzz; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C41C280DA7
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:19:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 90D49C653EB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:19:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7B66D60582;
 Mon, 19 Oct 2026 13:19:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5263910328BE3; 
 Mon, 19 Oct 2026 15:18:55 +0200 (CEST)
Date: Mon, 19 Oct 2026 15:18:54 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <atYYdzAgrAqrlJOw@windsurf>
References: <20261019123133.1631472-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019123133.1631472-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/sysprof: fix build on 32-bit x86
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

On Mon, Oct 19, 2026 at 02:31:33PM +0200, Yegor Yefremov via buildroot wrote:
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
> Fixes:
> https://autobuild.buildroot.org/results/f00d523aa13923c9eb73ae4e1b1f04f297512351
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Same request as usual: could you please indicate which Buildroot
commit introduced the issue, so that our LTS maintainers have an easy
way of figuring out whether or not this fix needs to be backported to
our stable branches?

If you could make sure to perform this investigation and include the
results in your commit message for all fixes, it would be really nice!

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
