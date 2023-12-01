Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B20CC4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 10:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92691847CD;
	Fri,  1 Dec 2023 10:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92691847CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOTDctQyB9wH; Fri,  1 Dec 2023 10:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 561CE8477C;
	Fri,  1 Dec 2023 10:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 561CE8477C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 425191BF345
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 10:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2775742096
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 10:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2775742096
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uOiyTDUjNDXS for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 10:02:23 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6BD842093
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 10:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6BD842093
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4c68:322b:52a4:6805])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 813B12003DA;
 Fri,  1 Dec 2023 11:02:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 01 Dec 2023 11:02:17 +0100
Date: Fri, 1 Dec 2023 11:02:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231201100217.GK3177259@scaer>
References: <20231129173901.505113-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231129173901.505113-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701424939;
 bh=9v7NkXOpTeiydVpPG5PSwTFVzVCToeEp+6j5Asd6TGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D7GJqVKNqMwlc082ysQP8BNv6qbZj12f5wDd6wrLZJwraS6sWHTJ6n4fjI7Qw28wF
 aYyMiC/WGxrAk/Ka1ArozncAWva7oNOuiqwxJ9bGR75cc2fjyNCoVahBf3+xJO5IaX
 TERHFSgbjf5j2YZme4PtbTBIlcPdlelveAuIHZ1OGzEa2uudAfCI3UHz8mUfqC2LFP
 YTUpkARYtUTkSQrubAU2SfLPJbG1+6r2b4g1JZK8b/p048oed9UJz0iKU63oNhlyAg
 +lU4IrXJCsDzgg+lQMjwXtds666z2dSALEfvdUeWudaaYNrXKUeQnwEO/7azUCLiym
 b8f0enyrZdtWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D7GJqVKN
Subject: Re: [Buildroot] [PATCH 1/2] package/xtables-addons: drop
 unrecognized option
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

On 2023-11-29 18:39 +0100, Fabrice Fontaine spake thusly:
> --with-xtables is an unrecognized option since the addition of the
> package in commit 490917387a0ff6969f8130be38993eed5f06f73e:
> https://github.com/nawawi/xtables-addons/blob/a576f4d43e80f9f91705c9e6a86f2d58c283df14/configure.ac
> 
> configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --with-xtables
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/xtables-addons/xtables-addons.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
> index e794538956..adfedbc874 100644
> --- a/package/xtables-addons/xtables-addons.mk
> +++ b/package/xtables-addons/xtables-addons.mk
> @@ -13,7 +13,6 @@ XTABLES_ADDONS_LICENSE_FILES = LICENSE
>  
>  XTABLES_ADDONS_CONF_OPTS = \
>  	--with-kbuild="$(LINUX_DIR)" \
> -	--with-xtables="$(STAGING_DIR)/usr" \
>  	--with-xtlibdir="/usr/lib/xtables"
>  
>  define XTABLES_ADDONS_BUILD_CMDS
> -- 
> 2.42.0
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
