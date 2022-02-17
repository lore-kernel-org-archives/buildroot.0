Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B4BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 348F46F709;
	Thu, 17 Feb 2022 20:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjED8SUwSyL6; Thu, 17 Feb 2022 20:31:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 643456F73B;
	Thu, 17 Feb 2022 20:31:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3854D1BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 350AC6F6FE
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:31:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40sQ9Rx8Pzz6 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:31:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 104016F66E
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:31:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d44f:202d:8a3e:695f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E730C13F892;
 Thu, 17 Feb 2022 21:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645129860;
 bh=nhUkdGXnFRUEO4XP7riZxFszOTtL2RaqBDd8cGIBZhE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QKCDObQaKODC++5U+dwortkuLLX+nbPAczae3wG3xGdajC93P7PWnRES0SNKy3ZMN
 XL8liCB4onqoWs3zMCnv+jqzTeCMVZslQoaSlEgLYGNX0F4vrHLLhNhzKWAq5aHfgg
 +P2IGx6mAs8nREfuOwnZ7yOsN1Ns2ql2xaf3QRBNke1SNQ95w5YchRDfLXdpJiFUkk
 P7PUtQB51rN97ztMZQEQX/PSivM9QBZKG4n9A495l7rSAPWJK+juBkP1vC3mWSwz5B
 glxmnNHsIJbpbNGIX/7UfTyP4qOKHse8ekyvfrz9iBu7YchQdKSGp96OpegSKGztoL
 75iGPWJDOP3Ng==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 17 Feb 2022 21:30:57 +0100
Date: Thu, 17 Feb 2022 21:30:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220217203057.GF522310@scaer>
References: <20220217171906.552326-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217171906.552326-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libglvnd: fix LIBGLVND_CONF_OPTS
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

On 2022-02-17 18:19 +0100, Fabrice Fontaine spake thusly:
> LIBGLVND_CONF_OPTS are wrongly overridden in conditionals since the
> addition of the package in commit
> 0378e2e5d9ce9d5676975dfbff501360094fdc1a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This, and the following 5 similar changes, applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libglvnd/libglvnd.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libglvnd/libglvnd.mk b/package/libglvnd/libglvnd.mk
> index 3df609f6eb..3bac4b31e2 100644
> --- a/package/libglvnd/libglvnd.mk
> +++ b/package/libglvnd/libglvnd.mk
> @@ -37,17 +37,17 @@ LIBGLVND_CONF_OPTS += -Dglx=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBGLVND_DISPATCH_EGL),y)
> -LIBGLVND_CONF_OPTS = -Degl=true
> +LIBGLVND_CONF_OPTS += -Degl=true
>  LIBGLVND_PROVIDES += libegl
>  else
> -LIBGLVND_CONF_OPTS = -Degl=false
> +LIBGLVND_CONF_OPTS += -Degl=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBGLVND_DISPATCH_GLES),y)
> -LIBGLVND_CONF_OPTS = -Dgles1=true -Dgles2=true
> +LIBGLVND_CONF_OPTS += -Dgles1=true -Dgles2=true
>  LIBGLVND_PROVIDES += libgles
>  else
> -LIBGLVND_CONF_OPTS = -Dgles1=false -Dgles2=false
> +LIBGLVND_CONF_OPTS += -Dgles1=false -Dgles2=false
>  endif
>  
>  $(eval $(meson-package))
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
