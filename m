Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD79BEE4997
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 20:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D46383F3C;
	Fri, 18 Aug 2023 20:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D46383F3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFxoUDdY8507; Fri, 18 Aug 2023 20:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70E8583F6B;
	Fri, 18 Aug 2023 20:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70E8583F6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CB931BF31D
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 20:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06CD04225F
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 20:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06CD04225F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Cr9L2HsgQov for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 20:44:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 808DC42250
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 20:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 808DC42250
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23DEE1BF204;
 Fri, 18 Aug 2023 20:44:30 +0000 (UTC)
Date: Fri, 18 Aug 2023 22:44:29 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230818224429.618b7dd1@windsurf>
In-Reply-To: <20230818202434.GA1134940@scaer>
References: <20230818151608.988723-1-bernd@kuhls.net>
 <20230818220314.3178c964@windsurf> <20230818202434.GA1134940@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692391470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eoqmJ72Z5ie60SftBabZnrLyfQE6YL6S+gdeafqm/QY=;
 b=nnN8OFtUJ2sVvTecCHVVpTm/V/TYo9M9MsbnwTBdJ+itvqJvXFY1tvPx65flzsSJXfjI+4
 7x4piJpGJF2fdWIZSjdnj0FYiZPauiHutOeU9JB61sDBCk9xiKYFMOn+1/Wu5Qe36l3qR6
 RQ49Ky71aQF/ZjBWYgIiS9mxO8OKLplkyMRtqvbDmu7oPt1syfpEnNQ7G3H1ah8Nxzy3vH
 Dn/9EOZiXOdGQE8c9UN2bFjjCOIqI5pz114pvQEwu05aRpnrKiW83bRA/DzZ6Te39KsQip
 tMIfWXw3XgKcbCaggGWKG3oolc7ZogJAHWjHBz3KgKFvGC9XhJxqDU9mRlzdrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nnN8OFtU
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix typo in
 make target .stamp_built
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 18 Aug 2023 22:24:34 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2023-08-18 22:03 +0200, Thomas Petazzoni via buildroot spake thusly:
> > On Fri, 18 Aug 2023 17:16:08 +0200
> > Bernd Kuhls <bernd@kuhls.net> wrote:
> >   
> > > This fix can be backported because the offending line was added in 2009.  
> 
> What is actualy broken?
> 
> As you noticed, the does has been there for moer than 14 years now, so
> if something obvious was broken, we'd have notriced by now.
> 
> So, if this is broken, it is not obvious, and we need to udnerstand how
> it is broken and why the fix is correct.

I don't think Bernd claimed anywhere that something is broken. He
claims there is a typo. I've also seen this double colon several times,
and it isn't consistent across the other similar make targets, and I
always wondered if it was needed or not. If it is not needed, we should
remove it to make this rule consistent with others. If it's needed, it
should be explained in a comment above it because it's not obvious
what's going on.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
