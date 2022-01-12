Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9EDC433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 09:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93D466FB88;
	Wed, 12 Jan 2022 09:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hdYFjK0BWEee; Wed, 12 Jan 2022 09:11:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8E6E6FB86;
	Wed, 12 Jan 2022 09:11:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D8A41BF86D
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 09:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B9AD6FB86
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 09:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEFRvEmYEOAJ for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 09:11:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E40DB60087
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 09:11:42 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 h20-20020a9d6f94000000b0059100e01744so1839167otq.4
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 01:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fMaCdCLlZudNqvQs9+SOeyhfklB/XBqw2e1yDIqQAxk=;
 b=L7nbZ6HpoVFwMjrdaQrcliuNPNUHNXKEpC6SPiud+0zzgbb0ihetLuRbp2sSEY1EHO
 5WQcNf1fCSM1xDfMC/t5ba17eVSt3af9GIrx/d8Jd9AmQEMAbb11YSuqnfRqURyt40ir
 t0qOc1dTgjDXPDd6LOvDkNruYVAI0F43oLCmIICa2P5TEyZT0yBvvm8EtgL+nmBwZdzn
 UEKRK3K0B8p2NIs15FSVPVVkLESLAwf6RJuqeL7RDym1np1nTtRSBrGmWljsugyuCiaW
 xgq71ZJYgMO86DunV44c+/8HkVqjVG+MmjkhTUGQ1MrU6RIHUsdra8zgAXuc3roCox4i
 2HPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fMaCdCLlZudNqvQs9+SOeyhfklB/XBqw2e1yDIqQAxk=;
 b=b7EWoryBzx7VMlmqGGlczlnI2lyFLrpqFFB6lKyvSl01I1T6bs1hGF5Rvp4rY+SZnu
 8+OMZnJAWI4qi3OAwLIN6gfeK9T81/scn/yECAiIepCFJfivT4/D52q2bTblVxU8IqCu
 2z6R0nhpxuTNbJNinoKoXcCx5kkh5hjSpYT5ysRFj5zxAThHOGlHlzpW+44mSWat85jx
 uTOZL+gumEum9pWu0+aKC6JI8HuHezyM4GeWJ7eNpilOaJyJmAnqIGdSaEx5L5Mn6Mex
 /54rmLP6V4oGP+MWwsrN2G7H2K3sMFwXigUV6NzdBt8tPsk9XIP53KO+KmEkiaNX8I4v
 f+5w==
X-Gm-Message-State: AOAM532Zp07EWhNVRBtLbFYa1WvyEcSsHzBaSdGyJj4DCVyE2/2NQV9x
 TSbVFIsHDvqfe5s0IlKYs0RLGDJK4xRe+v33Xos=
X-Google-Smtp-Source: ABdhPJzaWEhcusyVH66oPABiDPxCX6q9OmAJJ0ren0S7+c/5N0VX0W47U6hlOUD7B1IoRl198Ws3S27mw1cFHCgl6Sg=
X-Received: by 2002:a9d:70cc:: with SMTP id w12mr5927449otj.30.1641978701566; 
 Wed, 12 Jan 2022 01:11:41 -0800 (PST)
MIME-Version: 1.0
References: <20220110211323.1828141-1-james.hilliard1@gmail.com>
 <20220112091058.76318df8@windsurf>
In-Reply-To: <20220112091058.76318df8@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Jan 2022 02:11:30 -0700
Message-ID: <CADvTj4omd4djciRXv6gia_2xDBQtKfknmbQ5-MnbXhWMxOESzA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.61.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jan 12, 2022 at 1:11 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Mon, 10 Jan 2022 14:13:23 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/meson/meson.hash | 4 ++--
> >  package/meson/meson.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
>
> I am wondering if this update hasn't broken some meson packages:
>
>  * polkit
>    http://autobuild.buildroot.net/results/b2d/b2d2b27844b32b3609e11005966d85dc0dfb7a9f/build-end.log
>
>    ../output-1/build/polkit-0.120/actions/meson.build:3:5: ERROR: Function does not take positional arguments.
>
>  * host-gobject-introspection
>    http://autobuild.buildroot.net/results/95e/95e4a23c16f6bd96566dc497663f38a0858c5a6e/build-end.log
>
>    ../output-1/build/host-gobject-introspection-1.68.0/giscanner/meson.build:51:0: ERROR: File doctemplates does not exist.

That one should be fixed by this update:
https://patchwork.ozlabs.org/project/buildroot/patch/20220112012537.1362197-1-james.hilliard1@gmail.com/

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
