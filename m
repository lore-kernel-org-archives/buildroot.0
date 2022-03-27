Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C956DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 17:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31B6160C33;
	Sun, 27 Mar 2022 17:12:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKmJni-5UEoD; Sun, 27 Mar 2022 17:12:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31A4560AED;
	Sun, 27 Mar 2022 17:12:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 89BF51BF3F6
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 17:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8642C60AED
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 17:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2H0Sv_ExoQUa for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 17:12:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F7AD607F6
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 17:12:43 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-de3f2a19c8so13031499fac.1
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 10:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hoZJGdRlPxXpv8SRDP2p0CGo66KPGlLENmpnTsdCFsE=;
 b=cWrvtXv9hkm1EaqnnnvdxwZgZuchHuD362nxbpz8O7YXTMink6F2QMOPNUJfj/ItKe
 mDLjTPsuf/wgd24jTsT1SWmU8qZ5Fj2j53UBDnzByOXKeQv6g2lNXYAzVI6zugmGlGcw
 Nie+2T/AK4jzT9QNY7FrVJZj0wi3jhy4bynM1x8fkutRdY9g3Q0iOrGZ3kO/sl3yxPjx
 Kray2E38gPE/qFAv2gyZx1Wzq2EmFFdZqqpA0/VJ39EIvbKddIjoFO/DoEp9dgPlnHAu
 2OeDzlKD3ZTeTb8yCwad0Z+xYd1+A8Xf0YqHkvQ0wyrn/CcfCCHQGzsAXkxKPPuJDi1z
 64og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hoZJGdRlPxXpv8SRDP2p0CGo66KPGlLENmpnTsdCFsE=;
 b=y4+b/eilOUdCQUFLfB6JMOhKuyuRjLzZxvRhfOrOA95jyOkV8M2sfD6qituJ6GneS3
 BywHoMSnL8Tui9WAxK8SS0ogW1A/TWBShNFRZVbYFhgtH7j+6l8jaql9M2yofiA80Cp8
 Z9Z6LjojaA+SC9lqGmqYZboXYpRCPQHn1eG5WHgQHBr+L5EB/zbKGNf9HH+aipkFUvtz
 KpeKAFGKx41AHeX/dP81WOKqfUEP7/6cxUGGh01MnQdByE4x5RbJX7EyhyHuMku37c//
 bDiFLCVoWk6mGbYO+EV6tvPROPvPzTq/M9DtnowKTvH116RCC9rwjH80OTSCLifAT6vP
 n/Vg==
X-Gm-Message-State: AOAM532Fm6CjGKRKzHGPlc7LsCyFUsSTx+F/nCimaX6x2NOhWXtK7KLO
 nluv7nKAigl8+nv8Cg+HPG/7a5qv0Bm61rNrGzoBNsZtkkDwYw==
X-Google-Smtp-Source: ABdhPJyQ6Wep/+TMatSxxqesJD1v/j0J6GmwdQyRMmQZGGsKF4TZOejNxbly9AF9mRZ+J8e6zf5RdK3IO+tJd7EE4n0=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr6958095oaa.200.1648401162454; Sun, 27
 Mar 2022 10:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220324063928.3448755-1-james.hilliard1@gmail.com>
 <66f33483-b1ac-640b-8226-a382de57d9c4@mind.be>
In-Reply-To: <66f33483-b1ac-640b-8226-a382de57d9c4@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Mar 2022 11:12:31 -0600
Message-ID: <CADvTj4ruUJ4Do8BYw+-VtKj=gOYXHFJVdhCR82xTbnwxEVz+rw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.36.4
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

On Sun, Mar 27, 2022 at 10:27 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 24/03/2022 07:39, James Hilliard wrote:
> > CONTRIBUTING.md hash changed due to various style updates.
> >
> > Set new default wifi backend config option to iwd when enabled in
> > cases where the default wpa_supplicant is not enabled.
>
>   Applied to master, thanks.
>
>   However, I would like to challenge the order of preference here. If you select
> network-manager, iwd and wpa_supplicant, and network-manager uses
> wpa_supplicant, then you end up not using iwd at all, so that was probably not
> the intention of the user. However, there is a good reason to still have
> wpa_supplicant around when you have selected network-manager+iwd: wpa_supplicant
> is also used for 802.1X authentication over Ethernet.

This just sets a somewhat sane default, which can be overridden by the config
files as with previous versions by setting the network manager config setting:
[device]
wifi.backend=iwd

Note that upstream considers the iwd wifi backend somewhat experimental and
defaults to wpa_supplicant even when iwd backend support is enabled.

>
>   Either way, it's pretty hard to guess the intention of the user. So maybe a
> Config.in choice is appropriate?

I figured overrides can be just done via overlay for this with a config file.

>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/network-manager/network-manager.hash |  6 +++---
> >   package/network-manager/network-manager.mk   | 13 ++++++++++---
> >   2 files changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
> > index d25f0e8194..26bcf843c2 100644
> > --- a/package/network-manager/network-manager.hash
> > +++ b/package/network-manager/network-manager.hash
> > @@ -1,6 +1,6 @@
> > -# From https://download.gnome.org/sources/NetworkManager/1.34/NetworkManager-1.34.0.sha256sum
> > -sha256  819795d0899076204f5672421a58f1b1d9e393536ee87bb844b911e6243bf0bd  NetworkManager-1.34.0.tar.xz
> > +# From https://download.gnome.org/sources/NetworkManager/1.36/NetworkManager-1.36.4.sha256sum
> > +sha256  61304e937dd926471d56715bdede7bab7ccac827356e67f2700d343317cd3c59  NetworkManager-1.36.4.tar.xz
> >   # Locally computed
> >   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> >   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
> > -sha256  ad0abd8e90dd134cc5546f7a13eb4268707b77a5a1a5e3afe31dc4397a573a04  CONTRIBUTING.md
> > +sha256  f3c5ae3cafa27c24590cf89e732581cbeb4d25d950fe49ce7e4042963012b105  CONTRIBUTING.md
> > diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> > index a90228992c..3479bb3794 100644
> > --- a/package/network-manager/network-manager.mk
> > +++ b/package/network-manager/network-manager.mk
> > @@ -4,8 +4,8 @@
> >   #
> >   ################################################################################
> >
> > -NETWORK_MANAGER_VERSION_MAJOR = 1.34
> > -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
> > +NETWORK_MANAGER_VERSION_MAJOR = 1.36
> > +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
> >   NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
> >   NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
> >   NETWORK_MANAGER_INSTALL_STAGING = YES
> > @@ -53,8 +53,15 @@ endif
> >   ifeq ($(BR2_PACKAGE_IWD),y)
> >   NETWORK_MANAGER_DEPENDENCIES += iwd
> >   NETWORK_MANAGER_CONF_OPTS += --with-iwd
> > +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT),y)
> > +NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=wpa_supplicant
> >   else
> > -NETWORK_MANAGER_CONF_OPTS += --without-iwd
> > +NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=iwd
> > +endif
> > +else
> > +NETWORK_MANAGER_CONF_OPTS += \
> > +     --without-iwd \
> > +     --with-config-wifi-backend-default=wpa_supplicant
>
>   This is set regardless of whether wpa_supplicant is enabled or not. Are you
> sure that's OK?
>
>   Regards,
>   Arnout
>
> >   endif
> >
> >   ifeq ($(BR2_PACKAGE_LIBCURL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
