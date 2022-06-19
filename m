Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CD5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 23:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6533A60E9F;
	Sun, 19 Jun 2022 23:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6533A60E9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GF--8uI1uHAj; Sun, 19 Jun 2022 23:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EDEA60B35;
	Sun, 19 Jun 2022 23:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EDEA60B35
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 581721BF3DA
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 23:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FE1681916
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 23:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FE1681916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wce7P-PbDvvP for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 23:19:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18EE581463
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18EE581463
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 23:19:28 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id s16so1828367oie.3
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rCfiA7JUPLaCN5d4J7iJIfJPgMBlrwhZPe5EldUPCFc=;
 b=RNvaj9TszL5czTyYQ521JhmpmPGbMtYFhB2aTqy9pwi1zXJSEqv5vSnO/KbIbyoMuo
 GXEckIcXVx+MKfAfnUjTnXW/Ip89wNuVxsgpfvlOdNsliIK5sDqikkcg84jXWszHTU7z
 UaVa/fAwKH3aecYPBznY+fCqWeiq5JRMif4IV2KOCLiJc5umUSRp+yAgv0AGdBJ3AFPI
 2ErHZbG2/jbwxcPFvlB2y6eQKaTYgNIYF0iQXZGvDreX49lbW4fRXEJn5Vu5Hn6RkFGD
 Ez+nt68QXzJUnntmUGeCzMLChQmLc/q+RH8lYQU9lPyOhV91t3YM3fQagFHo75ZOQXqs
 8g7Q==
X-Gm-Message-State: AJIora8jjWcMuREtHG7CrxST81C/HwaZsfFxjPK7cF+N0PF3Er0ib/OV
 2Zumc7Ezd4vNrPZHzY9/m1k4wUaNIQhDHeiiukkepII7y0w=
X-Google-Smtp-Source: AGRyM1vMX/F84Uv5bSF22O4XDz4Qyi2czf349grOHkoNybbRKm/jchk4QmBk3dXKqIYgQOW1e+yvStd2pmldc8cfGGc=
X-Received: by 2002:a05:6808:23c6:b0:331:3ab2:6fb9 with SMTP id
 bq6-20020a05680823c600b003313ab26fb9mr9684052oib.200.1655680768095; Sun, 19
 Jun 2022 16:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
 <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
 <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
 <CADvTj4qcYpo=UB2Qny7-0mXiqq9R0u6QMBgs+9hXm76SQxvEew@mail.gmail.com>
 <40fe53f9-cd74-a19f-e338-2aa4d35a9ec1@synopsys.com>
 <8c13892c-a9ed-a016-7043-6794b87a884c@mind.be>
In-Reply-To: <8c13892c-a9ed-a016-7043-6794b87a884c@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 19 Jun 2022 17:19:16 -0600
Message-ID: <CADvTj4rPGVpbbZTXO9J0NT6PLbT_Q8jDHhDwhH6u0jMDc4aJCg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rCfiA7JUPLaCN5d4J7iJIfJPgMBlrwhZPe5EldUPCFc=;
 b=oqq45wghGN1ftf+xlpZuAYiXWhAoH/YKGicUTOHuhJQt4HjI8mOY6dB5SmL3z98zdz
 Xf0CvMHne+b/It7r1IdSBXBJE5xOME0OJt4gP4RYu+x3ea8JWRbCOUj2D9uf+np1rgwW
 drHWc2PPhuaLFhlwW9gzPRVshEFQMuxWcIsNgQDMeJpe1Zeg7S1+vZIuuhz9+dPJIWs0
 iLO0tqeBMlJ2XCtQlvw81OIxIv4w1PcBgeWojUc06aDLukg0NNLg6G6V26ikM2SLyF8Z
 lw/EpVd+l2ZJiebguwWoBT7hXqYPsCkvjeyoTjk7U5PDckIYMN5lhTWg+tGhBBHLcIz4
 4vRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oqq45wgh
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

On Sun, Jun 19, 2022 at 9:20 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 16/06/2022 10:11, Shahab Vahedi wrote:
> > On 6/16/22 01:27, James Hilliard wrote:
> >> On Wed, Jun 15, 2022 at 5:10 AM Shahab Vahedi via buildroot
> >> <buildroot@buildroot.org> wrote:
> >>>
> >>> On 6/14/22 19:14, Arnout Vandecappelle wrote:
> >>>>
> >>>> On 14/06/2022 11:31, Shahab Vahedi wrote:
> >>>>> Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11
> >>>>
> >>>>   How do you build host-bpftool with clang in Buildroot context? HOSTCC is set to gcc in the Makefile... Do you supply an explicit HOSTCC= on the Buildroot command line? I'm not sure if we are really interested in carrying fixes for such exotic and not-really-supported situations...
> >>>
> >>> No, I don't do any sort of trickery to build bpftool on my end. The
> >>> bootstrapping, if becomes available for your configuration, uses clang
> >>> and only clang. I tried to explain this in v4 of the patch [1], the
> >>> second paragraph of the commit message.
> >>
> >> I think clang/llvm support isn't going to work correctly yet since we only have
> >> version 9.0.1, there's a series bumping to version 11.1.0 that should fix that:
> >> https://patchwork.ozlabs.org/project/buildroot/list/?series=291585
> >>
> >> Minimum clang/llvm version for libbpf co-re is version 10:
> >> https://github.com/libbpf/libbpf*bpf-co-re-compile-once--run-everywhere
> >
> > You're right about the clang version, but it doesn't have anything to do
> > with Buildroot's clang. The build process uses the clang that is installed
> > on the host. For Debian bullseye, that is clang 11.
>  >
> > To emphasise, I am cross-building bpftool for my "arc-linux" target, and yet
> > the bootstrap part of bpftool, uses the x86 clang of the Debian machine.
>
>
>   Hm, that smells like we actually want to build host-clang (after updating it
> to 11.1.0 of course) so that we are sure a known version of clang is used.
> Possibly with a check-host-clang check to avoid building it if the installed
> clang is good enough.

Dealing with multiple external clang versions may be a bit tricky and difficult
to test properly, we don't really want to use the system clang/llvm although
clang/llvm external toolchain support may be desirable here as those could
be tested by the autobuilders.

It would be good to get clang/llvm updated soon as systemd is now using bpf for
some service security/isolation features that we currently aren't able
to support
due to clang/llvm being too old.

>
>   And we probably want a user-visible option to enable co-re then, because it's
> going to be expensive to build.

We may want to make llvm/clang part of the pre-built toolchains
eventually, but for
now I'd say we should just conditionally enable co-re here if we are
already building
a clang/llvm toolchain.

There's some early GCC support for co-re in 12.1 which I was experimenting with
as well which may reduce the need for a llvm/clang toolchain for co-re. The GCC
toolchain BPF support build process is a bit complex however as one needs to
sorta do a hybrid multitarget build with GCC and binutils since GCC
treats BPF as
a separate target(and since GCC along with the binutils GAS assembler
don't natively
handle multi-target toolchain builds themselves).

I have an experimental branch for that here:
https://github.com/buildroot/buildroot/compare/master...jameshilliard:ebpf

I'll try and clean that up a bit once the GCC 12.1 series it is based
on is merged:
https://patchwork.ozlabs.org/project/buildroot/list/?series=302389

>
>   Regards,
>   Arnout
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
