Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E09C0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 22:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6F5541EB4;
	Fri, 11 Aug 2023 22:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F5541EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PzeQ40DXzBuy; Fri, 11 Aug 2023 22:27:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C814741E82;
	Fri, 11 Aug 2023 22:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C814741E82
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90F1F1BF5F6
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A74C402D4
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A74C402D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f5YDEKw45Qrl for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 22:27:14 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31F244027F
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 22:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31F244027F
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE15A1C0002;
 Fri, 11 Aug 2023 22:27:10 +0000 (UTC)
Date: Sat, 12 Aug 2023 00:27:09 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230812002709.20986967@windsurf>
In-Reply-To: <03e35eba-6a35-f185-2d32-b7eab93beb05@mind.be>
References: <20230806121729.3552502-1-drinkcat@google.com>
 <20230806153308.4c0cf791@windsurf>
 <CAHRZCZXdNk2w2965JOubzue=_+i+8DU1YvVvwUKv5PrsKeVMOA@mail.gmail.com>
 <03e35eba-6a35-f185-2d32-b7eab93beb05@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691792831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xNkpQ5lIfcUqlC6JPxWQ9u6Wym0iRRX65dotQqohkE4=;
 b=l1O9BRGQow0Dbhj8WOG5l1+K6dA7KugDN/ih6skT4cLBxiW2dgQWwIg827tu+bC1HIC6+A
 D3WAGY0FMbMKqUVvx26PLoSVoWrnZcUL0qlaD2DCJq2Wxr02gCA236sqSVISOgfwui5uMC
 /V3qi8QvuQFUw3R4fiAMPxbnt8wOhk1ZN3Ufg3/NOGLh03sGSRanyBgEbvsPwuXHnh1FmE
 EuZihhPN+QKWK0PPXReV7AFUHiJDAZZ/ZPik3GBGzI1Jl0ZEeRIQ+RXDydA/spy7JtTl8p
 TedofZJh3zrStTizvYxza9MZnLpW6UJaKUEfKfF64+pnqAuBySvpf8C0TMabHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l1O9BRGQ
Subject: Re: [Buildroot] [PATCH 1/1] package/screenfetch: Add mawk/gawk
 dependency, and upstream detection patch.
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
Cc: Nicolas Boichat <drinkcat@google.com>,
 Nicolas Boichat via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Aug 2023 22:18:15 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > I had a quick try, and yes, I think busybox's awk is good enough.  
> 
>   We assume that "normal tools" are available in the rootfs and don't add 
> explicit selects for them. Normal tools include sed, sort, grep, and IMHO also 
> awk. So I don't think there's a need for this at all.
> 
>   And anyway, the presence of busybox doesn't guarantee at all that awk is 
> present, because you can configure it out.
> 
>   So I'd keep the patch, but not the rest of this commit.

That's a good point indeed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
