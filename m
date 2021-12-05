Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADB4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 00:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A279E40591;
	Sun,  5 Dec 2021 00:22:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZ5bua6DebFz; Sun,  5 Dec 2021 00:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F374D40589;
	Sun,  5 Dec 2021 00:22:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCA441BF95D
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9BBA401E4
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fu2r57jN3xah for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 00:22:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6534400E9
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 00:22:03 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso8568563otf.12
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 16:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2gXPLyVtLLJALCvELo8OxXgo9PSmdtAD1Sm8wZkzZM0=;
 b=GzK/DxBQlin4v4VlOIyV3SfhBF97j/XGTr+HS0kY2Gg6nw3AMNz1yvjB5oiAq/jt8Y
 l7Scd+3k/+cbv+1YDTEn6vn1xYMQALxa1EhantuhpsLSFB8CVZWD3IYH27frNm0dBeDS
 ngAoWJPKqE1+MJzNMA/vj+nj4YVhqz1UVRkboWgL/y0D7eAFsiUzUtHrW4U7jMM+hiW1
 EUJn8daV/yQjzzjbLPP4MsehT/zynn8ywEWvIilmssNmtq8YrBjJSzqS6yyCYQ5rwzi4
 kkfNxtZpsz4Tq3807eDF8GwP6t/X7DsrHKOCnftMuttl1fKAyTtljf1aDIzZF0m8iNS9
 jgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2gXPLyVtLLJALCvELo8OxXgo9PSmdtAD1Sm8wZkzZM0=;
 b=0P6bh4SPawyobLlOq9LXIr4IsvWhJec/Q4SYdlLEKKfZb8Du6c3oW4de9baTfQg0h0
 swm3wMagRGh6fhpf+A1sQLdt17q2DEnzCVKHIN2j/135bC98T8AuisyXbZFlJ8muUCeh
 jGb9beDg8s+I9SLIDSV0AJpRaK8YxO8m03NAH43orPcB/IxUqEplrhsCGAd86p1UmwTx
 z5K16wJjBnaWy1JbSUYB23FuZg0YlVefumOj5PT5OTTEm+ZBqXS+CtLCzO1MQLHqZnIq
 UdrR8JEtFblWEZw7OV4nKaruGmT5xhVq6h7FOSrw74WKAXNZb3N9thNEtNegaTW57el1
 WrkQ==
X-Gm-Message-State: AOAM531Jt4WYlZdwdynqW5GlqonnJC6RwUVMTcRCzDsRwwjskpoaW5N9
 WxCfh0KF0pebMmyorQso9X1Axkvsl9Ly9twGX0g=
X-Google-Smtp-Source: ABdhPJwIBCmq0q6Rane1q5vWpwdABKp65TvBajEcwy5xFJ9/1thDAaIDdhozymREMmiq7OKPteUPtiiGDDbI5xLYfG4=
X-Received: by 2002:a9d:7855:: with SMTP id c21mr23351312otm.167.1638663722535; 
 Sat, 04 Dec 2021 16:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20211201093727.67883-1-james.hilliard1@gmail.com>
 <20211204213324.100dab45@windsurf>
In-Reply-To: <20211204213324.100dab45@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 4 Dec 2021 17:21:51 -0700
Message-ID: <CADvTj4o9rgyAnK++H4Jbv8KDcRGVz9tavVM0QVoDpmy4y+y12g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.32.12
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

On Sat, Dec 4, 2021 at 1:33 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Wed,  1 Dec 2021 02:37:27 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Migrate autotools build system to meson.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Why is the migration to meson tied to the version bump? The current
> version of network-manager packaged in Buildroot, 1.32.2, already has
> the meson build infrastructure. So really the bump to 1.32.12 has
> nothing to do with the meson migration it seems.

I had just tested them at the same time, I can do a separate bump first.

>
>
> >  NETWORK_MANAGER_VERSION_MAJOR = 1.32
> > -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
> > +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
> >  NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
> >  NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
> >  NETWORK_MANAGER_INSTALL_STAGING = YES
> > -NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
> > +NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus gnutls libglib2 \
>
> Why is dbus now a build-time dependency?

Due to the meson build system requiring the dbus pkg-config files.

>
> >  NETWORK_MANAGER_CONF_OPTS = \
> > -     --disable-introspection \
> > -     --disable-tests \
> > -     --disable-qt \
> > -     --disable-more-warnings \
> > -     --with-crypto=gnutls \
> > -     --with-iptables=/usr/sbin/iptables \
> > -     --disable-ifupdown \
> > -     --without-nm-cloud-setup
> > +     -Ddocs=false \
> > +     -Dtests=no \
>
> Sometimes "false", sometimes "no", is this logical?

Probably not...but that's what upstream requires here...

>
> > +ifeq ($(BR2_PACKAGE_IWD),y)
> > +NETWORK_MANAGER_DEPENDENCIES += iwd
> > +NETWORK_MANAGER_CONF_OPTS += -Diwd=true
> > +else
> > +NETWORK_MANAGER_CONF_OPTS += -Diwd=false
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_AUDIT),y)
> > +NETWORK_MANAGER_DEPENDENCIES += audit
> > +NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=yes
> > +else
> > +NETWORK_MANAGER_CONF_OPTS += -Dlibaudit=no
>
> Ditto. Is there a reason why it's sometimes yes/no and sometimes
> true/false?

Upstream is rather inconsistent with the option names.

>
>
> > +ifeq ($(BR2_PACKAGE_POLKIT),y)
> > +NETWORK_MANAGER_DEPENDENCIES += polkit
> > +NETWORK_MANAGER_CONF_OPTS += -Dpolkit=true
> > +else
> > +NETWORK_MANAGER_CONF_OPTS += -Dpolkit=false
> > +endif
>
> Is the polkit optional dependency new in 1.32.12 ? If not, it should be
> a separate commit.

I don't think it's new but setting this was required due to meson
being stricter.

>
> > +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > +NETWORK_MANAGER_DEPENDENCIES += systemd
> > +NETWORK_MANAGER_CONF_OPTS += \
> > +     -Dsystemd_journal=true \
> > +     -Dconfig_logging_backend_default=journal \
> > +     -Dsession_tracking=systemd \
> > +     -Dsuspend_resume=systemd
> >  else
> > -NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
> > +NETWORK_MANAGER_CONF_OPTS += \
> > +     -Dsystemd_journal=false \
> > +     -Dconfig_logging_backend_default=syslog \
> > +     -Dsession_tracking=no \
> > +     -Dsuspend_resume=upower
>
> This whole systemd logic also seems new, is it related to the version
> bump?

Related to the meson migration.

>
> Thanks!
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
