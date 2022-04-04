Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A61C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 13:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5D9841560;
	Mon,  4 Apr 2022 13:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4gveUkSgd7pt; Mon,  4 Apr 2022 13:07:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8065C4154C;
	Mon,  4 Apr 2022 13:07:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39ECF1BF2E5
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 13:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 272C94154C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 13:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6137vIkk1Rz for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 13:07:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D14541547
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 13:07:44 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id x131so4925976ybe.11
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 06:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=SLMqZCKCpeHhHnQk+WOCvqKHzywMI5bp34LF/Gu6Xf4=;
 b=eCFK4OrYW0xZF4lFvKtfMOapdnvj3bZL424s00KTA0+kcYolC1c58S3OfC271PSIXp
 Ann7pTwDP/+sUt2WeMljWBG5DXZgEU6mQm/sGJ6J50v63f02imtD0mvrEWSgym8bMAHl
 S4/odfv3ulKYEQdN8c9w5VMyydtvHd1KgzVoUSbA9XytzVQiejricyJGIOAtiP+R/WGv
 xGg6lIeZcrFtOf3Jz0fRO4aS9jeiChcajFVAuwiNY+0mdIZLttVpOJok8DOubJXNMG5P
 5gOLmufPOB73DTUUCKL7S/zzIG5VoRGKrwI2iRKo7iwpbdY8KQOXo03sFfO4kinOORb0
 r7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SLMqZCKCpeHhHnQk+WOCvqKHzywMI5bp34LF/Gu6Xf4=;
 b=DOikpVETVxVNG5nZxVsgnaU8dm76VTldiclOSi3X/QmZhoyw/djORE2vxSyZi7Pny6
 kWbRTOEZj5IJS03wBqIO0Q46G6egWHV7urOkd44Bmj6uL08i0HZhzQIVx28dESDaUNJh
 Kzwuo27kk0mVyNarOgxdscbrsT+ts0RG6p1kM6zeHaq2Wmsgmk/ecfDgaur+/J3nNc1q
 Ga4XfsZ+e3XuNCUsDYVCi0L6qIP35+aH0Qfe1Q1z5ZkOaYo7J1r1/fAcZC6mH9Hk9Wr4
 j0Xt3KVI8ZlMPWV0QSCrsctJBjDFdOIQRElHdDC02aRZ1qZMl3apm4roEBAEfrGNVXvf
 hx7g==
X-Gm-Message-State: AOAM530MnzHaCp+78QAhHx0nS/QZjPEQHvea0T68yIhAH2lL0PHFxyG8
 K/iAI8gi9QByQo43huKtZlP/VrVNWd3/LdUqRXI+rmA68nKs2Q==
X-Google-Smtp-Source: ABdhPJxWntm2moLWWS2PgucijOaAlv5j0UMP/iceLu6ryI3vOJdBZwLvxaJpdDhENYI7cYVdxkF8+L4ETVrFSaHBVVg=
X-Received: by 2002:a25:84c7:0:b0:63d:b97e:2acb with SMTP id
 x7-20020a2584c7000000b0063db97e2acbmr5519490ybm.49.1649077663355; Mon, 04 Apr
 2022 06:07:43 -0700 (PDT)
MIME-Version: 1.0
From: Edmundo Ferreira <fc.edmundo@gmail.com>
Date: Mon, 4 Apr 2022 15:07:07 +0200
Message-ID: <CAFv936E7yCPVj92AxHMKZEgp9m+SW4z7gCycyo2JqRJEdoZoSQ@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 2022-04-03 at 12:03 +0200, Fabrice Fontaine wrote:

> Use internal bind as dhcp doesn't build since bump of bind to version
> 9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92 and
> upstream
> doesn't plan to fix it any time soon:
> https://gitlab.isc.org/isc-projects/dhcp/-/issues/233#note_276883
>
> In file included from ../includes/dhcpd.h:91,
>                  from ctrace.c:29:
> ../includes/omapip/isclib.h:51:10: fatal error: isc/boolean.h: No
> such file or directory
>    51 | #include <isc/boolean.h>
>       |          ^~~~~~~~~~~~~~~
>
> Fixes:
>  -
> http://autobuild.buildroot.org/results/d18b006dce7b46631ce8f4c72fb97eb861993939
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
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
> @@ -9,8 +9,10 @@ DHCP_SITE =
> https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
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
> -DHCP_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/bind9-config --libs
> bind9`"
>  DHCP_CONF_OPTS += --disable-libtool
>  else
>  DHCP_POST_EXTRACT_HOOKS += DHCP_LIBTOOL_AUTORECONF

I can confirm that this issue is also present in 2022.02.x branch.
A backport to that branch would be nice.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
