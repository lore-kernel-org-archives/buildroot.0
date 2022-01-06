Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F72C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 19:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 624EC6FC25;
	Thu,  6 Jan 2022 19:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pu2p-pml1ZTe; Thu,  6 Jan 2022 19:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6FAD60D93;
	Thu,  6 Jan 2022 19:15:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE7C81BF409
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC01760E07
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqfqbL2U-aM1 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 19:15:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CC0760C12
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 19:15:12 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id v6so5054559oib.13
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 11:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oja4L34hoUG9uY4Ixo8SPJqTWQ3XTx396IKqEIvNTeE=;
 b=EPDwCOKKQZJa/+Hm2u73hK8Nq4SV0QrOrQSb0Ps7MbXrCg3MfyTgWIJP7kVeSiNlKQ
 LOTZ833pJIDEQo/uVybY3lHqtGtYCMWxlx8nmyITTQo8mFKJfkE9Iatyg914dVHkGYMx
 1XE3H2Q39f8j0ZB5MVy8ft7hwWKpc3+wVfpWmJciYwRTDFBl4+LgYjFwjmNOe1N3aJGl
 5iFjZawX7dbLRrzHCYYOeiXLePyBO9M1UXLp91ACKzVMttDk8O7C6OIuGOIyFQ8aol+K
 O5wIYt/2GGUUFkr3oXZODAKudNOOGnHOLHO8QILA5CZlcXf/S16tSZkp4eodGNlwqcd9
 qR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oja4L34hoUG9uY4Ixo8SPJqTWQ3XTx396IKqEIvNTeE=;
 b=pnnA1icm9nRx6r/7w3A3TRM+FWUMtvAZJ2J2/T68phwNeRpX6vAZ2sVcPP+E7DVS59
 +dt1RsM/nVc9dtg6RRNPm1QuxNxEHYueffWo3qfDLHXE9O0Pe4XCEonD6wFS0c61MkIM
 BELZaF6iPAUFHvHyzH82uzhTMePGm5CMoq4huemUZME9t4MtEwZud08nRy8M7wCuS43X
 TFHtTVfWUsq17sLgzGgb43MGkutP01c5h5Kk2jNz2Cy8+i0khrF5iITmXQRSCquUACpZ
 jmje+w6Tu6Q6vbg/zbho/aH2MRERAVCBUR+N6ZUgO9pGA95II7yqiKByPS3fyeqbvF+6
 1OqA==
X-Gm-Message-State: AOAM530SCRcqSGW3E8P8EqGcwHmmVP2lmNOeYYzT0wLwquDjQk/FaXtG
 7z0YeC4tK09WVbQMR8dildtIhdXPeEHlVLJlNwY=
X-Google-Smtp-Source: ABdhPJypjjbHBsRRbRvQJmEqP3neDVYpx8gbmyY6c+m0kpO4rckvxYey8AZ+pqqpQ/aBDwGlGc0vaH6v5r/Tgw8pZIA=
X-Received: by 2002:aca:ebcb:: with SMTP id j194mr7090845oih.67.1641496511615; 
 Thu, 06 Jan 2022 11:15:11 -0800 (PST)
MIME-Version: 1.0
References: <20220106062407.3131530-1-james.hilliard1@gmail.com>
 <20220106185923.0cb1bb9c@windsurf>
 <CADvTj4q5R0TweMiHhtk_7XM6XT3u5mQ3_TF+m_M_D34Or6r1iQ@mail.gmail.com>
 <de9d6912-6bbd-4412-47f7-094d1ea7fe0b@mind.be>
In-Reply-To: <de9d6912-6bbd-4412-47f7-094d1ea7fe0b@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 6 Jan 2022 13:14:59 -0600
Message-ID: <CADvTj4otRbTpruWEZF=FcYH20x72_wi98A2_WTDYzSKH0Q0mrA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v2 1/4] Makefile: only check
 _FINAL_DEPENDENCIES are selected
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jan 6, 2022 at 1:07 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 06/01/2022 19:51, James Hilliard wrote:
> > On Thu, Jan 6, 2022 at 11:59 AM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> >>
> >> On Wed,  5 Jan 2022 23:24:04 -0700
> >> James Hilliard <james.hilliard1@gmail.com> wrote:
> >>
> >>> _FINAL_ALL_DEPENDENCIES includes _FINAL_PATCH_DEPENDENCIES which may
> >>> not need to be selected in kconfig in cases where building is not
> >>> desired, so only check that _FINAL_DEPENDENCIES are selected.
> >>
> >> Could you expand the commit log with some specific details of which
> >> packages/dependencies are causing issues? I haven't followed the
> >> problem and it's not obvious to me what this patch is fixing.
> >
> > It's needed for this series:
> > https://patchwork.ozlabs.org/project/buildroot/list/?series=279567
>
>   Well, obviously, since it's part of that series.
>
>   I think the patch is wrong though. A patch dependency is still a dependency,
> so the package should be selected.

Well I thought selection was to enable a package build, I thought selection
was only for packages that need their build executed.

>
>   The problem is that you add two target packages which have no Config.in. That
> is simply a no go: target packages should always have a Config.in symbol.

Well we don't want to actually build the package, only extract+patch
it, I wasn't
sure how else to do that.

>
>   I'm going to reply with more explanation down the line though.
>
>   Regards,
>   Arnout
>
> >
> >>
> >> Thanks!
> >>
> >> Thomas
> >> --
> >> Thomas Petazzoni, co-owner and CEO, Bootlin
> >> Embedded Linux and Kernel engineering and training
> >> https://bootlin.com
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
