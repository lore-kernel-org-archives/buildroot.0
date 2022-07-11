Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D417CC43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 13:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 412D260ED5;
	Mon, 11 Jul 2022 13:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 412D260ED5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jnVa4AOv7k8O; Mon, 11 Jul 2022 13:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C5BB60EC5;
	Mon, 11 Jul 2022 13:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C5BB60EC5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1854D1BF20F
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 13:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5CC44155D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 13:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5CC44155D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p1i_h7dj9jaD for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 13:29:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCF3141550
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCF3141550
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 13:29:11 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-10bec750eedso6666641fac.8
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 06:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jQe/XzN1poae8HgU6HOkIlfsaKZxwr3+2z96YRx7nDQ=;
 b=cSjSKYGmWO2+xh/TVkFhebn98eIjZKakn80dDclDCPu0vmYvwyjR0QC8yDAooxkqON
 v+G4aNFXW+g6JoEzzN3dzoj2031BAogdEAzFnto1eqMzdjzXpBdOL7XGnrt+ck6CJpV9
 t6jFM692l5I6Oexq2axhbQ5MrnUwwTJtD9mZ4g7hMuSLvFZk4N5Fk8WxOUS7iw2jSQbt
 oD9iSWxnd91+S6rHQkaSAbR3LxTcfiLbHyeQq2KzLo3hiZQtljyadhmbzuVTbMkBPZr7
 VAs8GNAE7qOv00HrDJJUaCgp98nLcGbSgBCTMDHm8tqS36uRnLwbVbXOxD0NUgC5PykV
 3PmQ==
X-Gm-Message-State: AJIora83Ha0xW2NShtszN5aD02BZSXWB4/HVNSwnxQ0jGd7WQTOK2olB
 suDIS/KBowTPZdBUPuBXDkceaqQrkDXzvtJky9nAYkzu68E=
X-Google-Smtp-Source: AGRyM1uo6sovpuSMSTf6aPbHz3Z0WWb2Z0nHJz0HFWZqjcwT1f1vk9NxwX8f77ebjWT/lNbY56+xtG+6s7mZQsraKFs=
X-Received: by 2002:a05:6870:d0ce:b0:f3:3856:f552 with SMTP id
 k14-20020a056870d0ce00b000f33856f552mr7534956oaa.99.1657546150672; Mon, 11
 Jul 2022 06:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220711130054.110406-1-foss+buildroot@0leil.net>
 <CADvTj4rXHbym30M=8wypZSC6GeH++C-h1OHcd_7O44eWC+pUhw@mail.gmail.com>
 <a2c47071-f64f-356e-31f2-4eecf7c3fb27@theobroma-systems.com>
In-Reply-To: <a2c47071-f64f-356e-31f2-4eecf7c3fb27@theobroma-systems.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 11 Jul 2022 07:28:59 -0600
Message-ID: <CADvTj4raCkFMggd_Z3ye36q_RYNMn8wzKSbzAumq5M-zL8AmSg@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jQe/XzN1poae8HgU6HOkIlfsaKZxwr3+2z96YRx7nDQ=;
 b=LD7WNI1VGkK1Xyd545T+DinaTFMV8L2f+TeXHp5Fbohjf3nl9MqAEdQQDd5afGbS1H
 m9iBtTUaJXovqzzCRH+yzuHfKswOhmUbjmarVdLpon72kYK3tpzPwnL0sV1ghwn778hP
 JimWk+92OwrCNDXWZJCITzYFEJPlenki+4e9w8drAalOUm5G0rIZvTB7UpxODIcinYhC
 6VK2KdpO5RZ6mSxwSzHQtXWN0QVoyPzoUTmoNgnKhjqsdc7iZJ7ODlhC2q6vvJAcF5EU
 BtrYWpdfIPPMtTBWWtqsC0sp5mTG6Fc9pYP6AATz7ByTaztU2OF6SR1axcI/IgJ+CmS3
 FdeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LD7WNI1V
Subject: Re: [Buildroot] [PATCH] package/libcamera: add explicit dependency
 on libevent if libevent package to be built
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
Cc: Quentin Schulz <foss+buildroot@0leil.net>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jul 11, 2022 at 7:11 AM Quentin Schulz
<quentin.schulz@theobroma-systems.com> wrote:
>
> Hi James,
>
> On 7/11/22 15:05, James Hilliard wrote:
> > On Mon, Jul 11, 2022 at 7:01 AM Quentin Schulz <foss+buildroot@0leil.net> wrote:
> >>
> >> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> >>
> >> The cam application requires libevent. Since there's no Kconfig option
> >> for it, cam building ability is checked by meson build system by default.
> >>
> >> If libevent is present in the sysroot, cam is built.
> >>
> >> The issue is that there's no explicit dependency on libevent in
> >> libcamera package. This means that it is possible for libevent AND
> >> libcamera to be built, but have libcamera be built before libevent.
> >> Meaning that even if all requirements seem to be fulfilled, cam still
> >> won't be enabled in some cases.
> >>
> >> This fixes the possible race by expliciting the dependency to libevent
> >> if the libevent package is enabled. Otherwise, explicitly disable cam
> >> building as it's already known that it isn't going to build.
> >>
> >> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> >> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> >> ---
> >>   package/libcamera/libcamera.mk | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> >> index 41d6a5abef..78243add18 100644
> >> --- a/package/libcamera/libcamera.mk
> >> +++ b/package/libcamera/libcamera.mk
> >> @@ -84,6 +84,12 @@ else
> >>   LIBCAMERA_CONF_OPTS += -Dqcam=disabled
> >>   endif
> >>
> >> +ifeq ($(BR2_PACKAGE_LIBEVENT),y)
> >> +LIBCAMERA_DEPENDENCIES += libevent
> >
> > You should also explicitly add this as autodetection logic may
> > otherwise mask errors:
> > LIBCAMERA_CONF_OPTS += -Dcam=enabled
> >
>
> Where do we draw the line between implicit enabling of build options and
> adding a proper Kconfig option? Because if the list of dependencies for
> cam increases, it'll get less and less obvious to the user how to enable
> cam support without reading the makefile of the package.

It's somewhat subjective, but generally if a feature is useful based on the
presence of a dependency auto-enabled via makefile is generally ok, provided
that it doesn't trigger a build time behavior change that can't be modified
via other means like overriding a runtime config via overlay.

Enabling/disabling via kconfig is usually needed when there's either a
behavior side effect for enabling an option or if one is using selection logic
from another kconfig option to enable something, but then things can
get more complex as one must ensure indirect dependencies are also
correctly propagated.

In general if one has a valid use case for enabling/disabling an option in
the build separately from the presence of a dependency then it should
probably have a kconfig option.

>
> But adding this line to the makefile makes the maintainer's life easier
> as it'll fail to build next time there's an upgrade and cam has added
> dependencies. So that's already a win :)
>
> Thanks,
> Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
