Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB8DC67871
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 09:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F046D60E07;
	Thu, 27 Oct 2022 09:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F046D60E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDR9Dmzqonyy; Thu, 27 Oct 2022 09:58:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2397460BF4;
	Thu, 27 Oct 2022 09:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2397460BF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97F701BF2CB
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 09:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7349981350
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 09:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7349981350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQXmUE_owaNZ for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 09:58:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6590A80FB2
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6590A80FB2
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 09:58:14 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id n7so918840plp.1
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 02:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AhnYd6O17lTlfkK2G3+CdELDnu8b8tyjJuusu+spduY=;
 b=JSUmDzZGOFSChuYQa+kQprAJ2wW4iXWLaYUnAod48WFqHuRiaVIex5iUyz3ikwRuUM
 yhaiVsTLIJczRlGOv4r/r96jmwJorz8I9Bzaqy5Uyq7qtGfZn97lSUweOeC81MZ11LBD
 b6Ruf8/f44kWmeACnRAEpvEX4R1d0eIoz3InkYgwMMPddmW2RgKXR3iz6EzluZntDXEY
 Hp/IbAEWtRc7Pjt87vE5q8V0vYwYEm3ArHzMGTdQjKbPGf5CMk5DyqHXaGjq1G1ZR/rp
 HoUd8LGvZ0U0tLIaXE72uLhNFK5sWZ14A2QVNDPGmvwo1lH7o8+gXrO7B7lnnEzZBCXS
 66PA==
X-Gm-Message-State: ACrzQf23Ekscmj16GZ2UxZVoR0UbyWwue5uPGU1s3U2Zs4kBexfW7rhk
 C5khlJjlevHaPlDsputEQdMXiBiyiiNlR3m6y/f3tmuK
X-Google-Smtp-Source: AMsMyM6Hc/k7SeBroLQ2Akrtr49zMvmbaoYb8FFrfduW56/4GVJy0rVOWtZ1b4q4iWEhZtmr+IP63BIj+GHEPRHvyVg=
X-Received: by 2002:a17:903:40cb:b0:17f:6e08:6eac with SMTP id
 t11-20020a17090340cb00b0017f6e086eacmr48779565pld.80.1666864693860; Thu, 27
 Oct 2022 02:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221027085628.102086-1-robimarko@gmail.com>
 <20221027115529.0ac5cb5d@windsurf>
In-Reply-To: <20221027115529.0ac5cb5d@windsurf>
From: Robert Marko <robimarko@gmail.com>
Date: Thu, 27 Oct 2022 11:58:02 +0200
Message-ID: <CAOX2RU5mJ5bD76Qu8KMR8LgS2sYzGCNER41cMvXNpfJtpZhVng@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AhnYd6O17lTlfkK2G3+CdELDnu8b8tyjJuusu+spduY=;
 b=SfXbH786S3ALnuwc97XEk5L08zo1nDc8gLFLwW1iBS7weyOImfZiHJGJoBUWDkMK3J
 xnYOs12LTjvs7dYAAfJkTLn//gCQNBLAW/L4fDceiBZanJMJZ+6udtFly8nFI8qGcar5
 Kkh5eAZkzOz/Zi9TqQ39oU3jS/o18h/1HmlpPFxUYXyi5fef2BP9O6WJn1R6rwRMXQd3
 elGZYB7Xqs2QmuBo/rgwBBDu2ZSO3e2UExeiqu48EwkzN+XvQUT3ZW3Q72QlF/6pvnYu
 BNyDzLJe7apOlwd7qGBrtL4LjIXhTMwU7weU9T+WMpFnw0qnKqmgV7j4s+MjjJbW9Mds
 7jzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SfXbH786
Subject: Re: [Buildroot] [PATCH v3] package/mdio-tools: new package
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
Cc: angelo@amarulasolutions.com, yann.morin.1998@free.fr,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Oct 2022 at 11:55, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Robert,
>
> On Thu, 27 Oct 2022 10:56:28 +0200
> Robert Marko <robimarko@gmail.com> wrote:
>
> > mdio-tools are kernel module and accompanying tools for low-level
> > debugging of devices attached on MDIO bus like PHY-s, switches etc.
> >
> > Userspace tools provide C22 or C45 reads and writes, benchmarking
> > and even dedicated Marvell Link Street tools via the included
> > kernel module.
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
>
> Thanks, I have applied your patch, with two small changes. See below.
>
> >  package/Config.in                  |  1 +
> >  package/mdio-tools/Config.in       | 10 ++++++++++
> >  package/mdio-tools/mdio-tools.hash |  3 +++
> >  package/mdio-tools/mdio-tools.mk   | 20 ++++++++++++++++++++
> >  4 files changed, 34 insertions(+)
>
> The entry in the DEVELOPERS file was missing, so I've added it.
>
> > diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
> > new file mode 100644
> > index 0000000000..8a09bf19a7
> > --- /dev/null
> > +++ b/package/mdio-tools/Config.in
> > @@ -0,0 +1,10 @@
> > +comment "mdio-tools needs a Linux kernel to be built"
> > +     depends on !BR2_LINUX_KERNEL
> > +
> > +config BR2_PACKAGE_MDIO_TOOLS
> > +     bool "mdio-tools"
> > +     depends on BR2_LINUX_KERNEL
> > +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
>
> We like to have a Config.in comment corresponding to this dependency,
> so I've added it:
>
> +comment "mdio-tools needs a toolchain w/ headers >= 5.1"
> +       depends on !BR2_LINUX_KERNEL
> +       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
>
> And I know I realize that the depends on !BR2_LINUX_KERNEL should have
> been a depends on BR2_LINUX_KERNEL. I will fix that up.

Thanks for fixing it up, it is my first time contributing to Buildroot
so its all a bit
new to me.

Regards,
Robert
>
> Thanks for the contribution!
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
