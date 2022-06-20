Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F26CC43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 09:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D020660F34;
	Mon, 20 Jun 2022 09:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D020660F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQ_Hjq5HxX0A; Mon, 20 Jun 2022 09:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5DE760AA0;
	Mon, 20 Jun 2022 09:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5DE760AA0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 875CC1BF362
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 09:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FAB440025
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 09:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FAB440025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KpEuuctz3JKH for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 09:17:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C4D840AD0
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C4D840AD0
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 09:17:41 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-fe023ab520so13458498fac.10
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 02:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x1BrivgHBNYg0vk9SrelOPjD2D43XBZVbAlRi7iDmY0=;
 b=ItH/+7Pn2zBNoxnnb9bdSrHDDcvmUZtElMlnyPBpDkofC/eT0O2MB8SLLeZT556BJ0
 GOgcZrj0JDUqpxMmrZYYInH8Go1IRSJUs2V4mWcd6q/SCzeIHUrEIIG4uGxB7eMHfMrL
 2OYx4IF1QJhSGMsdfcos9kLjW66MhLqFIGp9V0uEobJMWG1fbPLBcky4U0yoGOlor6yz
 WB3zISknEyxUiBvVgl4NVTvkbA5wtXvdEdCkUVcOorUUbMKHzMOzYrF90v0NMEXr9iBr
 4pvvOqT1UA2NoX6WO8565wN7Cquos9Z2qrudhu6jT3CvmbiE5obsj26M+SbKsTQPNecN
 rm4Q==
X-Gm-Message-State: AJIora/WrSuNCmU1RxtJ/BK+7wVHylJ21n8cF42kt0J+ecHoe/Bj5x0u
 kJF4uOw+26fU/3ql5m5mvHQVs1LZ0Eio2qnC3c4=
X-Google-Smtp-Source: AGRyM1uemeO2tDm0+miJsyYl9hEwVRoobW/3jKGUcl7A6xCg4WntSUzZqu9fKonOf+/yWv4R8ygzZb7dqW9b5urQ62A=
X-Received: by 2002:a05:6870:d0ce:b0:f3:3856:f552 with SMTP id
 k14-20020a056870d0ce00b000f33856f552mr12135132oaa.99.1655716660265; Mon, 20
 Jun 2022 02:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
 <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
 <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
 <CADvTj4qcYpo=UB2Qny7-0mXiqq9R0u6QMBgs+9hXm76SQxvEew@mail.gmail.com>
 <40fe53f9-cd74-a19f-e338-2aa4d35a9ec1@synopsys.com>
 <8c13892c-a9ed-a016-7043-6794b87a884c@mind.be>
 <CADvTj4rPGVpbbZTXO9J0NT6PLbT_Q8jDHhDwhH6u0jMDc4aJCg@mail.gmail.com>
 <ac05ab10-5b36-619c-3ccc-a619d6c0c0da@mind.be>
