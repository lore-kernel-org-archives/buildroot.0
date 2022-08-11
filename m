Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CFCC19F2D
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 07:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3619140C59;
	Thu, 11 Aug 2022 07:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3619140C59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id to8g232347q9; Thu, 11 Aug 2022 07:48:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BD8D401AD;
	Thu, 11 Aug 2022 07:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BD8D401AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BF851BF28A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 07:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56BE560B05
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 07:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56BE560B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwXrjwXsg7wD for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 07:48:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40FD160B8A
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40FD160B8A
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 07:48:33 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bq11so24509011lfb.5
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 00:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=S7gcIWJdNGOk3457X1O1X+8XCTnRsBWC2AQpmTxHIm8=;
 b=GRY7llwABNMpT4IUkJeCYjN5GqnbzsrrCn8vl3R/egTYY8IOmckb84W2CPkMMuja1e
 9CeBWPReXfOlajpuh4STkVzfRJ755baKnIutyE/mPLVi3yMgPP85Cf0YlGx3UDSqQCSg
 uzy1ZWJcyAnV4NLXemj7DVa+fp/I6x9omK7Js6mYnp73FB8ZQN9d1lVGwLFx9XFHjqwL
 A+4yoliDXSLn5n8eDLquTgdC/VQOGMrX1mMFetX9cdnCY7YTUUiXHihInGrF+Ue3Qbhf
 UxECi1sZ6ZFnm007wIzyfkcwoL4ETcFUJzHT2BG7rH41kerQ8N5j9awniHH2J+IXE9mq
 +wHA==
X-Gm-Message-State: ACgBeo0VyUX28ddqT8Z0Ot8nZ/0ggVtIVVpta9scvq1O7wpfURlVhLD7
 TIZjQIAbj9lcPKVy1KCIPAWitzfAGOV2kX5cUXTZmFUj
X-Google-Smtp-Source: AA6agR4zYrr6bSkTXOukl/zarztlf3qVDzg5aDVfW3kp5QYMca8OSbo5SzTWgvgCPQWfSac9iLRZVemv93PQIn/646U=
X-Received: by 2002:a05:6512:281f:b0:48b:824:9741 with SMTP id
 cf31-20020a056512281f00b0048b08249741mr11439750lfb.135.1660204110907; Thu, 11
 Aug 2022 00:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
 <20220810232323.15c2150b@windsurf>
In-Reply-To: <20220810232323.15c2150b@windsurf>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Thu, 11 Aug 2022 10:48:19 +0300
Message-ID: <CA+U=DsquSpsPiVb5sbNAtiJ6-Rp-NN5O_C2HoG2TXv0E2-QtKw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=S7gcIWJdNGOk3457X1O1X+8XCTnRsBWC2AQpmTxHIm8=;
 b=kvMgkPVteQI0rRhrjymerV7iGS1bsjzce2zHsNV+ZRw48zS5FeXPD78GxNonDbMf8k
 F8NnDfVXtzKwmpg0fxELB+owI7dbO1wTv+wDtJzw14exCb0vtGhjlWdBRlGp4d8I39d5
 6pb8veUqgtopz6nF3R/FKBvpEGD3R/6bfxSUf4iz5bEd+wpVCT3yF6cWhAM/eNfg7u61
 P/Yae8QOflfM3TnNcuvx/DALd2EpXLm/5N+KJXu0n1osHruwNA3TlfN7ZCArAEDBlVbZ
 RdKdZeteJCSOHUXeTxfHLQ8sEH6gQkYnpJEInVofc3ccaFzkdyNgWTFi8xC4249RASYe
 GTmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kvMgkPVt
Subject: Re: [Buildroot] [PATCH 00/13] package/nodejs: rework cross-building
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
Cc: fontaine.fabrice@gmail.com, aduskett@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Aug 11, 2022 at 12:23 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Tue,  9 Aug 2022 10:56:51 +0300
> Alexandru Ardelean <ardeleanalex@gmail.com> wrote:
>
> > I tried to build nodejs from Buildroot master, but I couldn't.
> > It could be that I did not setup something properly with regards to the
> > 'v8-qemu-wrapper' stuff. I kept getting execution errors, when trying to
> > run the nodejs build-tools scripts (see details in the patches).
> > Either the host-qemu stuff isn't working correctly, or it needs some extra
> > setup.
> >
> > That eventually sent me down the rabbit-hole of trying to get nodejs to
> > build for ARM64 (where I wanted it). It seems that nodejs cross-building
> > can be done via their own infra-structure, which isn't perfect, but it
> > seems usable; and it also looks like a good idea.
>
> You could also have a look at the OpenEmbedded packaging of NodeJS:
>
>   https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/nodejs?h=kirkstone
>
> The idea and some of the logic for the Qemu wrapper comes from
> OpenEmbedded.

I'll take a look.
Thanks for the hint.

At this point, I am also curious if we could get away without this wrapper.
Maybe we're entering a point where nodejs' build system is becoming
good/mature enough to not have to use QEMU.

Alexandru

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
