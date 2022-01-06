Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFC3C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 19:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82E39400E5;
	Thu,  6 Jan 2022 19:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_qi322crdbj; Thu,  6 Jan 2022 19:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A1ED4019A;
	Thu,  6 Jan 2022 19:23:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E5941BF409
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C7966FC1A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PSSI2kzlpTP for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 19:23:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7692B60E07
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 19:23:45 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id v6so5087157oib.13
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 11:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ls9Eew5Jo8ZG/dGb8PPjyxJgIXpH97KERrB7s7M4TOI=;
 b=H3CYH7iglmGm/JLM7KZspYOTKOnRtuYMjMOU+UW46jBj6Iox3zWMCBriVEgk3EH4U9
 2a6ELeMGAyCiOyHiOQJ/MR56LA0b5JveXCsD/kF1rP2SrDVIAOcu35R7bAesa/ph1n3P
 M4kB9IW9yRsfv+nLdBkkN7KdMx9ekzAfiNnjas3gR9wSlpZqB2pcHhRpLj5SBiVeBwvC
 tqEy+6vXz7dwvxiBUGxNnRxo2dbL0GTEAGm0p3a/DRpPySWPlSUtuZ5Zz/0FKkhbXLNx
 wvfXpyX1Mcva882vHPbK9OPHPPjRr8uI39POQp+pNdH63OU+L/nAKK9R/oY4DX4unPP1
 tg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ls9Eew5Jo8ZG/dGb8PPjyxJgIXpH97KERrB7s7M4TOI=;
 b=lsekG4yDFfrLymi3ysL2R5pk3LJpI96ar3OYUIaWmZ63+Rh9F2mOENAvDcJKJHOlsg
 r+9IoMebkW0ONKskNIkvs0uAREzdpCAwor+2ZnfJNxb/4sexTloCXh/5EOZm/GqQJnC0
 ln/hVu+PB9hlGvOcr2EuRLzZxh0XUYTWD3+hHDrqBY/ldT5Px6K8THbLBmrpJpTMtJf4
 XWDhSU6+JxabuhwrUTvD6IwzBlsiBlfunLiJZB5T0Ngy+B8SSt39JroZ5+dmGMoRZI1v
 Aio4pi0L74xWsZdDyrjvEGFHKKmq6NuUJ+SQqQRnTnmIzUPBWzhnMOD6499qiCrQ8l8X
 WlZA==
X-Gm-Message-State: AOAM533fWybI2i7q7u2clxQHB651/WWEvEkclWdOIBkTXxPqQXqto0n2
 doLhB6xeHmz6SH21l7m2ibHGHBZYi0oAp8uoYKI=
X-Google-Smtp-Source: ABdhPJy68rSDkt/PyrBNjDm0+WJ/gUxUrjJ/7WA8Z2zIP7vN74j0dVxKD6eNmN83y8OhMlGW0k7DOS32z+GoQ2ajbJ0=
X-Received: by 2002:aca:ebcb:: with SMTP id j194mr7115203oih.67.1641497024517; 
 Thu, 06 Jan 2022 11:23:44 -0800 (PST)
MIME-Version: 1.0
References: <20220106062407.3131530-1-james.hilliard1@gmail.com>
 <20220106062407.3131530-3-james.hilliard1@gmail.com>
 <a491140e-465d-b739-8d6f-1bf0b23ef046@mind.be>
In-Reply-To: <a491140e-465d-b739-8d6f-1bf0b23ef046@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 6 Jan 2022 13:23:33 -0600
Message-ID: <CADvTj4q77LimfgnAwHfoyzH=W09FoQ9_o33vbfhGhbjrD28cDw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v2 3/4] package/qt5/qt5webengine: bump to
 version 5.15.8
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jan 6, 2022 at 1:13 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 06/01/2022 07:24, James Hilliard wrote:
> > We need to switch to the kde upstream as the existing upstream no
> > longer updates the qt5 branch for most packages.
> >
> > We need to add a separate package for the chromium submodule so that
> > we can apply patches for python3 support to it and replace catapult
> > with a python3 compatible version.
>
>   Creating a separate package that does nothing more than download something
> that is later copied into another package's subdirectory is not the right
> approach. For this, we have FOO_EXTRA_DOWNLOADS, which can be followed by a
> _POST_EXTRACT_HOOK to graft it in.
>
>   So what I think you should do is download both chromium and catapult with
> QT5WEBENGINE_EXTRA_DOWNLOADS, then remove the directories in POST_EXTRACT_HOOK
> and untar the download over it.
>
>   That would vastly simplify this patch as well...

One reason for doing this approach is that the available patches for
adding python3
support to the qt5chromium-webengine tree apply to that dependency rather than
the parent qt5chromium.

>
>   Regards,
>   Arnout
>
> >
> > There are python3 patches available that apply to this version with
> > minor modifications(to be added in a future patch).
> >
> > We need to set QT5WEBENGINE_SYNC_QT_HEADERS = YES as we are building
> > from a repository archive instead of a release archive.
> >
> > We need to add some new required dependencies to qt5webengine so that
> > it will build.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/qt5/qt5.mk                            |    5 +-
> >   .../qt5webengine-chromium/chromium-latest.inc | 1257 +++++++++++++++++
> >   .../qt5webengine-chromium.hash                | 1256 ++++++++++++++++
> >   .../qt5webengine-chromium.mk                  |   22 +
> >   package/qt5/qt5webengine/Config.in            |    2 +
> >   package/qt5/qt5webengine/chromium-latest.inc  | 1000 -------------
> >   package/qt5/qt5webengine/qt5webengine.hash    | 1001 +------------
> >   package/qt5/qt5webengine/qt5webengine.mk      |   30 +-
> >   8 files changed, 2561 insertions(+), 2012 deletions(-)
> >   create mode 100644 package/qt5/qt5webengine-chromium/chromium-latest.inc
> >   create mode 100644 package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
> >   create mode 100644 package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk
> >   delete mode 100644 package/qt5/qt5webengine/chromium-latest.inc
>
> [snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
