Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B98C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 08:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4F2381971;
	Tue, 20 Dec 2022 08:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4F2381971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NyLeXbqwgrcB; Tue, 20 Dec 2022 08:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F5778151E;
	Tue, 20 Dec 2022 08:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F5778151E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3A0A1BF28C
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 08:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BAB340133
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 08:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BAB340133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DHesTpg8iEfN for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 08:29:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AAC4400D9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AAC4400D9
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 08:29:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cf59:3d28:f63b:149b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 90AC75FFAE;
 Tue, 20 Dec 2022 09:29:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Dec 2022 09:29:34 +0100
Date: Tue, 20 Dec 2022 09:29:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20221220082934.GC2909@scaer>
References: <20221219202308.2597300-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221219202308.2597300-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1671524983;
 bh=lnaGum4Tl3kFpvU5YnaLqetOxfz3EAGIQlQqLT3PwKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cBjfss4gX+Neqbv1oR8p59awBEqGCFKVRleQ4Fg2a26VCH0ebK1J9emK8DYkznMDM
 hz3NGIMiR7YUWbV5Rdl3B/d9abarFlg8i/1Vu5Gzpk820amcm+Rk/zIjofAG6bwD+A
 glyacAP61Lne1HUGpStJ7xIYe9xVPUw+AwFqqbXK27UbM+jlhBfOe6qguV5WTRqogR
 xoSx4WzVB5zH4mQcRA4WrDeeapHISwL8ofVlAwiUkEXtVhr2VYDbTYaP+nR+ZdSZdn
 Xz8YnyyWPezAkfwf474SkNmd+//YyGi7fgHAf3NXA7RgHqxVJ0aSONFJ6fSDW3Leip
 mNkvr/Z1OuHoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cBjfss4g
Subject: Re: [Buildroot] [PATCH] package/libgpg-error: Disable support for
 non-C languages
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, mmayer@broadcom.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org,
 fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Florian, All,

On 2022-12-19 12:23 -0800, Florian Fainelli spake thusly:
> The only other language supported is CL (Common Lisp) which buildroot does not
> package yet. This saves 52KB in the final root filesystem.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to master, thanks.

> ---
>  package/libgpg-error/libgpg-error.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index 86dea6ad2acd..0b7b8df389f9 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -14,7 +14,8 @@ LIBGPG_ERROR_INSTALL_STAGING = YES
>  LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
>  LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  LIBGPG_ERROR_CONF_OPTS = --disable-tests \
> -		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)
> +		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \
> +		--disable-languages

I also took the oportunity to reformat that to more closely match the
(unwritten) rule of one-option-per-line.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  LIBGPG_ERROR_CONF_OPTS += --enable-threads
> -- 
> 2.34.1
> 

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
