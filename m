Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440E0C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 22:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B526584BBB;
	Sat, 23 Jul 2022 22:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B526584BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0yeDNMcRmAxn; Sat, 23 Jul 2022 22:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC9B484B9A;
	Sat, 23 Jul 2022 22:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC9B484B9A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13BCB1BF3AD
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 22:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0033424AF
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 22:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0033424AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6W9yRagLm60w for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 22:26:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 577A4424AE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 577A4424AE
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:26:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [86.206.242.79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id CF559780502;
 Sun, 24 Jul 2022 00:26:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Jul 2022 00:26:51 +0200
Date: Sun, 24 Jul 2022 00:26:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: David GOUARIN <dgouarin@gmail.com>
Message-ID: <20220723222651.GN2641@scaer>
References: <20220705134402.5914-1-david.gouarin@thalesgroup.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220705134402.5914-1-david.gouarin@thalesgroup.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658615215;
 bh=jOpnxmrAXSEvmiFHnDSqTsMXQlXQDSm7pS+AFy0CBb8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IyUZldhMp/jyCDp/SY8I3mLVk3P6sUjf6qS6L1DKD19LkweS636SU/n+Pjc91JzTU
 ZvF/3ybZUXwpze4E8G3Dq0W4hWPP5pL3k+hz1EDU9QPz1Dcqs/KdUPSxjYkHE9/iYj
 TzD13E1QzLZ6/lv36QAKYZTaJc5auuBfHFIvw9n95o3RY0PBNc4j/9uWvaHJIgmFZ/
 hlc/V4E8/NweaNCLvZDjifwN5FinSNst0l8C72vlrXhfJ7qAW7S/IbQRGjf/l7Z3Cv
 9sw6U0ifQ4EQwHN8sSlrPljrMXMymdTySvGGXz0EHfzRjR9wJMvcI42QGqtgXPE/mz
 I3QEu/zZ0yexQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IyUZldhM
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-waf.mk: enable definiton of
 env. variables in every build steps
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
Cc: David GOUARIN <david.gouarin@thalesgroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

David, All,

On 2022-07-05 15:44 +0200, David GOUARIN spake thusly:
> It might be necessary for some packages to define environment variables when calling waf build and waf install.
> This is done the same way as the others package types, by defining $(PKG)_MAKE_ENV in .mk.
> 
> Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-waf.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
> index d546b4a817..e090afa9e6 100644
> --- a/package/pkg-waf.mk
> +++ b/package/pkg-waf.mk
> @@ -75,7 +75,7 @@ endif
>  ifndef $(2)_BUILD_CMDS
>  define $(2)_BUILD_CMDS
>  	cd $$($$(PKG)_SRCDIR) && \
> -	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
>  		build $$(WAF_OPTS) $$($(2)_BUILD_OPTS) \
>  		$$($(2)_WAF_OPTS)
>  endef
> @@ -88,7 +88,7 @@ endif
>  ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
>  	cd $$($$(PKG)_SRCDIR) && \
> -	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
>  		install --destdir=$$(STAGING_DIR) \
>  		$$($(2)_INSTALL_STAGING_OPTS) \
>  		$$($(2)_WAF_OPTS)
> @@ -102,7 +102,7 @@ endif
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
>  	cd $$($$(PKG)_SRCDIR) && \
> -	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
> +	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
>  		install --destdir=$$(TARGET_DIR) \
>  		$$($(2)_INSTALL_TARGET_OPTS) \
>  		$$($(2)_WAF_OPTS)
> -- 
> 2.17.1
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
