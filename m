Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1CD606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bI4iAhGG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CBE96075E;
	Tue, 27 Oct 2026 12:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ursU-SH9JIKG; Tue, 27 Oct 2026 12:41:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5522D60711
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793104888;
	b=Q2X8hnmToltIBLPVmZxLtFbLxUrDDzo3iH3vY4Z29ZhTxhGFmsJRgK+CwLU6IQepRWZP
	 T//mf02tQuwnC4bJ+7yeFUH1V7/nnLrLoOmDewnv1JJoIxWNHjeN93+/DHEjx6nLEqO8K
	 W1TRAJGh855BGf6dWDVgTyLQWBoXOFl6H6+xT4SRwFz7e4dErTniYZLqFZ/oRJtSSN33e
	 +xzKgFYwUdQLRELd2150/iDGC0YECW84qhIsqivtotUdTAZE/xM5D1NzKnDVDM06O82vi
	 srLtIhikTr/1iOKMw41OfwFPV18qn6yhfuBdmdCO0BoDuj7Gxkn4CmxqFg+y9wehiBw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793104888;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kELuinR47zFNJHkw5ZCY0udCnjBB7OMHsNWnJPx6We4=;
	b=oDyShbuF0qK6sl+yHyUuqLND+NAc5hq+DOZyQjODGk1oPkmMtkGLR59q1S3tkUvLHU2f
	 GUvmQdfJnki/lgRrYwj4FLwLBkyZPUYhF9GOewxRbMhTB7GPZsYb5Evi0O26JbN2gJCcp
	 YHeIqimo/8TKzhJq+Ynl348R/M6mi+YR4HLg+Di/M47jt+JiczygKwWjfWjxL2IboQfn7
	 QvD1Dlf1Q5iC51hpwetAfp+nH8HvbWL9PkpHUtdscb/iXeR+c3xYXP3/0cobIJAqfn0UQ
	 kpyuiw7Cr0id/9+sxFUwJEf+7kvXej1jlfhHXdCNTTQVm9y0UThIq9p+hud1kxkhHEQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793104888;
	bh=kELuinR47zFNJHkw5ZCY0udCnjBB7OMHsNWnJPx6We4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bI4iAhGGcQb9y+Abe0XBcq3m5O6Cg6byfy/aB4rr4WgS3q35yw53LXkPQJI1ugpSG
	 ATzBBkcIqyrbcm5LNLKVHDtg21+hltZ5tXiYSeVmcmaFgAYIp24U659iNAdHzwmC8F
	 aGJtWwSLtJz/R3Dk/15bsrwNCtsyeBqQ64IYNucMKVNBZppHbUyuQIbBYIYvTyaYxV
	 /6JtqSvhb/yR5vKbu17GzJ1CBnmFJm8YNfXbtlPRsMqBUdESoQO4xPdvNja3NGQ/k9
	 lYzjV1WK/fgoAhMNiW2rhkak1qe5VLOhNcHxqPv4GGndLKjKy6lkONeiUDo3/58tPC
	 nomliE9lm0FDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5522D60711;
	Tue, 27 Oct 2026 12:41:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B1EA4BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0129760711
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvgg0ZjDNQTA for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 12:41:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 458EF60708
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793104885;
 b=XVbDQMnaf6F87xDckB+V8Lc6QljlwxMBhizusZ8SGodqbj5xoUmbDxLiG00e0IeHZDvC
 xPe+BxVsUxaoScnnoTVN9DV76JXV51hzR1xd5i7ZNf3KkblCavQtl5zOHbxHi5fW+DGsE
 zKN4tBUr+9qklhEndvcw/y2Drk7jWQI+m3NSFitdbsDK1TP1P3KnvF0TMk6UWBTnx4HHl
 zaiGcDlEswLVLtjBnTKZMsWdrqN+wBYMIREVVq+xqyx9BF5XPmJBLVo4eNxglEpGn0p5w
 iYfGpCh0ZY3Juxd4mFZB0x3ShTe32sJJ4aeOP1PK/qE/A4UdUAtWaxvmiv0DONaUWnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793104885;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=s+nyXR0pDfP0CjKQQPXVi3gnr2ce3jrcDznLoPFPR4g=;
 b=i7qV2OFiH2vcDapIoiFWgdGTPOLTBUykoUFhqvlAyUc0MOfiXDSJGAJnFZIg4wT0ZoG8
 0u9gdrpCUDxIqIDJYn7owAMrUI1jH7+7y37f+x+7hQjf7h2oe7CUZnuWYNIlg8bUf0GNK
 ddFcJI43NWOMntHXU2fA9AqQitRCsROmlJuoHiW0eJcLLVYDW2Req/g/ijOF5JOfLc76I
 VLF6tcP8HPIibfLVB0S5BSJxPbIsmef+q7cdxB8HShxmPkDaLeQfFWwF4fz+px7f64NLz
 pWhSi4t26J5xqqhwRtwf4h0cJ6hu2tXfxJJnk7woDRSe92/hu0MesWJiwcRes3qAB9A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QMUpwCCE; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 458EF60708
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:41:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BAE2EC79AAE;
 Tue, 27 Oct 2026 12:42:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3671E603BD;
 Tue, 27 Oct 2026 12:41:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CC66010329044; Tue, 27 Oct 2026 13:41:11 +0100 (CET)
Date: Tue, 27 Oct 2026 13:41:11 +0100
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
 buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Gary Bisson <bisson.gary@gmail.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>, 
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>, 
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Message-ID: <auCbnQoG5GRVbbCf@windsurf>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
 <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
 <b8668097-6cd6-49b9-befd-c0ae3f99514f@rnout.be>
 <auBf7VXw8uPQfI2X@windsurf>
 <3b706023-e0dc-47e5-a59e-939a55d4bd38@rnout.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b706023-e0dc-47e5-a59e-939a55d4bd38@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 00/23] Support building the Linux kernel out
 of tree with LINUX_OVERRIDE_SRCDIR
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 09:43:42AM +0100, Arnout Vandecappelle wrote:

> > That being said, I don't think the number of packages that don't
> > support out of tree build will be just "a few". I suspect that the
> > significant majority of generic-package packages will not support out
> > of tree build. So for those, we would now rsync, while we currently do
> > not have to.
>  We only have 612 generic packages. And the biggest of those (boost,
> flutter, any others?) probably do support out-of-tree build.

I don't find 612 to be "only" :-)

But yes I agree that with some efforts the biggest ones should
probably be convertible to out of tree build.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
