Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6B4C43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 15:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AAEE60EE1;
	Mon,  4 Jul 2022 15:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AAEE60EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81jwXW5kkVrS; Mon,  4 Jul 2022 15:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AD7560ECE;
	Mon,  4 Jul 2022 15:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AD7560ECE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 041271BF314
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D210D60ECE
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D210D60ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hSHcfLnz9AkJ for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 15:41:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30BD260EBB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30BD260EBB
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 15:41:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4999:e547:afac:f97])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DA5545FF10;
 Mon,  4 Jul 2022 17:41:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 04 Jul 2022 17:41:42 +0200
Date: Mon, 4 Jul 2022 17:41:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <foss+buildroot@0leil.net>
Message-ID: <20220704154142.GC2521@scaer>
References: <20220704112704.40656-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220704112704.40656-1-foss+buildroot@0leil.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1656949307;
 bh=UJxd9iX3cttOcBAhnLr/DEtbmMxszmrxoATJCXWtpGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dSuKrgV6gx+uiYLoZRKzoIEWdOYxy45aLf8VoDxn2l8diXugMmKE6TSBSG5/gnIb8
 kD3uSvMjRMDX/gQfDi9PAHE8zpBEONcv8aN1AtO3QicDZDeUK99er00Pk8b6MDux9Y
 9FySOqqTSWjNMypp+fg1BRYKUwCpAiHxXYR1wZJcBn57YmqlxO9toyURYi/3GBDMBJ
 N8fivH8cbhS6NxiU5vGwVOSvGJ76yo5suR/1BOExUDDsuyE9mjKNvB47coOslxMCoF
 9aY8qdQ9m7RXp+t53djudu3JunPRhAjRH7K1tRTpD38+3qJR57jjQ7q+RUfXZmRdpy
 TICZCNbt8Op9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dSuKrgV6
Subject: Re: [Buildroot] [PATCH] boot/optee-os: fix typo in help message of
 BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quentin, All,

On 2022-07-04 13:27 +0200, Quentin Schulz spake thusly:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> The custom tarball option should be given a URL pointing to an OP-TEE OS
> tarball and not a "kernel" one.
> 
> Fixes: 9c79b369d69c "boot/optee-os: add support for custom tarball URL"
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/optee-os/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> index 62e4adcf55..f199de31eb 100644
> --- a/boot/optee-os/Config.in
> +++ b/boot/optee-os/Config.in
> @@ -28,7 +28,7 @@ config BR2_TARGET_OPTEE_OS_LATEST
>  config BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
>  	bool "Custom tarball"
>  	help
> -	  This option allows to specify a URL pointing to a kernel
> +	  This option allows to specify a URL pointing to an OP-TEE OS
>  	  source tarball. This URL can use any protocol recognized by
>  	  Buildroot, like http://, ftp://, file:// or scp://.
>  
> -- 
> 2.36.1
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
