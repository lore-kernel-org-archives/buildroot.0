Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B74CC433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 23:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E07F7607BD;
	Wed,  1 Dec 2021 23:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nbff2GRij_u6; Wed,  1 Dec 2021 23:15:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36FAD60799;
	Wed,  1 Dec 2021 23:15:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39CB51BF2BA
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 23:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 268A3607BD
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 23:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jRkbKJgVLtBI for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 23:15:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BF526073D
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 23:15:36 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 v30-20020a4a315e000000b002c52d555875so8298823oog.12
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 15:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DNVm6WgQPmtv1UzuhWbhaf1WTQJ4KZmD1lump4pTNWU=;
 b=bkW4/FK+J9yhLkaisd27DTJqBiYGOY02oSnqYSLLxCdKZPH61CdlLP8x+3HK3D7Vnk
 C0oY0YdrPm8Gqk3RdfB6nZXz9jXJINjOlVD6W0r+/zEVrLDHue/PunCnU6ugLTjISwSY
 xhJKg7xYAgVkL7Awo1uRdGRdnBrmdouRQ7RRRlzseBLUv3GP09fT6Fy/QIxTdkRpb/nZ
 0qgb1IMPiyywkK1rvGXVijNIV/ORU9SlIj9XmRsJ0SZV+N4bG8eIyEUWpAQq0Vh/eyQc
 6Ds+jz/QjbDURzoJAeADiBSwct/2KdXqhtnoDS5HQjJn6FsT0gHpoi1rAPXznp/bKLyN
 gnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DNVm6WgQPmtv1UzuhWbhaf1WTQJ4KZmD1lump4pTNWU=;
 b=MARaj8pvrtkZgU/xiJNsJAbjkGCbeNzsS2rS/cyYsCs9oF2/R3cjG+f/CsYa5iueox
 UwGgopUqF60OsM0jQZm1Dy6vn2FRo7CbfkIu+/9WvNTlltuY/zrUAkgZ/KLGSse1Qu4j
 JiwNAhvj5LDwupdDTF57Fv7PrlyIAVGHEJkZU6NlvOBPeCqjh6w1kC8n2qJuLaQGvno5
 OEsvtqFWyM1otiIk+SUemjvN921An6UjVgMwbV7V9oEW/KgS8E3DG4gSne56lSHHWAlr
 WwT71UPWAG8ee6Bv0nYBF0bAEVEFGozPLNnMQeTKkEBO6OL2uYe+sJ6g0Xr9OVZZqF4a
 eE7w==
X-Gm-Message-State: AOAM530ejdF0HvIDpY1MpGhsrCxFoChqtAAAe/7IDz7r7FNzC0R1xbfT
 IjnAca8JdTZwVModX2ik4x9ZJA8RDu00dKBiKE0=
X-Google-Smtp-Source: ABdhPJzYvL8E/veHl2jWFTl8p/sAZcaUpN8rI6WXu1IbnU/h49/7RTFys1h3AgzI3baKhGO8QXeqDi8OFw0zh+ICZPU=
X-Received: by 2002:a05:6820:151b:: with SMTP id
 ay27mr6415179oob.22.1638400535349; 
 Wed, 01 Dec 2021 15:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20211201135103.2302297-1-james.hilliard1@gmail.com>
 <20211201183413.2a98291c@gmx.net>
In-Reply-To: <20211201183413.2a98291c@gmx.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 1 Dec 2021 16:15:24 -0700
Message-ID: <CADvTj4p6pRZj=iTihdDXAZf7_sT6h0i-=krpMW+OE3YX55a7rA@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/iwd: enable required kernel
 dependencies
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Dec 1, 2021 at 10:34 AM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello James,
>
> On Wed,  1 Dec 2021 06:51:03 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Required kernel options are listed in check_crypto() in srv/main.c:
> > https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/src/main.c?h=1.20#n268
>
> Thanks for doing this (one less point on my long standing ToDo list) ;-)
>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/iwd/iwd.mk | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> > index 96bdc56e93..8bcd406ea0 100644
> > --- a/package/iwd/iwd.mk
> > +++ b/package/iwd/iwd.mk
> > @@ -63,4 +63,34 @@ define IWD_INSTALL_INIT_SYSV
> >       ln -sf /tmp/iwd/hotspot $(TARGET_DIR)/var/lib/iwd/hotspot
> >  endef
> >
> > +define IWD_LINUX_CONFIG_FIXUPS
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_KEY_TYPE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES_NI_INTEL)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES_X86_64)
>
> Not sure if it is good idea to add the x86_64 specific ones unconditionally
> (they are marked in check_crypto() with ADD_OPTIONAL instead of ADD_MISSING)?

Doesn't the infrastructure drop them automatically if they aren't selectable?

>
> Regards,
> Peter
>
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CBC)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CMAC)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES3_EDE_X86_64)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_ECB)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_HMAC)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD4)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD5)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1_SSSE3)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256_SSSE3)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA512)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA512_SSSE3)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_HASH)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_SKCIPHER)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_KEY_DH_OPERATIONS)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_PKCS7_MESSAGE_PARSER)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_PKCS8_PRIVATE_KEY_PARSER)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_X509_CERTIFICATE_PARSER)
> > +endef
> > +
> >  $(eval $(autotools-package))
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
