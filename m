Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6250CFA472
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65BDD40164;
	Wed, 23 Oct 2024 21:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0bPysscf-ju; Wed, 23 Oct 2024 21:05:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2971540186
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2971540186;
	Wed, 23 Oct 2024 21:05:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A711972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED0ED80C1D
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHWIazs29lay for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:05:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A74780BAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A74780BAE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A74780BAE
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:05:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9734F60003;
 Wed, 23 Oct 2024 21:05:27 +0000 (UTC)
Date: Wed, 23 Oct 2024 23:05:25 +0200
To: Christian Stewart <christian@aperture.us>
Cc: James Hilliard <james.hilliard1@gmail.com>, Christian Stewart via
 buildroot <buildroot@buildroot.org>, Anisse Astier <anisse@astier.eu>
Message-ID: <20241023230525.1f991184@windsurf>
In-Reply-To: <CA+h8R2r0e97u77C9QzSYr_jczF=2zC0+Hz=Y73HUpVh7NGgJUw@mail.gmail.com>
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
 <20240806185731.372f8f3e@windsurf>
 <CA+h8R2rnNhM0nKyZm4_y6ZFrNyn7YzFa7BHeH57cLif38FSrxA@mail.gmail.com>
 <CADvTj4p2heLayPzF7uTK0TLzbbo4C_305vTg9=3W3aCQbAoQGw@mail.gmail.com>
 <CA+h8R2o--yr=J8bmo6R=rBStYLxwOW+fvEKQ3zfLuKrdZznCCA@mail.gmail.com>
 <20241023212545.28838fc1@windsurf>
 <CADvTj4p6EOBciNjy03REWUTkwA6VRYqVYRiYbeDueNC1gbSS_A@mail.gmail.com>
 <CA+h8R2r0e97u77C9QzSYr_jczF=2zC0+Hz=Y73HUpVh7NGgJUw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729717528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mzb+HpcYCeMqi9L+uvMPlfZQY4kcPivkfArxAZi3bss=;
 b=QePw17tzEZtM1E0pSBs5OAtNUiW0HvhR1nxG9m1AJ2eDEYLZIp/o6wawENFp7rLzyA2IV3
 e8fw8oeCIm0qWnO90U3biY9vrCV7vrwcS1vI4oDNjSBIw6wJtwxOexmvGaIMy8sWTtpoQC
 qActY2TPvJCeBqkqWhLyojTVRdHY9sWA6yrtaBX4HaIrYD2d2O4m83LeyxSg1Wu6/d/f+j
 ZqoLWvjJEy6Y8hl1O3dnU22TVOBWX0BSqG6/sHFkvMEz1X8BpAWu8ucagVq/IQ7IgGSTHg
 oQmYMi77XQOakJe6NtFdKWb7aS1/k2HOxFQDGPVnLyU4y6aPeD29aFjjsgmtrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QePw17tz
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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

On Wed, 23 Oct 2024 13:36:50 -0700
Christian Stewart <christian@aperture.us> wrote:

> > I'm not actually trying to modify the dependencies specified at all, if
> > the only download location for a specified dependency I need is on
> > https://proxy.golang.org then I'm not sure how I would patch the
> > package to use that instead.
> >  
> 
> You should report the issue to the upstream repository like I did with
> tailscale, they will update the dependency to a newer version that doesn't
> have the checksums mismatch

I agree... but we should have a way in Buildroot to fix the issue even
if upstream is not responsive or cooperative. So the answer to a
problem cannot only be "let's wait until upstream fixes it".

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
