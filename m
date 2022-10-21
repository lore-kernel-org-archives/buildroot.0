Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA714C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 16:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 501634244F;
	Fri, 21 Oct 2022 16:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 501634244F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3kLk7d3L4Nz; Fri, 21 Oct 2022 16:42:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355AE418F3;
	Fri, 21 Oct 2022 16:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 355AE418F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39A141BF27C
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 16:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13F424097F
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 16:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13F424097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgI1Q5t3yPh6 for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 16:42:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 592B34018F
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 592B34018F
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 16:42:01 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id j12so2854107plj.5
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 09:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ouIj0RgGT9KvPwZ00VDgYB1QC+IIJswTBnWTjtBRmVM=;
 b=EwQAS/pwsv1xL+qG7/PDjXT2J8MiMmqnjA84Bg/1uVAPnBa8MfC+q1OcIA/zi6QJEx
 uZkSxNtA9vAb3j84cADhOvoIZwGkXlnNgYI+/edOide6hR1XuYr0+TBrpjx3lt3buiOb
 21j+IUuu7/cqqx2SgTtFxeMfSR+3+uPqnbSQcHXywQxCoKv6BKxYaIPZ+SI6MBuOUzX8
 mfQRmB1Frssql9oNc1gGS2/mG3ZBBTjgQ9YBe5yLFhe/ythUpKX52gvwLieK/lTfZ4D6
 ya8XqomHjEqrEfnN6rQvx3tFVTI8KMRa9N9xOR8nyPZ4rNoOStd/W/g2956W9fRJnIXK
 7Frw==
X-Gm-Message-State: ACrzQf0AslYdTPkegVzIP4jON6ANXcp0Gb6Tfc3uxsVlWTwEObz5ebGE
 a3gjdZ2tmemG1dCbEBC6Iw9XcSBlVnDJUOILnjeKxKNT2BM=
X-Google-Smtp-Source: AMsMyM7+kxyQ7cdxUQOwAk/Glg0c78mD+gAviwpJlLGqWlSKdE2B0X5IhScIMDDEwHjhIYs8k2vE5LUt8A0PGmmVTrA=
X-Received: by 2002:a17:902:b598:b0:184:e49d:3042 with SMTP id
 a24-20020a170902b59800b00184e49d3042mr20599976pls.16.1666370520465; Fri, 21
 Oct 2022 09:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221019220019.8418-1-moritz@h6t.eu>
 <20221019220019.8418-2-moritz@h6t.eu>
 <CADvTj4rBgVG3FYMeT1DO_83w5JCJm8hAVZBKf6gq93SzEwpPdg@mail.gmail.com>
 <1c451d96-4f2a-ed48-c7a0-ab83cb935361@h6t.eu>
In-Reply-To: <1c451d96-4f2a-ed48-c7a0-ab83cb935361@h6t.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 21 Oct 2022 12:41:48 -0400
Message-ID: <CADvTj4p7RzkEx4NPvPde1FpSWRvRXy+Z_7nK7RceFQfX1zachA@mail.gmail.com>
To: Moritz Bitsch <moritz@h6t.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ouIj0RgGT9KvPwZ00VDgYB1QC+IIJswTBnWTjtBRmVM=;
 b=KvNd5J6hxNlZeK0yn59yVO7PzkTNaEAHaUcox/CbNkSUae6p2rBpjABCHOViIQKSWA
 vg/NZTcAyY4zH6OfP/i2Dz/ff/6e3YuhX8KqNz1MOzmuv9TNraUeVQ/ICdXGpHtUC0P5
 +9hnTZi8YCGmAeIfi6LYD/uHYRU/yTwSJekBP1gKsebu7j3MPAzpKuiFOtMEBssQOgM/
 P1Cyv8QEtJocDz061NNS8p2W0vdcU0Hm3mVmfNueo0dWMW3aWxSLJhLAT8Eg9qsOyAsH
 fKnzp2PZUcRf377TnFG8aoSAE8TVWu2fMIR7b9wfnRVRo1c3RFkldSxQw+yqT7A37TNm
 Rwlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KvNd5J6h
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-cargo.mk: fix handling of
 runtime debug builds
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Oct 21, 2022 at 2:48 AM Moritz Bitsch <moritz@h6t.eu> wrote:
>
> Am 20.10.22 um 00:12 schrieb James Hilliard:
>
> > On Wed, Oct 19, 2022 at 6:02 PM Moritz Bitsch via buildroot
> > <buildroot@buildroot.org> wrote:
> >> From: Moritz Bitsch <moritz@h6t.eu>
> >>
> >> The cargo --release flag is used to create optimized builds, not supplying
> >> --release has major performance implications.
> > Is there an env variable we can use to set this instead?
> >
> > Some packages use cargo without the cargo infrastructure, for example
> > we have a number of pyo3(https://pyo3.rs/) based packages that use the
> > cargo env but not the cargo build commands from here.
> I could not find any env variable for switching profiles.
>
> I had a look at python-rtoml, and the used setuptools-rust: supplying
> --debug to
> the "setup.py build" removes the --release flag from the cargo invocation.

Hmm, there are two pyo3 build backends, only setuptools-rust uses setup.py,
we also have maturin which is pep517 based.

> >> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
> >> ---
> >>   package/pkg-cargo.mk | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> >> index f7e3f39503..e0556252fa 100644
> >> --- a/package/pkg-cargo.mk
> >> +++ b/package/pkg-cargo.mk
> >> @@ -119,7 +119,7 @@ define $(2)_BUILD_CMDS
> >>                  $$($(2)_CARGO_ENV) \
> >>                  cargo build \
> >>                          --offline \
> >> -                       $$(if $$(BR2_ENABLE_DEBUG),,--release) \
> >> +                       $$(if $$(BR2_ENABLE_RUNTIME_DEBUG),,--release) \
> >>                          --manifest-path Cargo.toml \
> >>                          --locked \
> >>                          $$($(2)_CARGO_BUILD_OPTS)
> >> --
> >> 2.37.3
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot@buildroot.org
> >> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
