Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD9AC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 12:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B6A60E4C;
	Tue,  9 Aug 2022 12:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B6A60E4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wAnhk3xI3z66; Tue,  9 Aug 2022 12:48:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D7060E39;
	Tue,  9 Aug 2022 12:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49D7060E39
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 658561BF38A
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 12:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F17940351
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 12:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F17940351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DxAxa80vaYE9 for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 12:48:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A2D640338
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A2D640338
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 12:48:26 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id f20so16802813lfc.10
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 05:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3R2sUKT8s8f2WBA98BM2oOrOMC7wUBiBKmn8amZEDwk=;
 b=rd12JS9t62hgJy5itrPEAKbG8aFlPGrKFSTj7ygMMpHGCm/ghhVu/9kvRMYsTSZrAR
 JOvFm/qyPo3s/bNm8WcsD1BBdmwq7N6oiQmlu+paBHvzUV0iXUf/Sc71ltTKNoov3sCN
 zqztvR/Q0Y7mO6kWRbErP43djj2xONbOj5vlool2gXbhP9eckF6B0Fx4Rf7E5MsJ4aDW
 Vthv5kvVYIN+OFfPyvaJk0IIhxivOYoyhItg2TSeTZhJgtFISYq3x4DbKl/FXaEUG1xd
 SchisRSQlWJcNMn3japEKRWHThMePMyTn9t4u5LYlgzPZNzRFWm5N/YA4T0lCAzuknJe
 mA0Q==
X-Gm-Message-State: ACgBeo1Pal1HQMnFbW4rZo/TqUdlBlaalu+vRQO7S3RiG795OpknJxu5
 33PfrGJMaTDKlh+NzFGS/Y2LdVaD3uPDQzOX+Ck=
X-Google-Smtp-Source: AA6agR5OfR+HjQ/iK05bplr58EkwOdfyvp5rggAe3ErCpCXGrd356C6AV3kaern5P6itNFkvf8D8J+FRHKObWVqeHSQ=
X-Received: by 2002:ac2:4f08:0:b0:48b:9580:6c4f with SMTP id
 k8-20020ac24f08000000b0048b95806c4fmr5594295lfr.273.1660049304072; Tue, 09
 Aug 2022 05:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
 <20220809134200.66762b0a@windsurf>
In-Reply-To: <20220809134200.66762b0a@windsurf>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Tue, 9 Aug 2022 15:48:12 +0300
Message-ID: <CA+U=DsrjDECTNWYsgH6VJg7r6kVaidT_Lt64B=YhxcwkwgbOng@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=3R2sUKT8s8f2WBA98BM2oOrOMC7wUBiBKmn8amZEDwk=;
 b=ZpVxwK8U+gbmIOczNUykRY4gZgsft8IdmNUekEvrrx5zO1tPD7f+mfVPCnTyHzs4rZ
 RJGGLnKoq6/nEzbqsnNxuZ0VUkzxyIbKFCERrWI+Ygy+V59p9rMP2yxZt0pHoqrgzfwC
 UVvk4RElV9tNGXHU5ptQ0F1T1fo6Z7oq6cu0tKOI9IMOfL/BaKxQwn7rHRz0+n9Q8NZt
 yEAQ/VOUK9eZvByvg0OnNDvtYZhblyGl87JRLjzTq67qTUAvvUVM5w+mrWY/JswJG1ND
 EONq0UEI/hLE6Ao/5H62VaCr+9KP8ISrRFnYcotc4R1w/vwZOQUOFAPzufOcy4FysFUZ
 7hng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZpVxwK8U
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

On Tue, Aug 9, 2022 at 2:42 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Alexandru,
>
> First of all, thanks a lot for your work on NodeJS. It is obviously a
> complex package, which has already seen quite a lot of effort, so we
> need to be careful when changing it.
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
>
> I will give a test to your patch series and report back, but I'm
> fearing that PATCH 03/18 will break the build.
>
> > That eventually sent me down the rabbit-hole of trying to get nodejs to
> > build for ARM64 (where I wanted it). It seems that nodejs cross-building
> > can be done via their own infra-structure, which isn't perfect, but it
> > seems usable; and it also looks like a good idea.
> >
> > Using their cross-building stuff, has some issues/considerations:
> > * it's easiest when building a 32/64-bit target on a (same bit-width)
> >   32/64-bit host; the host-{c-ares,icu,libuv,zlib} tools can be used
> >   for nodejs' host tools (in their cross-build infrastructure/tools)
> > * when building a 32-bit target on a 64-bit host, the nodejs cross-building
> >   logic will add the -m32 CFLAG, which will mean that the
> >   host-{c-ares,icu,libuv,zlib} tools will be unusable (they got compiled
> >   for 64-bit and are un-linkable to 32-bit binaries)
> >   This requires that the user install on their system the
> >   host-{c-ares,icu,libuv,zlib} 32 bit versions. I suspect that the
> >   BR2_HOSTARCH_NEEDS_IA32_{LIBS,COMPILER} symbols are intented for this
> > * I haven't tried to build 64-bit targets on 32-bit hosts, though I'd
> >   guess this is a rare corner case.
>
> No, unfortunately it is not. A solution that doesn't support building a
> 64-bit target on a 32-bit host is not going to be acceptable for
> Buildroot at this point I'm afraid.

There may be a chance that this could automagically work (64 bit
target to 32 bit host).
I did not test it. I will try to make some time for testing it in a
32-bit x86 docker image.

I figured this may be unacceptable.
The least I was hoping to get here, is someone to tell me what I am
doing wrong with that v8-qemu-wrapper stuff.

>
> I will try to have a look in more details, even though I must say I'm
> pretty hermetic to the overall NodeJS build system :-/
>
> Best regards,
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