In-Reply-To: <ac05ab10-5b36-619c-3ccc-a619d6c0c0da@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Jun 2022 03:17:29 -0600
Message-ID: <CADvTj4rFeH6m+vq+nrM8O61UJ4d6yyifJ6NdTadxkU-kGvOCMQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x1BrivgHBNYg0vk9SrelOPjD2D43XBZVbAlRi7iDmY0=;
 b=hzrpArR5W/qnEphR2D0RdHYDRIsQazHKhEimtDZD+O7zWN69j4hOZw+zHeccy52wdV
 YEfljvrSHJlyJUOWDr3p0wQMZeaTaEtFNlQa42s8JBTFELjdHK6D0uwwppg15ODiVUug
 3bXOf4tXyv+OgpKKa6uXRD+YHGdrXjbTTBpwTMJsQtW0HyOBdW+lQ3DBuMIEJLArhklF
 n46sWLKDh1r5QHwKWmBgz2o9W1ZnZAocWyINxZ1It7MMXJ+jhl1fbKiPnmFqDlQsasXN
 hiCCaPiyHs2zhLBxXQLG43j6JnImz+uItIuv2A9P9dWyxJduE1pc28Jv+T5A3KQ9Z/TB
 XNKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hzrpArR5
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
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jun 20, 2022 at 12:45 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 20/06/2022 01:19, James Hilliard wrote:
> > On Sun, Jun 19, 2022 at 9:20 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 16/06/2022 10:11, Shahab Vahedi wrote:
> >>> On 6/16/22 01:27, James Hilliard wrote:
> >>>> On Wed, Jun 15, 2022 at 5:10 AM Shahab Vahedi via buildroot
> >>>> <buildroot@buildroot.org> wrote:
> >>>>>
> >>>>> On 6/14/22 19:14, Arnout Vandecappelle wrote:
> >>>>>>
> >>>>>> On 14/06/2022 11:31, Shahab Vahedi wrote:
> >>>>>>> Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11
> >>>>>>
> >>>>>>    How do you build host-bpftool with clang in Buildroot context? HOSTCC is set to gcc in the Makefile... Do you supply an explicit HOSTCC= on the Buildroot command line? I'm not sure if we are really interested in carrying fixes for such exotic and not-really-supported situations...
> >>>>>
> >>>>> No, I don't do any sort of trickery to build bpftool on my end. The
> >>>>> bootstrapping, if becomes available for your configuration, uses clang
> >>>>> and only clang. I tried to explain this in v4 of the patch [1], the
> >>>>> second paragraph of the commit message.
> >>>>
> >>>> I think clang/llvm support isn't going to work correctly yet since we only have
> >>>> version 9.0.1, there's a series bumping to version 11.1.0 that should fix that:
> >>>> https://patchwork.ozlabs.org/project/buildroot/list/?series=291585
> >>>>
> >>>> Minimum clang/llvm version for libbpf co-re is version 10:
> >>>> https://github.com/libbpf/libbpf*bpf-co-re-compile-once--run-everywhere
> >>>
> >>> You're right about the clang version, but it doesn't have anything to do
> >>> with Buildroot's clang. The build process uses the clang that is installed
> >>> on the host. For Debian bullseye, that is clang 11.
> >>   >
> >>> To emphasise, I am cross-building bpftool for my "arc-linux" target, and yet
> >>> the bootstrap part of bpftool, uses the x86 clang of the Debian machine.
> >>
> >>
> >>    Hm, that smells like we actually want to build host-clang (after updating it
> >> to 11.1.0 of course) so that we are sure a known version of clang is used.
> >> Possibly with a check-host-clang check to avoid building it if the installed
> >> clang is good enough.
> >
> > Dealing with multiple external clang versions may be a bit tricky and difficult
>
>   We do it for GCC, so we can do something similar for clang.
>
> > to test properly, we don't really want to use the system clang/llvm although
> > clang/llvm external toolchain support may be desirable here as those could
> > be tested by the autobuilders.
>
>   For GCC, the host toolchain is completely unrelated to the target toolchain.
> With clang, it's true that it's possible to use the target compiler for host
> builds as well, but don't we still need binutils? So in my mind, there would be
> a separate host clang toolchain and target clang toolchain.

BPF is kinda weird...for both clang and GCC. It's sorta a separate
architecture in
the compiler...but is also sorta not architecture specific in what it
builds for.

>
>
> > It would be good to get clang/llvm updated soon as systemd is now using bpf for
> > some service security/isolation features that we currently aren't able
> > to support
> > due to clang/llvm being too old.
>
>   Unfortunately your series is rather large and has no Reviewed or Acked by
> tags... So it tends to languish on patchwork.

The tested-by for the v12 series ended up in the wrong thread I think:
https://lore.kernel.org/buildroot/BN2P110MB16408DC4537E54EF7ECC7906F21A9@BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM/

>
>
> >>    And we probably want a user-visible option to enable co-re then, because it's
> >> going to be expensive to build.
> >
> > We may want to make llvm/clang part of the pre-built toolchains
> > eventually, but for
> > now I'd say we should just conditionally enable co-re here if we are
> > already building
> > a clang/llvm toolchain.
>
>   Although I'm usually in favour of automatic dependencies, in this case I'd say
> it's worth adding an explicit config option.
>
>
> > There's some early GCC support for co-re in 12.1 which I was experimenting with
>
>   But then it would depend on both host and target GCC >= 12...

I thought we don't support GCC on the target.

We would essentially have a 2 architecture cross-toolchain(one real
target arch, and the
BPF virtual architecture compiler/assemblers and such).

>
> > as well which may reduce the need for a llvm/clang toolchain for co-re. The GCC
> > toolchain BPF support build process is a bit complex however as one needs to
> > sorta do a hybrid multitarget build with GCC and binutils since GCC
> > treats BPF as
> > a separate target(and since GCC along with the binutils GAS assembler
> > don't natively
> > handle multi-target toolchain builds themselves).
>
>   Ouch, so we still can't reuse the existing host toolchain for the host parts?
> then it doesn't help that much, does it?

We can create a GCC toolchain that can target both BPF and the normal target
architecture...but it's sorta a strange multiarch style toolchain.

>
>   Regards,
>   Arnout
>
> >
> > I have an experimental branch for that here:
> > https://github.com/buildroot/buildroot/compare/master...jameshilliard:ebpf
> >
> > I'll try and clean that up a bit once the GCC 12.1 series it is based
> > on is merged:
> > https://patchwork.ozlabs.org/project/buildroot/list/?series=302389
> >
> >>
> >>    Regards,
> >>    Arnout
> >>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
