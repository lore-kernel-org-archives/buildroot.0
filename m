Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3977C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 09:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C80D4048B;
	Wed, 27 Dec 2023 09:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C80D4048B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTpw6ltBFa6l; Wed, 27 Dec 2023 09:30:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5135F40A92;
	Wed, 27 Dec 2023 09:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5135F40A92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F36F11BF5DF
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 09:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9222540A92
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 09:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9222540A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pud4P79pGyo8 for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 09:30:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E59BC4048B
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 09:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E59BC4048B
Received: by mail.gandi.net (Postfix) with ESMTPSA id E916AC000C;
 Wed, 27 Dec 2023 09:30:10 +0000 (UTC)
Date: Wed, 27 Dec 2023 10:30:09 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231227103009.65bb50bb@windsurf>
In-Reply-To: <cb4f8256-50a9-4ddd-9bcd-3075ebb0d42e@benettiengineering.com>
References: <20231202015123.2609353-1-giulio.benetti@benettiengineering.com>
 <20231224121121.401724a3@windsurf>
 <cb4f8256-50a9-4ddd-9bcd-3075ebb0d42e@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703669411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GikmbSde1bUIyulANsFzxDw21uOIF09TMJGEkPDVjpw=;
 b=JVBt6Rf2nbL8BraGyVXNfePBvqLZjaeZZJgN+oXceAahtmPXwQVHh9uD2t+aeOWKQQLOo+
 CQkcNAGkHatl1DgSknj0N2UFsJiXtTYy8ortkdsZ1XY01xPa3yLN038Y5KOJWS8fhtKnmk
 FExTJPcQQ1S2S7/PH1Y/BVMMEs0HLpwvJnP3MW56Y7JLS+e904a1umZUeKhZXD4lqwEuFS
 +N0NpixdsVJFip4+3sDmu1jfIHE16CmS9WUIIErx5zygbGSeU6uJZ5bWzW+tcabDf/0byK
 rWB5PE9U1jFSMDkEfGR6OCRzHMzoi8X7UH77IKXbbOY8tbt/GIpQaiwcGc18DA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JVBt6Rf2
Subject: Re: [Buildroot] [PATCH] package/swugenerator: add missing
 dependencies
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Tue, 26 Dec 2023 22:28:01 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > Could you clarify whether these are runtime dependencies? If there are
> > build time dependencies, do we see build failures in the autobuilders?  
> 
> I haven't thought about it. They are runtime dependencies, so we can't
> see failure in the autobuilders.

OK. Then ideally they should be identified as such so we don't forget
in the future :)

> >> +HOST_SWUGENERATOR_DEPENDENCIES = host-gzip host-openssl host-python-libconf  
> > 
> > In your commit log, you mention host-zstd being needed, but you don't
> > add it to the dependencies here. Could you clarify this as well?  
> 
> Ah right, I simply need to add host-zstd because swugenerator can use
> gzip or zstd at runtime.

So how to we handle this? We put only one of the two (which one?) or
both?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
