Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAFFC5ACB3
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 13:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE3941747;
	Sat, 18 Nov 2023 13:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE3941747
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y4H2X4IXckFx; Sat, 18 Nov 2023 13:48:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43BD41741;
	Sat, 18 Nov 2023 13:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D43BD41741
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6BC91BF2C2
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 13:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80CDA60797
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 13:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80CDA60797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jjOgAHTY-23Q for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 13:48:37 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B8DE60759
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 13:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B8DE60759
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C9AF1780383;
 Sat, 18 Nov 2023 14:48:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 14:48:33 +0100
Date: Sat, 18 Nov 2023 14:48:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231118134833.GQ996011@scaer>
References: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
 <20231118015456.2629144-3-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231118015456.2629144-3-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700315315;
 bh=swqJ0I7xnOIr2fCxrY0zGwdiHrssh+XVJ6Y5kzjN3No=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UTn5tidg6Be9zVSvi7bTqyEs0124u7+NX2vwpONx7sNGj2IbLL3MQVgnwDNhLqb4c
 BcUg+DYDjFLsd3X5SLyxfAdnoCnJv9LYv7dpOUtVhP6tCk1aS7P6lbBXavuYrBtNgA
 8j7ukfMRo7nGoZ0oS0DGA7bQ8AMWJaFbiDuFdTrN93n/evrZy6qLP3eA13cPprfXgV
 tVRbePdQdnhiMnxJZDqu6EhY1awSGtlrWjDahvK1eu1bRS2MYkVDoNjNKfGGEldcC6
 xPYbHF8qHC5eX8APT3uyo7B5pG9DP07/wYLQgrbvvgPhcMvyBw+1F6x6JCqTmxL4KP
 azLFhEK9N2M+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UTn5tidg
Subject: Re: [Buildroot] [PATCH/next 3/7] package/flutter-sdk-bin: add
 target-os as linux
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

On 2023-11-17 18:54 -0700, Adam Duskett spake thusly:
> We build for Linux.

Indeed. But why was it working correctly so far anyway?

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/flutter-sdk-bin/flutter-sdk-bin.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> index 17cd3523a6..e8e71b6ab0 100644
> --- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
> +++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> @@ -77,6 +77,7 @@ HOST_FLUTTER_SDK_BIN_DART_ARGS = \
>  	-Ddart.vm.product=$(HOST_FLUTTER_SDK_BIN_SDK_PRODUCT) \
>  	--aot \
>  	--tfa \
> +	--target-os linux \
>  	--packages .dart_tool/package_config.json \
>  	--output-dill .dart_tool/flutter_build/*/app.dill \
>  	--depfile .dart_tool/flutter_build/*/kernel_snapshot.d
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
