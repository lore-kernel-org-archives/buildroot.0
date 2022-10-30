Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679B2C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D5D812BA;
	Sun, 30 Oct 2022 16:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05D5D812BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CeD-Kocv0a46; Sun, 30 Oct 2022 16:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31188812A0;
	Sun, 30 Oct 2022 16:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31188812A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7921BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33D43403A2
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33D43403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ktYdSrGgcCD3 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:16:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 444C84011F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 444C84011F
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:16:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8EAD913F8BB;
 Sun, 30 Oct 2022 17:16:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:16:42 +0100
Date: Sun, 30 Oct 2022 17:16:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030161642.GJ1058960@scaer>
References: <20221028214811.273143-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028214811.273143-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667146604;
 bh=Y6D+hs8nYkopdAfc+Uk3gJy7G9l/MtZSZmqXPpzNjbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q43GuvpRzgNwu0N/iCb5yWtzqr33Bamwxd/FzuIlMq/+PR5jqw51DEzI3Y+068+f4
 DpqzoIfmeR6hwEWsiA9nayh+Q2wwUxoPBpmB8wf+L7wTW9z9l6L4I2URXGOFY4iBYI
 ox5rzbGYQNWCtbq9WhVgaVNb+ierYcPb378LH1HQQnEQabpPOKqkoMoHd4hOEMqk4y
 2sWcRLocUp3VQDJ6g6TVAPOvqwvU58tiVTsYk+VPtrG2F6w+OKUMxrzMUItSWdTpPy
 CKsC8SAX2N8znXFdodS0wBVCUWYLx9G6iXY81N/NnwJSmeJIyb5Rs3LvWS5XDwMC6I
 YVIhE+Io7ONyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q43GuvpR
Subject: Re: [Buildroot] [PATCH 1/1] package/sngrep: bump to version 1.6.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-10-28 23:48 +0200, Fabrice Fontaine spake thusly:
> - Drop patch (already in version)
> - pcre2 is an optional dependency since
>   https://github.com/irontec/sngrep/commit/cac42deab5e94661e2495399bc40eaf75e0b46bc
> - zlib is an optional dependency since
>   https://github.com/irontec/sngrep/commit/c02f439d73f33c727909131cb4d9d01029d7492f
> 
> https://github.com/irontec/sngrep/blob/v1.6.0/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
> index 841a7bb991..7b614f1770 100644
> --- a/package/sngrep/sngrep.mk
> +++ b/package/sngrep/sngrep.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>  
> -SNGREP_VERSION = 1.4.7
> -SNGREP_SITE = $(call github,irontec,sngrep,v$(SNGREP_VERSION))
> +SNGREP_VERSION = 1.6.0
> +SNGREP_SITE = \
> +	https://github.com/irontec/sngrep/releases/download/v$(SNGREP_VERSION)
>  SNGREP_LICENSE = GPL-3.0+
>  SNGREP_LICENSE_FILES = LICENSE
>  SNGREP_AUTORECONF = YES
> @@ -29,11 +30,21 @@ else
>  SNGREP_CONF_OPTS += --without-gnutls --without-openssl
>  endif
>  
> -ifeq ($(BR2_PACKAGE_PCRE),y)
> +ifeq ($(BR2_PACKAGE_PCRE2),y)
> +SNGREP_DEPENDENCIES += pcre2
> +SNGREP_CONF_OPTS += --without-pcre --with-pcre2 

    $ make check-package
    WARNING: package/sngrep/sngrep.mk:35: line contains trailing whitespace
    WARNING: package/sngrep/sngrep.mk:45: line contains trailing whitespace

Applied to master with those fixed, thanks.

Regards,
Yann E. MORIN.

> +else ifeq ($(BR2_PACKAGE_PCRE),y)
>  SNGREP_DEPENDENCIES += pcre
> -SNGREP_CONF_OPTS += --with-pcre
> +SNGREP_CONF_OPTS += --with-pcre --without-pcre2
>  else
> -SNGREP_CONF_OPTS += --without-pcre
> +SNGREP_CONF_OPTS += --without-pcre --without-pcre2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +SNGREP_DEPENDENCIES += zlib
> +SNGREP_CONF_OPTS += --with-zlib 
> +else
> +SNGREP_CONF_OPTS += --without-zlib
>  endif
>  
>  $(eval $(autotools-package))
> -- 
> 2.35.1
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
