Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE21C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 22:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0667419B6;
	Wed, 19 Oct 2022 22:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0667419B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64PbqXgZ6uko; Wed, 19 Oct 2022 22:12:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ADDA41C61;
	Wed, 19 Oct 2022 22:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ADDA41C61
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB2231BF3C3
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 22:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F8FE419C4
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 22:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F8FE419C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nCeKGaxAMjws for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 22:12:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6B9C41C70
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6B9C41C70
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 22:12:23 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id h13so18528791pfr.7
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 15:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kbnesjMJ27lmErsGDoCuiToE/nbOMfN9RTC+pLh+fDM=;
 b=HkxKlr7LRUmSpVz6GtewwLUAo8gCTEkXP1xe3bP/QCa01S2DdDRQmyd4lsUbShmsBF
 LRSkN4V1Ncja7l52BxbRotLK2kyyHdc80JZDtiU4kmc6K+2VpliiBQu11ex6T7C8lkle
 zFwlLvz3+nNfI6B4YJojtPuniqoVGMDS5wHgjEqwBcZ1GlwNOqnNUOUVaBlsUQKQHjcZ
 x1NeqHBSiJVVnfh0AeoFh8+k8Jconj4H3DTjQCl8CkbgnT01tMUMVt9Pu0YnhnGur6y5
 t2IrX5tezeWlAPBtu5ZKsGtdXOYmC2vslGKkR7VJ1dx0Kq81tyzbEuIrWDoyLExHjcLR
 7fJw==
X-Gm-Message-State: ACrzQf1IgckC+X9StJp9cM8S1EGoOcVvBgPnHq0XflRX84Qush+KzRdh
 +Ge6EHeRC7AM5vTH9pma37y8USpv/x4TOb01fhJ5a4UZO6cqVQ==
X-Google-Smtp-Source: AMsMyM5neaw+saUn4Q9YsNtMvkXwR/Rywu60EZ/A+Ul+OJwCFGLkG9zxRuM0fhUbzR2XjAyg8g1hPtq4W+ghEYCsS7w=
X-Received: by 2002:a05:6a00:1389:b0:566:1549:c5bc with SMTP id
 t9-20020a056a00138900b005661549c5bcmr10871100pfg.8.1666217543134; Wed, 19 Oct
 2022 15:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20221019220019.8418-1-moritz@h6t.eu>
 <20221019220019.8418-2-moritz@h6t.eu>
In-Reply-To: <20221019220019.8418-2-moritz@h6t.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 19 Oct 2022 18:12:10 -0400
Message-ID: <CADvTj4rBgVG3FYMeT1DO_83w5JCJm8hAVZBKf6gq93SzEwpPdg@mail.gmail.com>
To: moritz@h6t.eu
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kbnesjMJ27lmErsGDoCuiToE/nbOMfN9RTC+pLh+fDM=;
 b=mQBd4YOAzzu8xY6X1tEfRxIvamX7zgjUxfp7Pi/seqmuQtylJch30iHTLsXfCxLiIb
 3HkjxrSl/tm4NBJsY4NA5UNTs/WzPg5J2YbBTu1vbmRG6AXInaPrVocnrYBODYZVMXRL
 jtMIoHUFtUG3JGRaOdZaW/afubcGfBDRapknNRYNG5Ywz2G4m9y6s9wZq3oCfCMrc8hp
 oK8vXX8VoUV6BlfAJeISJ9cKf/4KfpYgl73ghL2Yot/w9KFqr8OE92FrSabHdxSOquNT
 gdP7pQ3A2SeZOW9+M8RKshSFVUg5yfcNByhVbEaIcJ1Oxt6vK84ZC/N/78oHAiINUt1T
 aR2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mQBd4YOA
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

On Wed, Oct 19, 2022 at 6:02 PM Moritz Bitsch via buildroot
<buildroot@buildroot.org> wrote:
>
> From: Moritz Bitsch <moritz@h6t.eu>
>
> The cargo --release flag is used to create optimized builds, not supplying
> --release has major performance implications.

Is there an env variable we can use to set this instead?

Some packages use cargo without the cargo infrastructure, for example
we have a number of pyo3(https://pyo3.rs/) based packages that use the
cargo env but not the cargo build commands from here.

>
> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
> ---
>  package/pkg-cargo.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index f7e3f39503..e0556252fa 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -119,7 +119,7 @@ define $(2)_BUILD_CMDS
>                 $$($(2)_CARGO_ENV) \
>                 cargo build \
>                         --offline \
> -                       $$(if $$(BR2_ENABLE_DEBUG),,--release) \
> +                       $$(if $$(BR2_ENABLE_RUNTIME_DEBUG),,--release) \
>                         --manifest-path Cargo.toml \
>                         --locked \
>                         $$($(2)_CARGO_BUILD_OPTS)
> --
> 2.37.3
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
