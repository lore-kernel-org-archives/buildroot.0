Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEF0C43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 23:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E191083E8B;
	Wed, 15 Jun 2022 23:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wK1QbTYVaAj2; Wed, 15 Jun 2022 23:27:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 077CE83E19;
	Wed, 15 Jun 2022 23:27:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 755E01BF3BA
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 23:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 643EE83E19
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 23:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aMrufl8Te4JT for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 23:27:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 834C783E05
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 23:27:34 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id w16so17445422oie.5
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 16:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HM2LoieUoZENKJf6OlZG4ShMEcNYtOf+SIvV0njyQ7c=;
 b=BidEZ6hXHh/bo+2Yq/906SgH4X9yhuprxDwSm2GnyCL7HeqZ6t1870940Hw76wN4q0
 us1SC9IPa2YUMoMO41STkk4FXC7XLyTt0g5LKj/pyNHSrU95oLMDSeSEIaU8szpgHHmH
 BiaJfV20UEpANRk2qlr0oCrBs1kVULQ7izm/KUXPwyelddKDvouzLt7eXWEwWV1hBFpp
 zyjJh9A3qyAgcSYLVsWN5B1mdIq9JZK8tpykhRBo9ZAdR8mMnwsh+0LD0ioEv7tnYy00
 d2hF4FH4kjDdAgjJ9S/A33IodwP0G7n5Y3oU8Ciz3m3iZTNrWG4c+aJcXhC6VJGV+93t
 P2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HM2LoieUoZENKJf6OlZG4ShMEcNYtOf+SIvV0njyQ7c=;
 b=yQOueP6mlU25yQZl9blMAHOOcid0kfEt8iTLfefuPpW92TswHTX7JknEGD2j0CIJ8m
 LJz9qPCe5sZetz88fQ1s+TstXPVXF1hXi9DNCGgSfJZ9QvYH4v2IqhqRE1ufg3evO20z
 8pYlQzJovAuGSbsO8YU4rUuETF6f0JlJNUb7EGMERRT8opt94cxa+BNZen2xT2DZuO9L
 zTVSIVERNcMO0jKCJ4/y7dpDgBhtqpmhNa9RtNBuMGC4SbRuoCcjlbnpqVhvjRy8nF5y
 mYYV5IVOMdL5JqS35iCJcJoMrwMFS1BKRX3Yk0dL28UdQx7ecnS/NjPukH39KlkohUfw
 kafQ==
X-Gm-Message-State: AJIora8Yx24p2KRPuHqbOSEltbLAR6ghCae50pqO7E3iIwhRjSvMnReN
 b20NjoINV4cZCPfKPlXMrtCdjp8kbHGK+/SDQo1IotsIkvw=
X-Google-Smtp-Source: AGRyM1vXkV0s4xPgViyFsaweOW7RHiLr1nUiYJBYtJisgmh63kGEY6rt9Y+vceNl1x4Ph7umptvgJJDkRmcaR7qkXQU=
X-Received: by 2002:a05:6808:23c6:b0:331:3ab2:6fb9 with SMTP id
 bq6-20020a05680823c600b003313ab26fb9mr1094642oib.200.1655335653525; Wed, 15
 Jun 2022 16:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
 <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
 <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
In-Reply-To: <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 15 Jun 2022 17:27:22 -0600
Message-ID: <CADvTj4qcYpo=UB2Qny7-0mXiqq9R0u6QMBgs+9hXm76SQxvEew@mail.gmail.com>
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jun 15, 2022 at 5:10 AM Shahab Vahedi via buildroot
<buildroot@buildroot.org> wrote:
>
> Hi Arnout,
>
> On 6/14/22 19:14, Arnout Vandecappelle wrote:
> >
> > On 14/06/2022 11:31, Shahab Vahedi wrote:
> >> Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11
> >
> >  How do you build host-bpftool with clang in Buildroot context? HOSTCC is set to gcc in the Makefile... Do you supply an explicit HOSTCC= on the Buildroot command line? I'm not sure if we are really interested in carrying fixes for such exotic and not-really-supported situations...
>
> No, I don't do any sort of trickery to build bpftool on my end. The
> bootstrapping, if becomes available for your configuration, uses clang
> and only clang. I tried to explain this in v4 of the patch [1], the
> second paragraph of the commit message.

I think clang/llvm support isn't going to work correctly yet since we only have
version 9.0.1, there's a series bumping to version 11.1.0 that should fix that:
https://patchwork.ozlabs.org/project/buildroot/list/?series=291585

Minimum clang/llvm version for libbpf co-re is version 10:
https://github.com/libbpf/libbpf#bpf-co-re-compile-once--run-everywhere

>
> [1] [v4,1/1] package/bpftool: revert bpf_cookie patch to allow building
> https://patchwork.ozlabs.org/project/buildroot/patch/29d2a8c7-44cd-da42-5fed-f17ec0f8ccf2@synopsys.com/
>
> --
> Shahab
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
