Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A93C5ACB3
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 13:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E817A418B2;
	Sat, 18 Nov 2023 13:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E817A418B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTZU3LqWge2m; Sat, 18 Nov 2023 13:43:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 256C741846;
	Sat, 18 Nov 2023 13:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 256C741846
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D86151BF2C2
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 13:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF75160BF3
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 13:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF75160BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gf5zj3IEAWVq for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 13:43:17 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C67D60592
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 13:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C67D60592
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6A0C078035B;
 Sat, 18 Nov 2023 14:43:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 14:43:13 +0100
Date: Sat, 18 Nov 2023 14:43:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231118134313.GO996011@scaer>
References: <20231117163349.1605366-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231117163349.1605366-1-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700314995;
 bh=4xPX4nC1vJy2xoCe8pe8mDxlJmWTHUq8pRX6rRKyWHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pJcvpWWgyEX5rsD3PcwUW47nBVKQq+J2tmldp/VMEluBfEDwP3z9xGFIhMjUSMrRD
 cTJAb/B3I52OvimkAtMnmlI3v7FJTvxtX7+t1mvHttTFIBPNvPDEKzMCAkfiwtuaPu
 yyOb7TuBTzK5mxxT3RX0Y2eUMsyHV3pdUDBv+u5Q0NAknAZEKtTeWHpQHOZBy4iA5C
 7unwoIPA7fI65HMOwlCSTZYpW2iB4J7OT+eHcG72Z5CX/UZU8tvE9QxmEmaI6+0Xp2
 PR+imd7TEf5SpIdopbXfVDoS7gfrtZDgmz2C1xsPxAPjj0uELx2Dd8bZ5lH14BXIeR
 Kl7OjnMHI6NLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pJcvpWWg
Subject: Re: [Buildroot] [PATCH 1/1] package/flutter-engine: set HOME_DIR
 variable when configuring and building
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

Adam, All,

On 2023-11-17 09:33 -0700, Adam Duskett spake thusly:
> If the HOME_DIR variable is not set, flutter-engine creates a .dart directory

You reference HOME_DIR in the commit title and log, but the patch is
about HOME...

> in ~/.

I've rewritten the commit title, and drastically rewriten the commit log
to properly explain what is going on and why we decided to do that.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/flutter-engine/flutter-engine.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
> index 32aaa1cccf..d31d435d79 100644
> --- a/package/flutter-engine/flutter-engine.mk
> +++ b/package/flutter-engine/flutter-engine.mk
> @@ -185,11 +185,14 @@ define FLUTTER_ENGINE_EXTRACT_CMDS
>  	| $(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
>  endef
>  
> +# We must set the home directory to the sdk directory or else flutter will
> +# place .dart, and .flutter in ~/.
>  define FLUTTER_ENGINE_CONFIGURE_CMDS
>  	cd $(@D) && \
>  		rm -rf $(FLUTTER_ENGINE_BUILD_DIR) && \
>  		PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
>  		PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
> +		HOME=$(HOST_FLUTTER_SDK_BIN_SDK) \
>  		./flutter/tools/gn \
>  			$(FLUTTER_ENGINE_CONF_OPTS)
>  endef
> @@ -198,6 +201,7 @@ define FLUTTER_ENGINE_BUILD_CMDS
>  	cd $(@D) && \
>  		PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
>  		PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
> +		HOME=$(HOST_FLUTTER_SDK_BIN_SDK) \
>  		$(HOST_DIR)/bin/ninja \
>  			-j $(PARALLEL_JOBS) \
>  			-C $(FLUTTER_ENGINE_BUILD_DIR)
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
