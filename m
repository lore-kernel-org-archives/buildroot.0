Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5173C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 03:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DF1A8127C;
	Sat,  8 Jan 2022 03:21:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jC9LYjLhzauF; Sat,  8 Jan 2022 03:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C395481264;
	Sat,  8 Jan 2022 03:21:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D0F51BF336
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 03:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 611424296C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 03:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h72QPi28TMhg for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 03:21:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75255428E7
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 03:21:29 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 p8-20020a9d7448000000b005907304d0c5so8719571otk.6
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 19:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8W68ii29S/WFoNhzVGCeilx+UJczdwaV4vbquBDvHVA=;
 b=cdJs4zQdCJfT80Ve+q9eItkOP5GzAgMPjQbHGR8tYMd+FM5wP9yBJw+z2b4BHvNYBz
 d5+Hp+Q8F1iaDaAwgNpt17pEVgLc5OfgXgUArcboHjo40Rcd2XQJe9mBlDEPWSUJAp0q
 PkPRPHFRrQBqtCyuDqWGsyQRG/0JMjY7qmCPxhyhJOIHpqMbc5Icigo1vrurXpSkKAVr
 o5UKlXqf2ZEvkEIZIFArdvfCH20JMDW+B9s6nYz5LMwNrpopkJtWMt+CF9QighO23mOS
 vAEG6Ev9Sbg5yAEB+UFaAheMFmgysjnZ/W1CCt9Ok3rGzzInplaT27SgeuKZV72f3VTS
 JwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8W68ii29S/WFoNhzVGCeilx+UJczdwaV4vbquBDvHVA=;
 b=7g76kIKrniHFTRQ4nNz1sMs+Iui8rGi6i/f40kFxK39noPvEbL8pStp9XZYcgyZ+bi
 q3o8ExGYU4bb027hiMu3UVSLnPkhiGRIBj0sNCEMNJ+LZ2AaL/cFnH0/YHetZvTOKLxD
 YG+kJHt0pvvUmz/6uK0c4HTtRi2f8U55a/zlyE7vXPgTw0fO3tKXPrKvTqrr2FG1Ig5A
 cD0nZgxu5apiNTJmPwapDecHCVNzI15ofwd60qLEFyhbLB31RPFV5NZoYG7yP6v/rFq7
 z4vD556mNthqZp5xzaWXjQJ1RbpJktVmTkvqix/ZRoUsgnCjC7lUAxZ1QZWWxpXzcrOT
 RQ7Q==
X-Gm-Message-State: AOAM531rZa/dS59B7PHELQNdaRfjRxl1GEGV99BH2THu57jZMI87kv8n
 SdcfvKr5QNkz1ZcL44EwEhM986F2CyXiOD+VMbI=
X-Google-Smtp-Source: ABdhPJzTJPQrDWE8HT4n63XxyZoidMdmuwMe5UdzeHcQxKkSX68TrN3BvASW6OLy7jooLe/423z37/H2grzMIO8Lhfw=
X-Received: by 2002:a9d:64c9:: with SMTP id n9mr4985995otl.167.1641612088249; 
 Fri, 07 Jan 2022 19:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-6-thomas.petazzoni@bootlin.com>
 <CADvTj4rf+NisSUL7=Ee_=3bpDFCaxpsXmUzcOF=oUD5imqXbSQ@mail.gmail.com>
 <20220107105223.01912574@windsurf>
 <CADvTj4q+Ha1qvJ7t6YRRcmu9E8y-J_sU8=i0ZhdTzc1x_ZW+0A@mail.gmail.com>
 <20220107235959.2638b513@windsurf>
In-Reply-To: <20220107235959.2638b513@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Jan 2022 21:21:17 -0600
Message-ID: <CADvTj4pKXr8VDYTrqHP=ZwFETDDONhDzxwHPuLb=YqBK4Dk0bg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 05/11] package/pkg-cargo.mk: introduce
 the cargo package infrastructure
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
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Jan 7, 2022 at 5:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Fri, 7 Jan 2022 16:30:12 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > > >     CARGO_TARGET_$(RUSTC_TARGET_TRIPLE)_LINKER=$(notdir $(TARGET_CROSS))gcc
> > >
> > > How come things are working today with this one?
> >
> > I think this is currently set in the cargo config file.
>
> Ah, right:
>
> [target.@RUSTC_TARGET_NAME@]
> linker = "@CROSS_PREFIX@gcc"
>
> in package/rustc/cargo-config.in
>
> > >  - Relevance of CARGO_TARGET_$(RUSTC_TARGET_TRIPLE)_LINKER=$(notdir $(TARGET_CROSS))gcc
> >
> > Set via CARGO_HOME currently, but I think may allow the cargo config to not
> > be required.
>
> I'm no sure why you say this is set via CARGO_HOME? Because the
> config file is stored in $(CARGO_HOME)/config ?

Yeah, that's what I mean.

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
