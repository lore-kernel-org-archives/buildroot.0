Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D1EC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 08:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C548F8138A;
	Tue,  2 Aug 2022 08:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C548F8138A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVzqRU_A5NTA; Tue,  2 Aug 2022 08:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D764B81384;
	Tue,  2 Aug 2022 08:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D764B81384
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D00C01BF37E
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 08:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB2C960B49
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 08:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB2C960B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2EOBEEatagJ for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 08:49:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21E4F60AF0
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21E4F60AF0
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 08:49:43 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id k129so13858470vsk.2
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 01:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H06h5LiD/3iGr2Ue7HQIyxdBC+0LYg1YW39oMC8jCc0=;
 b=0XTLbjlLMeqDUySEMlr0DCS+3GSvVQ+aAFxmhd9lRW09Hc9lgwrDmPr/CXMYuvOKn4
 OBbh/6hFo9zJSiOb2um8SoAlCFlD7TLLHz1Q6ACT+I2pV73cey4W/FZvXAafE2GevOwH
 gXs03jjcJOkyu6yamJsCNDxRi9qQ8i1MFcb3gehHjA2+YHvdeh7pMk8FL1IjeUiAQZiU
 ve5rRUt0BSLP0pDMbtomGKtjmJmZEj+cYrQzr0DuR6hERFeWI4ujg69eHyCFVSi0JFiM
 BWmUYTwf6W5CngsuztoCeFWz5wuChyH0JGmY1lfrg08IDbvipR9TJbjAagRkx50GQoMb
 c5BA==
X-Gm-Message-State: ACgBeo1ZkuMiOpWHsHwU1AiWVlAnHtPS+tPocpBTPMmd75AT3dKcGVtv
 4U0yTssp4HxoYKTbw26kg2kaznv/qFnv1b4RlsQ=
X-Google-Smtp-Source: AA6agR4SRGmLrmdUN7S1BH6bqoDOftDqakELR+7mZlKGHcUTEnGvVWHsvR5NuZBOsli0A+GbGXLQb7dZ9bOst8YuIs4=
X-Received: by 2002:a67:e11c:0:b0:386:f61:b6ba with SMTP id
 d28-20020a67e11c000000b003860f61b6bamr2781747vsl.27.1659430182011; Tue, 02
 Aug 2022 01:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
 <20220801185444.0f41358e@windsurf>
 <CADYdroMZn_F88AN2qtVbr+54=eAgJ4+e+d2d3_ErcPggynyGzA@mail.gmail.com>
 <20220802104049.560f9001@windsurf>
In-Reply-To: <20220802104049.560f9001@windsurf>
From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 2 Aug 2022 10:49:31 +0200
Message-ID: <CADYdroPfP0DZeHr3zEm052phSmi+iJFUomumySKgcU7JwWXJ4Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=H06h5LiD/3iGr2Ue7HQIyxdBC+0LYg1YW39oMC8jCc0=;
 b=QQRv69SCGrOmbygtUUONiXPk0WgLKqHC7LgOtlXtTnqsnBVUUD5USZXYJISSFqMbXr
 wRfPS21sZx8zqGvuZTIWIhfEDuF5OvnB7romqoW5yIvD29XGyCtdQRUpuXzwj17yMeAN
 DPoxQXH43IY1Qzrqw1iezmjx3z97ypztnznv6vqhNdHaNEsnBh20HBWSiLMsORHeNsJV
 xlg7e3dZK8Z3mObkI3UTtxZ2VyC2p5f2mRzNkMnQUmyFFbXzK8cXqjqDK8a5Tg3kVyl1
 7j0MSnrARSxcqprrZoTUNkpJJocg9ZUQ4TZySIl2aRVdYglCiI4hhF+VBBzbqnIIuRsE
 duaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QQRv69SC
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/pkg-autotools: fix runtime path
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Di., 2. Aug. 2022 um 10:40 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> On Tue, 2 Aug 2022 09:55:33 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > > So I believe we will have to revert this patch, and pass --runstatedir
> > > individually to those packages that understand this option.
> >
> > Sorry for raising autohell, "runstatedir=/run" was somehow supposed to
> > set the default.
> > Arguably the package is at fault, but thats not helping much.
>
> If "wipe" is the only misbehaving package because it does something
> particularly incorrect, I am fine with fixing that particular package
> and keep the runstatedir=/run.

wipe doesn't have a configure.ac and autoconf'ed with a really old
version.
WIPE_AUTORECONF = YES should fix it.

Guess we only know when other failures wash up.

>
> > So far this solution seems to cover all problems:
> >
> > --localstatedir=/var \
> > `grep -q -e '--runstatedir\b' configure && echo --runstatedir=/run` \
> > --program-prefix="" \
>
> Meh, I see the idea, but it doesn't look like a great solution :-/

Never said that ;)

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
