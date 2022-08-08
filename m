Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E034BC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 10:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DD1D40993;
	Mon,  8 Aug 2022 10:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DD1D40993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDe0P2T-eLPN; Mon,  8 Aug 2022 10:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A938F4070F;
	Mon,  8 Aug 2022 10:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A938F4070F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B73F11BF36D
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 10:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90CE941497
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 10:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90CE941497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZe6skntrx6c for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 10:47:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED9C04136B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED9C04136B
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 10:47:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AA5761C0007;
 Mon,  8 Aug 2022 10:47:09 +0000 (UTC)
Date: Mon, 8 Aug 2022 12:47:08 +0200
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Message-ID: <20220808124708.552b9d02@windsurf>
In-Reply-To: <2e49d072-ab0a-4e7e-1d39-9844e98bf560@othermo.de>
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
 <35ea7a5d-e0b4-d98e-ca1d-716de2d25698@othermo.de>
 <20220808121723.7d0d2bcb@windsurf>
 <2e49d072-ab0a-4e7e-1d39-9844e98bf560@othermo.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659955630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SbgDwXg1iEhuxJ0CqCoBhLuEiTpXRIAnZldYwnQGeDQ=;
 b=lGX4iknzTYDX+cMPct3fCRBqOjnEsIoaD5UQxg9mJHdD6bo5k8YZpH0EanILggVMjvmdSj
 OUt0RWgnUnphcJTwM5MGBjdx+FnKrL6DMmLpZ/3kh2ZZWxjp6LhT1xMwrR/56x/ICewEhH
 UgWtE2VFrX0z8fRTefK+hbwhnk3/aRGyorvEQZgAl1mdxJN44NyiWKMF0OXsia5/pCQAau
 b6zgCONvKnx3kyy2gjUgt/HWTZPGzumI24yiGSEDa9EwbGHSrcJ2O9i3HFfV/9ngPhaWBH
 JPJIvpry6zfQukfGxCFci5fN4YhcG506SG/E3kmlt4GppyzpaOEjatycxxOz/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lGX4iknz
Subject: Re: [Buildroot] Python pyc only and problem with scripts
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

On Mon, 8 Aug 2022 12:30:10 +0200
Marcus Hoffmann <marcus.hoffmann@othermo.de> wrote:

> Sorry, I hadn't really gotten around to properly reporting but here's 
> some details:
> 
> https://github.com/pypa/pip/blob/main/src/pip/_vendor/pep517/in_process/__init__.py#L13 
> returns the path to the .py file in question and is called by
> 
> https://github.com/pypa/pip/blob/1880f4a58b4e4ed577a6337d666767784f6831d5/src/pip/_vendor/pep517/wrappers.py#L320-L326 
> via the subprocess call.
> 
> Why they are doing that, I couldn't figure out in the time I spent 
> looking at this.
> 
> This is happening for us when we `pip install` an internal package that 
> uses flit[1] as it's pep517 build backend.
> 
> [1]: https://github.com/pypa/flit

Ah, but you're doing "pip install" on the target?

Without saying it's not supported in Buildroot, it's not really the
recommended way of doing things: we encourage to create proper
Buildroot packages for Python modules.

Of course, since we support installing pip on the target, ideally this
should also work, but I'm not too surprised it can be broken for some
packages as I'm not sure many people use "pip install" on the target in
a Buildroot context.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
