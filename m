Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DC6ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C498E40487;
	Sun, 30 Oct 2022 19:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C498E40487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVnBrigGcNEX; Sun, 30 Oct 2022 19:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B221A400FD;
	Sun, 30 Oct 2022 19:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B221A400FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7882D1BF2A1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6181C60888
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6181C60888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dI0Via1x56qA for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:19:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B502605F6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B502605F6
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:19:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5062AB0051E;
 Sun, 30 Oct 2022 20:19:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 20:19:07 +0100
Date: Sun, 30 Oct 2022 20:19:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030191907.GB1058960@scaer>
References: <20221030190028.3632333-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030190028.3632333-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667157550;
 bh=db79wEcObPQ9aUKf0DDZKWYP/JX0rtgK9FEKvJJrpxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S+ABHFr8n4SyhJ99dai1I14dVHnHWH5ytrdODur24XPWxWQsCtC6NB9r7ZbEkO4fQ
 yLolI2+WmHS2VrAlvzQkAymwRAn/V1g4a9zTkn6z/yeoNXnA+LMeO3We3nwKoc4wNM
 ckXcduUNbrY5I0IDLkrRUvxcNr8K0kJOomrfIpKFcySJnVPtGDNplP04UpHBvyjTMs
 88dNfxO/XPjcZUWW3Ir7bd3GK9F4WgdA4kVhPJLjf9/NwbEKDUQmqqicyu9wGS7n43
 ZYUHWyoCwvUD8I4fRBNgJBhLf6QRotdrhZqTpuTOP6rzHykqEw8bkLCsV2yPBaCAtY
 5oVqmUJUn8Png==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S+ABHFr8
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cmake.mk: MakeFiles ->
 Makefiles
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-10-30 13:00 -0600, James Hilliard spake thusly:
> Fixes:
> CMake Error: Could not create named generator Unix MakeFiles
> 
> Generators
>   Green Hills MULTI            = Generates Green Hills MULTI files
>                                  (experimental, work-in-progress).
> * Unix Makefiles               = Generates standard UNIX makefiles.
>   Ninja                        = Generates build.ninja files.
>   Ninja Multi-Config           = Generates build-<Config>.ninja files.
>   Watcom WMake                 = Generates Watcom WMake makefiles.
>   CodeBlocks - Ninja           = Generates CodeBlocks project files.
>   CodeBlocks - Unix Makefiles  = Generates CodeBlocks project files.
>   CodeLite - Ninja             = Generates CodeLite project files.
>   CodeLite - Unix Makefiles    = Generates CodeLite project files.
>   Eclipse CDT4 - Ninja         = Generates Eclipse CDT 4.0 project files.
>   Eclipse CDT4 - Unix Makefiles= Generates Eclipse CDT 4.0 project files.
>   Kate - Ninja                 = Generates Kate project files.
>   Kate - Unix Makefiles        = Generates Kate project files.
>   Sublime Text 2 - Ninja       = Generates Sublime Text 2 project files.
>   Sublime Text 2 - Unix Makefiles
>                                = Generates Sublime Text 2 project files.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Good catch, thanks!

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-cmake.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index db9fdebb8d..8c375779cb 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -88,7 +88,7 @@ define $(2)_CONFIGURE_CMDS
>  	rm -f CMakeCache.txt && \
>  	PATH=$$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> -		-G"Unix MakeFiles" \
> +		-G"Unix Makefiles" \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
>  		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
> @@ -119,7 +119,7 @@ define $(2)_CONFIGURE_CMDS
>  	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>  	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> -		-G"Unix MakeFiles" \
> +		-G"Unix Makefiles" \
>  		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>  		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>  		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
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
