Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70863C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E902F408CF;
	Sun,  7 May 2023 21:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E902F408CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ucDQTgZSLOI; Sun,  7 May 2023 21:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D74240639;
	Sun,  7 May 2023 21:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D74240639
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC781BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06D0881F2B
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06D0881F2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XNT23Xya4ANs for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:05:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C714381F0A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C714381F0A
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:05:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A8D562003D6;
 Sun,  7 May 2023 23:05:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 23:05:29 +0200
Date: Sun, 7 May 2023 23:05:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230507210529.GM252090@scaer>
References: <SN4P221MB0682F08F5BA15071DDED63A7A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB0682F08F5BA15071DDED63A7A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683493531;
 bh=QzuIyCFr1tGWi/L+ynmmNEPFWk+O6KHfDFIsHVT+9WE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q1IemG8ZxHSXByHMowVkF/BuGbGsFxNLUhzO/cMl+wTRNJ5cJuKZ4rTDsgvQwDMwU
 5ZUFlMVrgafkDDaULteC9qz2/UMVMGDKwtMZOA+CfBUD6kgfXiHpWZBPrQNyPXN5cw
 Znlc2lD7DZD7IXACNPQF0KQSaSsuF+iEPXzNtMYInDUuQGMfLcmc/2YCxsJ7HvPIOH
 HsadgpWkJW3SaTURtmZPM868MoodiUe9228tZHMEmqNeuejfC9KvGhY6cxaGj4r+7g
 sQG1d0J8m6vJFoZzlt3qDmSbJkZXQ5jDPD08vs5ly9xZQLLLUdIdiQzNbl1Nuhh+d7
 S4p9hZbC4cmlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q1IemG8Z
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-utils.mk: suppress kconfig
 set/disable operations
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

James, All,

I was very confused about the title. But it is not about "suppressing"
thsoe operations, but really about making them quiet. So I tweaked the
commit title a bit...

(Unless I don't know all the meanings of suppress, which is totally
possible, but then I still got confused, and the new title is still
more explicit.)

On 2023-05-04 23:43 -0400, James Knight spake thusly:
> In a previous commit [1], the use of `KCONFIG_ENABLE_OPT` was tweaked in
> a way which no longer generates a default output unless the quiet flag
> is unset (`Q=`). The use of `KCONFIG_SET_OPT` and `KCONFIG_DISABLE_OPT`
> does not apply a quiet operation. In order to make all these kernel
> configuration defines operate in a consistent way, adjusting both
> `KCONFIG_SET_OPT` and `KCONFIG_DISABLE_OPT` to be default-quiet as well.
> 
> [1]: 66d2ff25bad813659ed4541b3f4c6c2a09455bd7
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-utils.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 0945e6ed318ab4d176ce6d4efa3906e537f2b982..530638566c05094080b8defb098c131aa4981767 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -34,9 +34,9 @@ define KCONFIG_ENABLE_OPT
>  	fi
>  endef
>  # KCONFIG_SET_OPT (option, value [, file])
> -KCONFIG_SET_OPT     = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
> +KCONFIG_SET_OPT     = $(Q)$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
>  # KCONFIG_DISABLE_OPT  (option [, file])
> -KCONFIG_DISABLE_OPT = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(SHARP_SIGN) $(1) is not set, $(2))
> +KCONFIG_DISABLE_OPT = $(Q)$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(SHARP_SIGN) $(1) is not set, $(2))
>  
>  # Helper functions to determine the name of a package and its
>  # directory from its makefile directory, using the $(MAKEFILE_LIST)
> -- 
> 2.40.1.windows.1
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
