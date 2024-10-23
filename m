Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABB5CFA45F
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64BB6810D3;
	Wed, 23 Oct 2024 19:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmoVkKccqZ0q; Wed, 23 Oct 2024 19:25:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE4DA810C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE4DA810C7;
	Wed, 23 Oct 2024 19:25:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8260327F2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7103D60829
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ab4qISZTxxnJ for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 504766065D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 504766065D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 504766065D
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:25:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D4DD240004;
 Wed, 23 Oct 2024 19:25:47 +0000 (UTC)
Date: Wed, 23 Oct 2024 21:25:45 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Cc: Christian Stewart <christian@aperture.us>, James Hilliard
 <james.hilliard1@gmail.com>, Anisse Astier <anisse@astier.eu>
Message-ID: <20241023212545.28838fc1@windsurf>
In-Reply-To: <CA+h8R2o--yr=J8bmo6R=rBStYLxwOW+fvEKQ3zfLuKrdZznCCA@mail.gmail.com>
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
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729711547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIbCVVnoD5OhMqVL8UIce937IVjnqfG60TK1gF7OLNg=;
 b=eg3ryzlypW8i63VeDjbY0jzskgUFYpus4hzSV4VgcrHEbPsK+F4cLJu67ZGpetq85KgSrg
 nMh4uCE1lYmrihTYuEtXTSEvAh8Cwom0cnpLnN1XNfMpNhmzwXAcsm4+rgYyCn79ZyH8dF
 J2VrarPuVhGFTsw8WI11xnQJnA+VvXBH2orp6flaLnAlPDdoJao9Eh/tM43vldISsSeoUx
 UxM3v5t7DzMyfXuCf3pYgeFZgGnFL33oNhiyTbpkCBHxnyjHKoI4+CgtTDHc2cbssKo7mn
 tMHKQFXNWOQZMoG5Gpn+QjAjU/M7VnkUyZXOx5SNFd7lbtDHYGyQqSNtxOes1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eg3ryzly
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

Hello,

On Wed, 23 Oct 2024 09:35:16 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> It is a proxy, not a download URL. The intent of the entire Go module
> system is to be based on source control under the hood. We should be able
> to check out the git repositories of the underlying source without having
> to use the Google proxy.
> 
> If we make a habit of ignoring these hash mismatches it will become very
> easy for people to stuff code into a release on GitHub and then change the
> tag to something else later, leaving behind the old record in GOPROXY and
> tricking maintainers into reviewing the wrong code on the modified GitHub
> tag.
> 
> There must be some reason why your package is having this issue. With
> anchore quill package we found that it was git lfs with test files causing
> the problem.

I continue to agree with Christian. If using caching proxies is needed
to avoid downloading the "real" upstream because the real upstream has
changed/is broken, things are severely wrong.

Instead, I would recommend to patch netbird to resolve this issue. I
know this requires patches to be applied *before* the vendoring step,
but that it something that anyway would be useful to have. So I would
suggest to find a way to do that. Perhaps some special patch extension,
like package/<foo>/*.vendoring-patch or some other better name, that
would be applied before the vendoring step takes place?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
