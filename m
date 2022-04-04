Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814FFC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 306328284B;
	Mon,  4 Apr 2022 19:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-nv-iq-3N07; Mon,  4 Apr 2022 19:32:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41BE38272A;
	Mon,  4 Apr 2022 19:32:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C04841BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD41460BEF
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:32:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ImjyGE1nqYix for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:32:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FBF460BAF
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:32:01 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id bh17so22116083ejb.8
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 12:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=pc2ZZ4WDA1y9DVCibDQ0q2PpeAO1BUz0uj/Yp3nWbOY=;
 b=fKqGUQFLDMJgFeDSInxjZNZWGuaJ5zId3MOjUz0vnHvsKEH93s+nT3FAuUTu7017AG
 vVBeZGnHM7hs2tbYjuaBpw6ZfqHDOJ6Unyb50LqNIR8ne/2/iECxcaATFW2Xu4FEF2h/
 0L0M0MqXBALhOs8F3Xg0Yyerx1Zg9Dl7w2hSK8hwGOFKbC3Gia5EF3kUZePBaC4kzXec
 pSE0RiUDJvFvi+ZQmJQp9X4BkASOrAJMHZ90qZ3D8XpIx67FKRnQ/ALxJyR6079GR+KF
 Pe0mu6PC40zZXwK9JaW1a7ivK3+9nVfMlGJKMrvMOaziifVs6wkE77jZM4sFYZ5soW1x
 hRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pc2ZZ4WDA1y9DVCibDQ0q2PpeAO1BUz0uj/Yp3nWbOY=;
 b=yXAnn+9SkviSAMWZ5J7qdp1sBollzGAzDcGpNKxT14essEEmHwJkrLzaYLZJXubFD+
 KPLsQzMqtG2L6qIK9cnerLKpzV/WjlukzuK8TlBX0W7t585wJ6PLFIN4DCeN7ZsJj4lF
 ZnbfeRuTJZp6DiVv5dsL8gvo1+KYUYMeMJhkVKQmZNKHNBZMpgbm1LtlpkmSNcWEy467
 TOa3XTRm4vQdsggE3DHyOoMFNm+LRn/cRUBi52vGatym9zqP27BOY1xbEIAwoPnCAzB/
 EbUB1tpwK15pgnc++Km8dZLZFk62ubLjTvLQ73ShREq322gFn44i/gI7nu3ktkV25arg
 gGWQ==
X-Gm-Message-State: AOAM5324qh99+80ITJin4Ivs6hFvQoiDs0gV2EvHz3yiO+vUKa/hL8pL
 1HcQvH5esGb/TdIFizOMBUMNaw==
X-Google-Smtp-Source: ABdhPJy/UCOkSnd4hpUYTjpgEw+3PGF8+VWNhHl/l2pFvFuVJR5HwLI4n0H0RnbSJdYbW+bX0X4Rtg==
X-Received: by 2002:a17:907:948c:b0:6e7:fe2b:68f0 with SMTP id
 dm12-20020a170907948c00b006e7fe2b68f0mr1583364ejc.749.1649100719759; 
 Mon, 04 Apr 2022 12:31:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a170906b11900b006e08588afedsm4678871ejy.132.2022.04.04.12.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 12:31:59 -0700 (PDT)
Message-ID: <763d35af-8d12-947d-eb92-053c9f214783@mind.be>
Date: Mon, 4 Apr 2022 21:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/04/2022 12:03, Fabrice Fontaine wrote:
> Use internal bind as dhcp doesn't build since bump of bind to version
> 9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92 and upstream
> doesn't plan to fix it any time soon:
> https://gitlab.isc.org/isc-projects/dhcp/-/issues/233#note_276883
> 
> In file included from ../includes/dhcpd.h:91,
>                   from ctrace.c:29:
> ../includes/omapip/isclib.h:51:10: fatal error: isc/boolean.h: No such file or directory
>     51 | #include <isc/boolean.h>
>        |          ^~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d18b006dce7b46631ce8f4c72fb97eb861993939
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  If dhcp is not developed anymore, maybe we should say that in the help text or 
something.

  Regards,
  Arnout

> ---
>   package/dhcp/Config.in |  1 -
>   package/dhcp/dhcp.mk   | 19 ++++++++++++++++---
>   2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
> index 515040c612..e0706efafb 100644
> --- a/package/dhcp/Config.in
> +++ b/package/dhcp/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_DHCP
>   	# fork()
>   	depends on BR2_USE_MMU
>   	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> -	select BR2_PACKAGE_BIND
>   	help
>   	  DHCP relay agent from the ISC DHCP distribution.
>   
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index 18765a3639..f1e3c22f1c 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -9,8 +9,10 @@ DHCP_SITE = https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
>   DHCP_INSTALL_STAGING = YES
>   DHCP_LICENSE = MPL-2.0
>   DHCP_LICENSE_FILES = LICENSE
> -DHCP_DEPENDENCIES = bind host-gawk
> +DHCP_DEPENDENCIES = host-gawk
>   DHCP_CPE_ID_VENDOR = isc
> +# internal bind does not support parallel builds.
> +DHCP_MAKE = $(MAKE1)
>   
>   # use libtool-enabled configure.ac
>   define DHCP_LIBTOOL_AUTORECONF
> @@ -21,11 +23,12 @@ DHCP_CONF_ENV = \
>   	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
>   		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
>   	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
> +DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(TARGET_CC)'
>   
>   DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
>   
>   DHCP_CONF_OPTS = \
> -	--with-libbind=$(STAGING_DIR)/usr \
> +	--with-bind-extra-config="$(DHCP_BIND_EXTRA_CONFIG)" \
>   	--with-randomdev=/dev/random \
>   	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
>   	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
> @@ -38,8 +41,18 @@ DHCP_CONF_OPTS = \
>   	--with-relay-pid-file=/var/run/dhcrelay.pid \
>   	--with-relay6-pid-file=/var/run/dhcrelay6.pid
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
>   ifeq ($(BR2_STATIC_LIBS),y)
> -DHCP_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/bind9-config --libs bind9`"
>   DHCP_CONF_OPTS += --disable-libtool
>   else
>   DHCP_POST_EXTRACT_HOOKS += DHCP_LIBTOOL_AUTORECONF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
