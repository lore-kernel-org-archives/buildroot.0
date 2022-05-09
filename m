Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A973C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 08:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFDC481AD7;
	Mon,  9 May 2022 08:00:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M4I6SzGqOott; Mon,  9 May 2022 08:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7198D81A65;
	Mon,  9 May 2022 07:59:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E44B1BF20D
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 07:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C67060B96
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 07:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jms.id.au
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FWnQYQh8Fg32 for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 07:59:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C938760B89
 for <buildroot@buildroot.org>; Mon,  9 May 2022 07:59:56 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id kj8so9883939qvb.6
 for <buildroot@buildroot.org>; Mon, 09 May 2022 00:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XCVHR9Q6/cWeLgE2xwZd3HA3URWz7wNgwqJdHFl/8f8=;
 b=jxri+82gvF0rYFAIEyzbe6RmjNTTFohW8n27v4pm9V+bCvvs92o3rzW2GuBr3PKvPw
 0I735l7M0Dm/P+SPYF+IwGEfBsyst1bfkiZHGFku6137sEYoldfupbTaEPXt6NTwgEo2
 Re3BZHDP1DZuywHRNaI6urB30j8uW1yYFTGvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XCVHR9Q6/cWeLgE2xwZd3HA3URWz7wNgwqJdHFl/8f8=;
 b=20bwqGJiuPM2ShUTSNOqRNKa3XGOjSDb66Z/OYWZzqao6i5nRXMRUmyFLJms9X6s3l
 4oMNEshWyTj/oX22O8xfBPW1YiYYcu5kwJgklC/FSl7TLr9ZrBl0I51oXjl9ZOTk+DFh
 JAHOGr8iL7xPVFdM/gMeN6f3X4oqkm4WtY5dmdz1D9WaO/au5666/1ujTgIhA8YppG5V
 Tsoc+OxcMdaoqUQWivcAn1kHJ7G/4Rzy3k5+YuMpC+243PidbmIph9r4Yrvyxmve0tta
 SInKZgRm9phgeAk2rzKMityQeIqHL3v2Y20KYkiZRG1PR0b1Y5QqGnYWhpJyBqX9d1P5
 YBhg==
X-Gm-Message-State: AOAM531oV57gpMxwc2ZHmW6M9fr0OJMl4sGCP6wW3Ckf54CB1qrQdqdU
 YjH2PBh2DdW6qEvhh2vXQKYcCiSIHU8QxL5BProTahIG+94=
X-Google-Smtp-Source: ABdhPJwfjQnlAvCvb4p1aTa9acErmr3vpLxBRi1Zvf8yOnWdQwtCsdOpQP7abIWH66tdlClrAz8VR4Lm7HbksirB8O4=
X-Received: by 2002:a05:6214:f06:b0:45b:127b:7dc9 with SMTP id
 gw6-20020a0562140f0600b0045b127b7dc9mr2564954qvb.8.1652083195334; Mon, 09 May
 2022 00:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220505100956.155737-1-joel@jms.id.au>
 <20220505195531.GA2547@scaer>
In-Reply-To: <20220505195531.GA2547@scaer>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 9 May 2022 07:59:41 +0000
Message-ID: <CACPK8XemeEyqrA-EPMh=VXXseF04FVbaR2gT16nm54f21fuDgg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/gcc: Disable uclibc for powerpc64
 and powerpc64le
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 5 May 2022 at 19:55, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Joel, All,
>
> On 2022-05-05 19:39 +0930, Joel Stanley spake thusly:
> > uClibc-ng does not (and has never) supported the 64 bit powerpc
> > architecture.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> > I'm a bit confused as to why uclibc was ever an option. Perhaps I missed
> > something! I did a search of the mailing list archive and the best I
> > found was this post from Thomas:
> >
> >  https://lore.kernel.org/buildroot/20160817193721.0cc1466d@free-electrons.com/
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  package/gcc/Config.in.host | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> > index a1fe192d3a24..3364860ec7a4 100644
> > --- a/package/gcc/Config.in.host
> > +++ b/package/gcc/Config.in.host
> > @@ -31,6 +31,8 @@ config BR2_GCC_VERSION_9_X
> >       # upstream gcc. C-SKY gcc upstream support not tested
> >       # with upstream binutils and glibc.
> >       depends on !BR2_csky
> > +     # 64 bit powerpc is not supported by uclibc
> > +     depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_powerpc64 || BR2_powerpc64le))
>
> This is not the proper place to put this limitation. Instead, it should
> be added to toolchain/toolchain-buildroot/Config.in so that uClibc is
> not ever selectable for powerpc64.
>
> Except this is already the case:
>
>    28 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>    29     bool "uClibc-ng"
>    30     depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
>    31            BR2_arm     || BR2_armeb    || \
>    32            BR2_i386    || BR2_m68k   || BR2_microblaze || \
>    33            BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
>    34            BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || \
>    35            BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
>    36            BR2_x86_64
>
> And indeed, when I enable either BR2_powerpc64 or BR2_powerpc64le, then
> uclibc-ng is not selectable in the C library choice...

