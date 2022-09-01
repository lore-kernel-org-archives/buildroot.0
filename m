Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B864EECAAD1
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 18:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9F4360B67;
	Thu,  1 Sep 2022 18:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9F4360B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KT4wVLmJhAFr; Thu,  1 Sep 2022 18:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF81B607A4;
	Thu,  1 Sep 2022 18:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF81B607A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66FDC1BF31B
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 18:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C189E400EE
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 18:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C189E400EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cGiz2HUt6rLn for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 18:33:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 598DB4174A
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 598DB4174A
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 18:33:27 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id x80so13582829pgx.0
 for <buildroot@buildroot.org>; Thu, 01 Sep 2022 11:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5RbNV7ZUfu/q3OGRUGAg8OnUeaBWjIbncwLzC6NYqD8=;
 b=3/pXDTV/dWuvpx0tb7OWGvjDKGn3J7OZiqikv6HSc2ruHiqwETM+RzceAR65fQoy5k
 dU0vF0bnKTP6HNeOLwoBJmMHumr/2Of9mOITsAmgQrYi5/t6YqmyyTuZDYzukNK3UbMa
 XlUGDvqoUCV32wbwLkci/1PdKyv/ishAhuhvAYnT5o72iI6nqPGNjm0HSLDWqGgUsRvs
 qBBuLw3d7kidoy3BsaLHbDux0fwPxN4LIQK16Bl8mY0QKzAR/cqnMM4wpB6mIwqbRN87
 rGb0+n0JnMwWLraH/J/SHl696TXnln3XIBPNLEk5NuH+EC4pnZh0hb/TbOhr+XzdXqRV
 dy6A==
X-Gm-Message-State: ACgBeo1ZwMAhpmhohZrblfovjLOY/Xg85DEVMXqn2BWUKCXlIMzTcZCM
 scaGXRAuUBVJq5kgtSfm2YaDbasWhGXcivT6hWU=
X-Google-Smtp-Source: AA6agR4H/gjhxBVxt0WBGCiokC8/BcL9X3jj9K4CwE77KcH9laVfiKPhvpKg8WYRrvdv9s3/JPpqdKi1OaGgMDL9ct8=
X-Received: by 2002:a63:e156:0:b0:42b:5541:80d4 with SMTP id
 h22-20020a63e156000000b0042b554180d4mr26658251pgk.183.1662057206675; Thu, 01
 Sep 2022 11:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220727083753.935654-1-romain.naour@smile.fr>
 <CADvTj4pSAe_nAr993-GpCGUdsz2RcQa8n+ECme3tvhQwne6s5Q@mail.gmail.com>
 <20220830192242.GD68979@scaer>
In-Reply-To: <20220830192242.GD68979@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 1 Sep 2022 12:33:15 -0600
Message-ID: <CADvTj4rRb8nbieEcssDGRb_YdrB4SEmYQRGdd-NJP2AyWEFaEg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5RbNV7ZUfu/q3OGRUGAg8OnUeaBWjIbncwLzC6NYqD8=;
 b=kgHLv9JWRYfJ/WeJ/06szo/tfkrgGXV0iueG7rk4PxJ3k+2UAOZwSgou8Cv/3gbR0j
 9oIUIpXkIu8BzNUm/xncG/1an+ccYyhSjh6h0a7UrGuokWOGciI4Uu2GxdryvocVpaC9
 cq3JjqPHifR7vHNmQW5JZJtWAUM4VuX+CGjbDODZIPQdvS3C5FK79h2N0adSSlvFVJLa
 Z/4csG+jweg2f8ZA+xpz+jb1r7MqnvIWxAsujwKu0S7mi3gm3SDRBsFfn/G21IdEY9QS
 c2WPAYM24oOCOMoxi0R5Sj00t85vpyGwA0yehvYLOuqE/0xrzKcOlGD5IIOtrY/lNLzF
 HwJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kgHLv9JW
Subject: Re: [Buildroot] [PATCHv3] package/rustc: needs C++ compiler with
 musl based toolchain
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Aug 30, 2022 at 1:22 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-07-28 15:07 -0600, James Hilliard spake thusly:
> > On Wed, Jul 27, 2022 at 2:38 AM Romain Naour <romain.naour@smile.fr> wrote:
> > > While building host-rust with a musl based toolchain without C++ compiler,
> > > the build fail since libunwind bundled in rust sources needs a C++ compiler.
> > >
> > > cargo:warning=i686-buildroot-linux-musl-gcc.br_real: error: [...]/host-rust-1.62.0/src/llvm-project/libunwind/src/Unwind-EHABI.cpp: C++ compiler not installed on this system
> > AFAIU rust should be able to use normal(ie non-llvm) libunwind which doesn't
> > require C++:
> > https://github.com/buildroot/buildroot/blob/master/package/libunwind/libunwind.mk
>
> I've applied Romain's patch as a stop-gap measure, until someone comes
> up with a better solution, like implementing your proposal of using an
> unbundled libunwind.

FYI I sent some preliminary patches improving unbundled libunwind target
arch support:
https://patchwork.ozlabs.org/project/buildroot/patch/20220811063502.1823571-1-james.hilliard1@gmail.com/
https://patchwork.ozlabs.org/project/buildroot/patch/20220811063502.1823571-2-james.hilliard1@gmail.com/

>
> Regards,
> Yann E. MORIN.
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
