Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442E3CA0EFD
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 16:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0AE4400D6;
	Fri, 30 Aug 2024 16:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmiolsrCgDye; Fri, 30 Aug 2024 16:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9988C40118
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9988C40118;
	Fri, 30 Aug 2024 16:52:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FE1F1BF35F
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BA838454A
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAkoPD6k9ILQ for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 16:52:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 370CF84547
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 370CF84547
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 370CF84547
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 16:52:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FA411C0003;
 Fri, 30 Aug 2024 16:52:46 +0000 (UTC)
Date: Fri, 30 Aug 2024 18:52:46 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240830185246.44cef05d@windsurf>
In-Reply-To: <CABGWkvrm1TV6+RXPwEynvt=17BhaHcofjBg-8bvRL-JpS96bcA@mail.gmail.com>
References: <20240824141616.3139902-1-dario.binacchi@amarulasolutions.com>
 <20240826184512.12aca28f@windsurf>
 <CABGWkvrm1TV6+RXPwEynvt=17BhaHcofjBg-8bvRL-JpS96bcA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725036767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhzaS2tt9aDPITWZdxp/XAxNxwv3SLRlYT1auk+x/mU=;
 b=Hkn9zS9vFIE4uOHCVBCY6/6LRGRJsSa2M8jQBMD27eaXfeyyi+PzFbmBS2k4Eciw+70Dd7
 MG0Mz8vCul297i55Kwie+gOqwYy0THWDfOJ96xjPsx0MPO6k6/ZCNUCB5FPxdCu6z+dJFi
 6xQXw4SJL0xMXJ12mT57GeAid2Fq5lWnYHeEdkmEF2aA9wyz8/NEpLdq2d9b64+Rs/H2P5
 4lqQQpQehUUA/BkqqEUmBD2tx0dfRhh35jgECaXXjWl64ReQpeyDx0PpmVXmNVBNLLuY+2
 qGnUqIXY8YiNbl+q8Wr5513TT0T63wU3ek0KbY5TVZ3gtOW1tXGjKnqwp3pSvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hkn9zS9v
Subject: Re: [Buildroot] [PATCH 1/1] package/babeld: bump to version 1.10
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

Hello,

On Tue, 27 Aug 2024 08:28:43 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> This is the response from Juliusz Chroboczek, one of the maintainers of
> the project:
> 
> -----------------------------------------------------------------------------------------------------
> 1.9.2 was released in April 2020, it's over four years old.  Some features
> were removed in 1.13, but there's really no reason to run anything older
> than 1.12.2.
> 
> > What happened to it?  
> 
> It's been moved into the archive directory:
> 
>   https://www.irif.fr/~jch/software/files/old/

Please reply to him that moving files around breaks things for build
systems and Linux distributions. It is _really_ not nice.

> So at this point, I can change the official repository from which to download
> version 1.9.2 and then proceed with a version bump.

Yes, use the Github repo, at least it's stable.

Another option is to drop the package entirely. It was added by Maxime
Hadjinlian back in 2016, and Maxime is no longer using Buildroot. The
last bump was done by Sergio Prado in 2020, and nobody touched the
package since then, despite an active upstream. Nobody is associated to
it in the DEVELOPERS file.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
