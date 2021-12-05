Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB458C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 11:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C13C4040E;
	Sun,  5 Dec 2021 11:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id otHKQR-5f22l; Sun,  5 Dec 2021 11:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 454F54038A;
	Sun,  5 Dec 2021 11:15:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16BC21BF27E
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 120584038A
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lZCKa9jXk0Gn for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 11:15:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEA2440155
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 11:15:11 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 h19-20020a9d3e53000000b0056547b797b2so9820413otg.4
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 03:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WMOjHAzOi+4UDtvUeZZ/EkAlk7A/9AKVm4ezArh0OF8=;
 b=eZPGJ6P7UHX5v4iIAgsy7fyWdM08WWhL+nipxauVVWP20iJRB4UQMiPLBqf019w+H2
 81fiDPcSzmrh3LrMLUUuqdVbEzbzKKIg1AL9PLDoHDm7w+izxsYK5/kZEHUMvHjA+ntQ
 wbb5xFA9qNRRNCrAvs3ruV4PiXgEgDKw98YbvrAhIyz24hGFBqOJU6/TihnbCP0ECJuQ
 892/8v5DSfxqMZLj8OXVAqocYfXdcE6QTtCskU9jaOhvTwlKpdy6+1df8IppY8p2PMgJ
 ICW+eU5R5s/6aI92Hqyu7Y+37e8o7XxiidbU1R30o1ErF5b7DF52VQ9a+RcJ+FSyytbN
 Z/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WMOjHAzOi+4UDtvUeZZ/EkAlk7A/9AKVm4ezArh0OF8=;
 b=plNpj+DfZ6hu40pQmPMFFHx+LE1opQURiC2oxmE7tLbRE2pG8ISJXLdv3omoPNbsa2
 7GgROv3dAV5UQfWiKHk2mcd4NrNICCvxqHdWygN79czHNBK1QO/Sktz4GNeycZaVvTKL
 ISv+7sqYr1b4AN3jshadN2Hot2D/Y4Jspg+Og/iJEqdRVneMjMT8YB42lDV2hfEkAUqx
 Ddbyt8FvCC1TjbWzuhBMgGhYnMnLp/cK51KM7GnLeNz2wSHpJbdrD2uCH1zpzSh66CVV
 WU4tvxgDUAU0bBUZFmPlpCImsZNLjZtpswI+cdi+J/Y/rAU5TeM0mJASxjxdUUcwtPm+
 G8WQ==
X-Gm-Message-State: AOAM532ezM1vVWLk5ldRXsuAhRj5Mw1yoPFGwTPSlFQq68LUZqEjixSD
 f4iLOpviUrKBTHXy7NsESMRdFDZGjxlzTNCRvOjcFoV7pjM=
X-Google-Smtp-Source: ABdhPJz2+X2S3X8HVn41VX2S7MD1S9Kmih7fl1ZYtp0sJe9HOdvE443lQnbghWzJdTPbfKPIZBiSncmQcaMKMK1ucRo=
X-Received: by 2002:a05:6830:2aa7:: with SMTP id
 s39mr24975690otu.151.1638702910730; 
 Sun, 05 Dec 2021 03:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20211205005412.2888068-1-james.hilliard1@gmail.com>
 <20211205005412.2888068-7-james.hilliard1@gmail.com>
 <20211205110914.2dbbf237@windsurf>
In-Reply-To: <20211205110914.2dbbf237@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 5 Dec 2021 04:14:59 -0700
Message-ID: <CADvTj4r5WUxLd9Fx1e=KuKCwAk_N-SEzZmGKoRYX0eFPVvg85g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 7/7] package/network-manager: add
 optional systemd support
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Dec 5, 2021 at 3:09 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Sat,  4 Dec 2021 17:54:12 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/network-manager/network-manager.mk | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> > index 14bf0d4dd1..7a268d72c8 100644
> > --- a/package/network-manager/network-manager.mk
> > +++ b/package/network-manager/network-manager.mk
> > @@ -112,6 +112,21 @@ else
> >  NETWORK_MANAGER_CONF_OPTS += --enable-polkit=no
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > +NETWORK_MANAGER_DEPENDENCIES += systemd
> > +NETWORK_MANAGER_CONF_OPTS += \
> > +     --with-systemd-journal=yes \
>
> =yes not needed
>
> > +     --with-config-logging-backend-default=journal \
> > +     --with-session-tracking=systemd \
> > +     --with-suspend-resume=systemd
> > +else
> > +NETWORK_MANAGER_CONF_OPTS += \
> > +     --with-systemd-journal=no \
>
> --without-systemd-journal
>
> > +     --with-config-logging-backend-default=syslog \
> > +     --with-session-tracking=no \
>
> --without-session-tracking
>
> > +     --with-suspend-resume=upower
>
> Are you sure about this? We don't forcefully enable upower when systemd
> is disabled, so is this working?

Should be the default for non-systemd installs:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.32.12/configure.ac#L494-495

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
