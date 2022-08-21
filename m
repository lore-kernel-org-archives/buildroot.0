Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD5AC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 15:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C5AB409EC;
	Sun, 21 Aug 2022 15:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C5AB409EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8E2KRxgACq5n; Sun, 21 Aug 2022 15:29:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E02409E5;
	Sun, 21 Aug 2022 15:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E02409E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8758E1BF5AD
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FE4A81B14
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FE4A81B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qce7wKT-DQsu for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 15:29:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F6BD81B01
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F6BD81B01
 for <buildroot@busybox.net>; Sun, 21 Aug 2022 15:29:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8D5AE13FA38;
 Sun, 21 Aug 2022 17:29:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Aug 2022 17:29:42 +0200
Date: Sun, 21 Aug 2022 17:29:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220821152942.GY2775145@scaer>
References: <20220127104658.9895-1-mf@go-sys.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127104658.9895-1-mf@go-sys.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661095784;
 bh=X7AVJzzuOopazLJi0YLFVKT++hxKeWvMavuDJjEjU0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mI3Y6XKHrIgDdu1E5A7gk/NMiu8M2B8+CTgCQUn191C+vdxeffbHFhwHgBHKyODDx
 nnfA2x/fU3CgPcH3lahWY8bu2oAn6oHCDD/e6A9kK5pXGNGy46bFZSBXH4x1wVo28v
 ITbuMu0tShtSyAbIBMz/Oh+02ofbCIPC8eNMiqIkoYf7rbN7oYdp0O+pPYmUncOsTR
 u2FF1soxkvMaQ69EsmFTAMas0DySJEl5jW7HJAtGD/Yb+RachGbIm4RRKEXYqh7kfW
 FKYv8jthUvspHcQ+qF4b4GPPsME56qa/SDDfciArGnxb7bCIitHkB1NTkI6Dkuklt1
 wDR2rc3lY7cug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mI3Y6XKH
Subject: Re: [Buildroot] [PATCH v2 1/1] package/network-manager: add
 optional nmcli support
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2022-01-27 11:46 +0100, Michael Fischer spake thusly:
> The network-manager package builds the nmcli utility when the
> readline package is enabled. However, this is not necessarily
> obvious to the user. Therefore, this commit adds an explicit
> option to enable the nmcli tool, which automatically selects readline.
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to master^Wnext, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/network-manager/Config.in          | 8 +++++++-
>  package/network-manager/network-manager.mk | 2 +-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index a48cb37b15..f61a046a95 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -37,6 +37,13 @@ config BR2_PACKAGE_NETWORK_MANAGER_TUI
>  	help
>  	  This option enables terminal based UI
>  
> +config BR2_PACKAGE_NETWORK_MANAGER_CLI
> +	bool "nmcli support"
> +	select BR2_PACKAGE_READLINE
> +	help
> +	  This option enables support for the
> +	  NetworkManager Command Line Interface
> +
>  config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
>  	bool "modem-manager support"
>  	select BR2_PACKAGE_MODEM_MANAGER
> @@ -54,7 +61,6 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
>  	select BR2_PACKAGE_JANSSON
>  	help
>  	  This option enables support for OpenVSwitch
> -
>  endif
>  
>  comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 4.6, dynamic library, wchar, threads, gcc >= 4.9"
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 974320fce0..1eb9233b44 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -135,7 +135,7 @@ else
>  NETWORK_MANAGER_CONF_OPTS += --disable-polkit
>  endif
>  
> -ifeq ($(BR2_PACKAGE_READLINE),y)
> +ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_CLI),y)
>  NETWORK_MANAGER_DEPENDENCIES += readline
>  NETWORK_MANAGER_CONF_OPTS += --with-nmcli
>  else
> -- 
> 2.20.1
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
