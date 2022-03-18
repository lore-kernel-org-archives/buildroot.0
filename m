Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30ADC433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9486F60B2A;
	Fri, 18 Mar 2022 21:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06UG8hDChyQ2; Fri, 18 Mar 2022 21:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7F6D60B1F;
	Fri, 18 Mar 2022 21:28:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E75731BF2CC
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5B0460B24
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vVqqAlXFYtra for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 21:28:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D9C260B1D
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 21:28:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2041313F86E;
 Fri, 18 Mar 2022 22:28:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647638882;
 bh=VPXIqPx63V5pOWqIGWN4doYonylCwkMt1Hyfi2BtpZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d3bOosEySCuzhkPSvjC1cgkXo4Jdtom3x3Pu4mlPdu3aKRnkghjMn2GN8OPSa/Myd
 felUcJgwWs+twBYfixiIkErS3MeVHXTbGjrTPYdzC9JcJ+DwyBwXr1ciEYDcLSSoW1
 RoascipLJ/oEyCWCV/h58iIsMlM17qMUWwrRvr27yIRajiwSPJDm1NVvXbkY2hhdyv
 Z9rLMqx6tHFAGYoxPtSU9P/aBTa9M+VN+kOX9RjlXnQW3UG3/0ocIzemaPNJHeyljc
 T1BbHE0m+gkJhJjN55UQKsR5cMY1RonNzvAb54zFOlLSiXWrRKZ6g4ACnSVOyhdA4j
 W/AvTm2NwnINw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 22:27:59 +0100
Date: Fri, 18 Mar 2022 22:27:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220318212759.GJ283544@scaer>
References: <20220318202044.10413-1-ps.report@gmx.net>
 <20220318202044.10413-2-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318202044.10413-2-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 2/5] package/wget: use explicit
 --with/without-libuuid option
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

On 2022-03-18 21:20 +0100, Peter Seiderer spake thusly:
> - use explicit --with/without-libuuid option

Repeating the commit title in the commit log is not very helpul...

Applied to master with that fixed, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - split out from original patch
> ---
>  package/wget/wget.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index d100a59eae..7fda36f1f5 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -43,7 +43,10 @@ WGET_CONF_OPTS += --without-libidn
>  endif
>  
>  ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
> +WGET_CONF_OPTS += --with-libuuid
>  WGET_DEPENDENCIES += util-linux
> +else
> +WGET_CONF_OPTS += --without-libuuid
>  endif
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
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
