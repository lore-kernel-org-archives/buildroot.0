Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD82ECAAD5
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 14:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17FD6409BC;
	Sun, 28 Aug 2022 14:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17FD6409BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hwNQamhFh9Qb; Sun, 28 Aug 2022 14:02:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9DB140915;
	Sun, 28 Aug 2022 14:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9DB140915
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDCCA1BF283
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 14:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2CF860BE8
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 14:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2CF860BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id naVQvf4oaGmD for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 14:01:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92268605DB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92268605DB
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 14:01:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c66a:3d95:4f85:baec])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 14545780518;
 Sun, 28 Aug 2022 16:01:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 16:01:50 +0200
Date: Sun, 28 Aug 2022 16:01:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dmitry Ilyin <dima@doty.ru>
Message-ID: <20220828140150.GP37358@scaer>
References: <20220828130520.26945-1-dima@doty.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828130520.26945-1-dima@doty.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661695314;
 bh=DvHH6E5VwYsOCpZ2E7lmdxCVrhMePgzCeqi+OaCY4mg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eezMObxHLA6XdJKUACia7n8sugwSOgMp8OL79IieSoQcsw6dVOf1g3YDcumuZYFlA
 VTkwv+j/Rcrm6tH5udnp/DGxrJ24ImkodXOd0N5ltXgzuQz5sMIWEMTeX/zigQC2si
 svy16QqmT1g7UGeyTJSr5rNy9ys6D3XpK1SHJN0LrUf6+14opCRYkkM9/Pe23xlIw3
 XrVrbcP6yrabffQFNNZvLr45m4dr3ntpVVY/dttcZmB8no9mu0zWhCJH0yDtCkr+LY
 pJpEgF1uxvlUD0HuCH3fhvZzKojVMbTU3pMj3T9RmHiMUi1KVLfBkO8EU5OZ8UpYoF
 k0FKWqgrM3ndA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eezMObxH
Subject: Re: [Buildroot] [PATCH] package/mbedtls: add configurable SRTP
 support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dmitry, All,

On 2022-08-28 16:05 +0300, Dmitry Ilyin spake thusly:
> This adds new BR2_PACKAGE_MBEDTLS_SRTP_SUPPORT option to have MbedTLS
> builds that support SRTP (required option for AWS WebRTC library)

You need to sign-off your change:
    https://buildroot.org/downloads/manual/manual.html#submitting-patches

Also, what do you mean by "required option for AWS WebRTC library"?

If you are referring to a package that is present in Buildroot, then
that package should also be fixed to select that option. The only
package I could find in Buildroot, that is both websocket-related and
uses mbedtls, is package/libwebsockets/. If that's what you were
refering to, then the conditin to use mbedtls should be changed (in a
separate, follow-up patch):

    -else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
    +else ifeq ($(BR2_PACKAGE_MBEDTLS_SRTP),y)

Regards,
Yann E. MORIN.

> ---
>  package/mbedtls/Config.in  | 6 ++++++
>  package/mbedtls/mbedtls.mk | 8 ++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
> index a39ba65d98..f06a27fc5c 100644
> --- a/package/mbedtls/Config.in
> +++ b/package/mbedtls/Config.in
> @@ -29,4 +29,10 @@ config BR2_PACKAGE_MBEDTLS_COMPRESSION
>  	  sure CRIME and similar attacks are not applicable to your
>  	  particular situation.
>  
> +config BR2_PACKAGE_MBEDTLS_SRTP
> +	bool "enable SRTP support"
> +	help
> +	  Enable support for negotiation of DTLS-SRTP (RFC 5764)
> +	  through the use_srtp extension.
> +
>  endif
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index af87d62b30..9f9aee1fec 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -72,4 +72,12 @@ else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
>  MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_DISABLE_ASM
>  endif
>  
> +ifeq ($(BR2_PACKAGE_MBEDTLS_SRTP_SUPPORT),y)
> +define MBEDTLS_ENABLE_SRTP
> +	$(SED) "s://#define MBEDTLS_SSL_DTLS_SRTP:#define MBEDTLS_SSL_DTLS_SRTP:" \
> +		$(@D)/include/mbedtls/config.h
> +endef
> +MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_SRTP
> +endif
> +
>  $(eval $(cmake-package))
> -- 
> 2.37.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
