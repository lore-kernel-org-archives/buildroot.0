Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EEEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 22:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E29B8425DD;
	Thu, 17 Feb 2022 22:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fUcnFyGYVC8z; Thu, 17 Feb 2022 22:07:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37D10425DB;
	Thu, 17 Feb 2022 22:07:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2949B1BF3D8
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 22:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1894B6F76D
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 22:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvX3JzOfmRcK for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 22:07:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3330F6F76C
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 22:07:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d44f:202d:8a3e:695f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CEEA613F86E;
 Thu, 17 Feb 2022 23:07:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645135637;
 bh=U7J3MqqmBtKaTkbeKCU71UEO2/mQ2eIZGuiOXwuldsA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OTNpwUTLbYwOnKcUYUC8/f9ss1MQxx0OK3XwLoG+k7f/bRJeIMCcqHDIRzh0QRMKm
 yNVn7YT/0GpaIxMfuKknpka2qJoSg+K865fOLYL/rFuWU/oazqwSvL5K8GXAxQIRc5
 ku5GjHtmFCoWbVrtE1cyRU5efZPD6LJbB9JhiVlcjnGvGSWN7OfzK1/Wkl1iTs1xwe
 406f3lvJ3whT7j23zQCD/gqWsb1gZnORDfcIkG3pnuAPHFwTjKTY6KXX8fFruaJLhC
 lILfUoxdjiqdbAed5DmVujci2+yCKDrcYmvey56qI1UgdhCg8k0MtHLlxjjE6u8lsb
 uKn7M2zNABS0w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 17 Feb 2022 23:07:14 +0100
Date: Thu, 17 Feb 2022 23:07:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220217220714.GO522310@scaer>
References: <20220217214459.555586-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217214459.555586-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre: don't override
 PCRE_CONF_OPTS
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

On 2022-02-17 22:44 +0100, Fabrice Fontaine spake thusly:
> PCRE_CONF_OPTS is wrongly overridden in a conditional since commit
> 9b28d48012c33b37d33101991fa042f9fc9d76eb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, alogn with your four following similar changes,
thanks.

Note that some of them are not really overrides, as the variables are
not previously set, but for consistency sake, and for robustness agaisnt
future evolutions in those files, this is still better (and correct!) to
use the append assignment in conditional blocks.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/pcre/pcre.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
> index c85f6717db..59750c28e7 100644
> --- a/package/pcre/pcre.mk
> +++ b/package/pcre/pcre.mk
> @@ -18,7 +18,7 @@ HOST_PCRE_CONF_OPTS = --enable-unicode-properties
>  
>  ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
>  # pcre will use the host g++ if a cross version isn't available
> -PCRE_CONF_OPTS = --disable-cpp
> +PCRE_CONF_OPTS += --disable-cpp
>  endif
>  
>  PCRE_CONF_OPTS += --enable-pcre8
> -- 
> 2.34.1
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
