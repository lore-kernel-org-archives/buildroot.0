Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE56C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 20:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57B9B405FB;
	Sun,  3 Apr 2022 20:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8XWvZmppHst; Sun,  3 Apr 2022 20:25:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D5664059D;
	Sun,  3 Apr 2022 20:25:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F3071BF31F
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CB3782422
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IkI3g87gYHNr for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 20:25:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4663F81B99
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 20:25:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:314c:79b0:cf44:9021])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8C27613F87C;
 Sun,  3 Apr 2022 22:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649017546;
 bh=iJOmv5nOz4qd/cSTHFeWEPKQJV5mP3eA7oLORjt7ORs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nPFxAV5zBjtwhzIKjbHyNS6WkIEnO8Vax3C9FIuTxu/osRjwNv7tTGo1l9AWC6Leo
 fDUotJ29Sy+cwJEDZi0UaD+6wVYbvRAPe92Ni/ZeKLp3w0xzchrtVujbtTR/bGuDH2
 Q0bDj6bNVQPPljOX+6xI0GGFtoX8wRuaIrht4zkRtJ4VByistCtKqGWJ3Un0zWiqou
 cUFugVSOrH9DusRARtVRGqEBsRCpvYR5j8NH78SoGrafxHrhPdyuqeTNJSLmz1VQmf
 iMGr0O/MLYL3BkDRiU67Ku27cN/WrNy05sZn0cZZUFOBFY1jDbGEcc30rDLY4/xRLl
 PMNAvCYyZqLVA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Apr 2022 22:25:42 +0200
Date: Sun, 3 Apr 2022 22:25:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220403202542.GD2354230@scaer>
References: <20220403163737.223577-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220403163737.223577-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/libyang: drop unrecognized
 options
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
Cc: Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-04-03 18:37 +0200, Fabrice Fontaine spake thusly:
> Commit 2a3edc5e00b38f4f927894d0911990c9060e4415 forgot to drop
> ENABLE_LYD_PRIV and GEN_PYTHON_BINDINGS options which are not recognized
> anymore
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Those two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libyang/libyang.mk | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
> index 7de9531bff..832adcb627 100644
> --- a/package/libyang/libyang.mk
> +++ b/package/libyang/libyang.mk
> @@ -15,13 +15,10 @@ LIBYANG_DEPENDENCIES = pcre2
>  HOST_LIBYANG_DEPENDENCIES = host-pcre2
>  
>  LIBYANG_CONF_OPTS = \
> -	-DENABLE_VALGRIND_TESTS=OFF \
> -	-DGEN_PYTHON_BINDINGS=OFF \
> -	-DENABLE_LYD_PRIV=ON
> +	-DENABLE_VALGRIND_TESTS=OFF
>  
>  HOST_LIBYANG_CONF_OPTS = \
> -	-DENABLE_VALGRIND_TESTS=OFF \
> -	-DGEN_PYTHON_BINDINGS=OFF
> +	-DENABLE_VALGRIND_TESTS=OFF
>  
>  $(eval $(cmake-package))
>  $(eval $(host-cmake-package))
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