I missed this, thanks for pointing it out.

As I describe below, the bug is due to selecting 32 bit userspace when
building for a 64 bit CPU. This patch does not resolve that issue, as
you point out.

>
> So now I am confused. Could you explain why you had to hide away the gcc
> versions when uclibc-ng is selected? And how you even managed to select
> uClibc-ng with powerpc64 to begine with? Can you share a defconfig that
> exhibits the issue?

I was looking at this autobuild failure:

  powerpc    |         uclibc-1.0.40          | NOK |
http://autobuild.buildroot.net/results/d72f51ccaa2911400e5b607e7fd259093e5f4b8a
|

The build error was:

In file included from ./libpthread/nptl/../nptl_db/thread_db.h:28,
                 from ./libpthread/nptl/descr.h:30,
                 from ./libpthread/nptl/pthreadP.h:25,
                 from <stdin>:2:
./include/sys/procfs.h:56:21: error: conflicting types for 'elf_vrregset_t'
   56 | typedef elf_vrreg_t elf_vrregset_t[ELF_NVRREG];
      |                     ^~~~~~~~~~~~~~
In file included from
/home/autobuild/autobuild/instance-3/output-1/build/linux-headers-5.15.33/usr/include/asm/sigcontext.h:14,
                 from ./include/bits/sigcontext.h:30,
                 from ./include/signal.h:396,
                 from ./include/sys/procfs.h:26,
                 from ./libpthread/nptl/../nptl_db/thread_db.h:28,
                 from ./libpthread/nptl/descr.h:30,
                 from ./libpthread/nptl/pthreadP.h:25,
                 from <stdin>:2:
/home/autobuild/autobuild/instance-3/output-1/build/linux-headers-5.15.33/usr/include/asm/elf.h:161:21:
note: previous declaration of 'elf_vrregset_t' was here
  161 | typedef elf_vrreg_t elf_vrregset_t[ELF_NVRREG];
      |                     ^~~~~~~~~~~~~~

When I looked around for similar failures I found this, which led me
down the path of "why is buildroot building uclibc for the 630?" (the
630 is a 64-bit processor):

https://lore.kernel.org/all/20160711043453.GA28468@waldemar-brodkorb.de/

This is where I got a bit confused, and it becomes obvious I didn't
retest the defconfig that was failing before sending my patch.

From the top of the defconfig, it is not configured for 64 bit (so my
patch wouldn't have helped):

BR2_powerpc=y
BR2_powerpc_630=y

My apologies. Thanks for your careful review.

There's still an autobuilder failure that would be nice to avoid.

It will show up for any 64 bit powerpc machine that is configured in
buildroot with a 32 bit userspace. There's no defconfigs that do this
in the tree, but the autobuilder appears to generate them on occasion.

The gcc build defaults to the target machine, which is 64 bit, so gcc
has the __powerpc64__ preprocessor set. uclibc then errors out as the
kernel headers have unexpected values set.

To fix the issue, buildroot would need to build the toolchain so it
defaulted to 32 bit (by setting GCC_TARGET_CPU to powerpc), or ensure
it passed -mcpu=powerpc to GCC each time it was invoked (for compiling
and for linking).

Alternatively, buildroot could change the arch configuration to not
allow 32 bit userspace to be built if a 64 bit machine has been
selected. If users wanted to run a 32 bit userspace they could still
build userspace for a generic powerpc machine, which achieves a
similar result without having to maintain the mixed configuration.

Cheers,

Joel


>
> Regards,
> Yann E. MORIN.
>
> >       select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> >
> >  config BR2_GCC_VERSION_10_X
> > @@ -43,6 +45,8 @@ config BR2_GCC_VERSION_10_X
> >       # upstream gcc. C-SKY gcc upstream support not tested
> >       # with upstream binutils and glibc.
> >       depends on !BR2_csky
> > +     # 64 bit powerpc is not supported by uclibc
> > +     depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_powerpc64 || BR2_powerpc64le))
> >       select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> >
> >  config BR2_GCC_VERSION_11_X
> > @@ -54,6 +58,8 @@ config BR2_GCC_VERSION_11_X
> >       # that need to be reverted since gcc 8.4, 9.3 and 10.1.
> >       # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
> >       depends on !BR2_sparc
> > +     # 64 bit powerpc is not supported by uclibc
> > +     depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_powerpc64 || BR2_powerpc64le))
> >       select BR2_TOOLCHAIN_GCC_AT_LEAST_11
> >
> >  endchoice
> > --
> > 2.35.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
