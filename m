Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B251EC07CA9
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6616860BE7;
	Sun, 26 Nov 2023 21:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6616860BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJt35Nz0uQR0; Sun, 26 Nov 2023 21:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A582C60B43;
	Sun, 26 Nov 2023 21:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A582C60B43
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 951531BF40A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76467404C6
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76467404C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id piAECWYkCdPA for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:56:48 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80672403AC
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80672403AC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id CB0B9780368;
 Sun, 26 Nov 2023 22:56:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 22:56:44 +0100
Date: Sun, 26 Nov 2023 22:56:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: leow149 <info.leo@widler.de>
Message-ID: <20231126215644.GO3177259@scaer>
References: <20231126214357.3376407-1-info.leo@widler.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231126214357.3376407-1-info.leo@widler.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701035806;
 bh=jZfZ8o1KCvSC2vMzpN1jXhKfbMxZVpwK5cPVG3wRnBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p6facEKAkK4WGcSYqwWKNZwHuu61jD60PWkd7qSMTqi1OqyVctqYgGe+8tetV58KG
 ebi+smwYH0n6r9yv2fQQy7Z7Cxd1cXeYQzqWO3/nFYjIG3ppTo5kcF7TtlWy0ZHWpr
 grSsN+Cx+0g07ORSLyDd0b7e91uZrIDDMhqzr2jKRt9O8h+Y1QtlH801HYl5MTFYJF
 jj09Bd0xENydqcEuIOM7MOYM0W/bPNLyi6Vms8n63DCb3p+DsNG1ZJ0dClR7ODGgLg
 suQdV6749UDJxaGIwOB8HTiXXA58vXO1PUOi3laIbQmQaOGwAYlPsPuq0p64xV6Bj0
 e0pXO7Aq7mzpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p6facEKA
Subject: Re: [Buildroot] [PATCH 1/1] package/attr: add --enable-multilib to
 fix build error for BL808 based boards
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

leow149, All,

Thank you for your contribution! Here is a quick review.

First, we'll need you to use your real name as the author of the patch;
we do not accept annonymous (od pseduonymou) contributions.

On 2023-11-26 22:43 +0100, leow149 spake thusly:
> This commit fixes a build error which specifically happens for Bouffallo Labs BL808 based boards, but might also happen on other RiscV64 Boards.

Please wrap your commit log to ~72 chars.

Waht is the error that you see? Could you see if there is a similar
build failure on out autobulders:
    http://autobuild.buildroot.org/?static=1&reason=attr-%

The last build error for attr was more than a year ago now, so it is
relatively surprising to see that attr does not build. So we'll need a
bit more context.

> Signed-off-by: leow149 <info.leo@widler.de>
> ---
>  package/attr/attr.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/attr/attr.mk b/package/attr/attr.mk
> index 0327497e1e..89f7d21f0c 100644
> --- a/package/attr/attr.mk
> +++ b/package/attr/attr.mk
> @@ -13,7 +13,8 @@ ATTR_CPE_ID_VENDOR = attr_project
>  
>  ATTR_INSTALL_STAGING = YES
>  
> -ATTR_CONF_OPTS = --disable-nls
> -
> +ATTR_CONF_OPTS = \
> +	--disable-nls \
> +	--enable-multilib

Buildroot does not generate multilib toolchains, and when using an
external toolchain that is multilib, the proper multilib diretory is
copies over to the sysroot.

So, --eanble-multilib looksa like the wrong approach, at least without
more explanations.

Can you elaborate on the issue you encounter, and what makes you think
--enable-multilib is the correct solution?

Thanks!

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.30.2
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
