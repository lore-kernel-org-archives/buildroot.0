Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E021C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 06:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F26314093D;
	Mon,  4 Apr 2022 06:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phGAkIlIKJXX; Mon,  4 Apr 2022 06:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E50E40913;
	Mon,  4 Apr 2022 06:19:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2468C1BF406
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 06:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12D5C60ACE
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 06:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-g22BZLvaIT for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 06:19:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3870D60701
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 06:19:17 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-df02f7e2c9so9500964fac.10
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 23:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YU3h54goz9zPX4AZhKtjaLWKUMSToB/b6LVGYR9726o=;
 b=XPBatY/gysDSQj/OKQxIukijPf8fhM3GPErfVi3qg7199YMvFLvjdK4D40AF2QCd+C
 HXRp6AyK/YWrizlU0cIC9rXJi2Zmed7P8RSc1qInm3bQhOUVF/8VAn9eC7ZjYSyxBmEe
 7lxj9xBRnIvvtgZ1eu8UciWklgc3tUGfWr6Qjx/mGCmzq3k5Sdxb759wKqJKpRJ5wgIg
 K+cnH/N48PZsdHkfccESHvufo67tFQ8ITig/APOpoo49c/HErYWfcHkfAh6gh3AN/7J3
 As+GQaV0oB+SZvRspSm4BaeIiyaUdKWLa5Q/eWXbBiLoYvIUUVLt66jnwOG1WFyZfKD8
 TSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YU3h54goz9zPX4AZhKtjaLWKUMSToB/b6LVGYR9726o=;
 b=OfFburnNJR7MpwLxYdR7MTdGBTJmK1fU71WZnewpF5w5zaT+fHXTGZHdGrivB5xmP9
 LMSK17MAl6LRLPvGSkBWVyLsK7Y07BSkHIFHPTVQCqQ1xYgMmKhClTBJgm4HyEIdxOU2
 XyVpXJNd5XCIBr5BSPZjJHo/lzGv4LJQ64j8tJHUQs9DBy8rtPDNwTfts633s9CqOwuZ
 nAjYiK1YxhGJIajqY+pNhcNNbynDNGMsjHUaiBaGke1VNC8Gu8v8VHsPoCjsbRyzuZ9n
 Pov9t5FWuSoNL5RduANznuc93TiGNEi02BytX4RKGHNm+kfoQrMXL5+8uzagv+MsBUie
 Qo/Q==
X-Gm-Message-State: AOAM531AYWeWzuPQnSuyjjhA24L5FxeRNADaFAq686RYe/OJblfMb4Lk
 VAosyLqlPE1eELEqIhPBfquaT2b7LoqBZQNUr+s=
X-Google-Smtp-Source: ABdhPJzaPEapZJavrYLM/Axtq1213fLrLSGgLH/fbJp1TWu/Uz0/VQB9TQsDq5MWzS5Qx1zhTtaJtrIwxteoRwhXsBU=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr9374923oaa.200.1649053156230; Sun, 03
 Apr 2022 23:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 4 Apr 2022 00:19:04 -0600
Message-ID: <CADvTj4rW6P6xkiner9-b0427EoDWLGBv6i2K70Hsh75P7wenvg@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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

On Sun, Apr 3, 2022 at 4:05 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Use internal bind as dhcp doesn't build since bump of bind to version
> 9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92 and upstream
> doesn't plan to fix it any time soon:
> https://gitlab.isc.org/isc-projects/dhcp/-/issues/233#note_276883
>
> In file included from ../includes/dhcpd.h:91,
>                  from ctrace.c:29:
> ../includes/omapip/isclib.h:51:10: fatal error: isc/boolean.h: No such file or directory
>    51 | #include <isc/boolean.h>
>       |          ^~~~~~~~~~~~~~~
>
> Fixes:
>  - http://autobuild.buildroot.org/results/d18b006dce7b46631ce8f4c72fb97eb861993939

Also fixes a different issue caused by the bind depends not being
propagated to dhcp:
http://autobuild.buildroot.net/results/c06/c06d57b57c9d7867e3fb7fedd8b5ab39872af285

>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/dhcp/Config.in |  1 -
>  package/dhcp/dhcp.mk   | 19 ++++++++++++++++---
>  2 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
> index 515040c612..e0706efafb 100644
> --- a/package/dhcp/Config.in
> +++ b/package/dhcp/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_DHCP
>         # fork()
>         depends on BR2_USE_MMU
>         depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> -       select BR2_PACKAGE_BIND
>         help
>           DHCP relay agent from the ISC DHCP distribution.
>
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index 18765a3639..f1e3c22f1c 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -9,8 +9,10 @@ DHCP_SITE = https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
>  DHCP_INSTALL_STAGING = YES
>  DHCP_LICENSE = MPL-2.0
>  DHCP_LICENSE_FILES = LICENSE
> -DHCP_DEPENDENCIES = bind host-gawk
> +DHCP_DEPENDENCIES = host-gawk
>  DHCP_CPE_ID_VENDOR = isc
> +# internal bind does not support parallel builds.
> +DHCP_MAKE = $(MAKE1)
>
>  # use libtool-enabled configure.ac
>  define DHCP_LIBTOOL_AUTORECONF
> @@ -21,11 +23,12 @@ DHCP_CONF_ENV = \
>         CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
>                 -D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
>         CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
> +DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(TARGET_CC)'
>
>  DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
>
>  DHCP_CONF_OPTS = \
> -       --with-libbind=$(STAGING_DIR)/usr \
> +       --with-bind-extra-config="$(DHCP_BIND_EXTRA_CONFIG)" \
>         --with-randomdev=/dev/random \
>         --with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
>         --with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
> @@ -38,8 +41,18 @@ DHCP_CONF_OPTS = \
>         --with-relay-pid-file=/var/run/dhcrelay.pid \
>         --with-relay6-pid-file=/var/run/dhcrelay6.pid
>
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +DHCP_BIND_EXTRA_CONFIG += --with-zlib
> +DHCP_DEPENDENCIES += zlib
> +else
> +DHCP_BIND_EXTRA_CONFIG += --without-zlib
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +DHCP_CONF_ENV += LIBS=-latomic
> +endif
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
> -DHCP_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/bind9-config --libs bind9`"
>  DHCP_CONF_OPTS += --disable-libtool
>  else
>  DHCP_POST_EXTRACT_HOOKS += DHCP_LIBTOOL_AUTORECONF
> --
> 2.35.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
