Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67F1C61DF4
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 11:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64E7640220;
	Sat, 25 Nov 2023 11:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64E7640220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHpavY0xxSkO; Sat, 25 Nov 2023 11:26:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6441F40012;
	Sat, 25 Nov 2023 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6441F40012
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38F8B1BF863
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 11:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D65040289
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D65040289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kwocxJKGTK_o for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 11:26:05 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5883B40220
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 11:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5883B40220
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:a9ce:514c:eb15:225c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EEDE513F86A;
 Sat, 25 Nov 2023 12:25:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Nov 2023 12:25:59 +0100
Date: Sat, 25 Nov 2023 12:25:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231125112559.GF3177259@scaer>
References: <20231124201436.52264-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231124201436.52264-1-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700911562;
 bh=6F1dAh2XXFPx3kCfI646DUifyOV7Y/hjBr6XBwDcyS0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UuEPHwO6jISQpcFOFtqnSb4HIaGfefDQfmyRQwzHf7EdNlyBQ+MU0ncrDLgpzX+kJ
 X9Qjs34Pyk/hWEYjkz16AC807UGCVA2sO7ypkYNJ05vdhYNGLAzZXMi7ZOoppDN/+d
 s22kG1bvvwZqu3Q1l2ADkbW51U3FlLa4Mq5BXGa2mdOSFWhA7b6S9uawy9xLpcquBu
 UkNc6cexC2Lqa8xzarCPSBo9la37NEX8IFLc/c0W1nv0zNLxEQoCbhuHC6i3SYe38t
 tcB50K2QvZNcqM3vPhfMbLmRGoJoDdjkWIr/VeM/4qgRlHXVj6mf/WdxLaS2OuIo1V
 e6V0868RCI1Ew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UuEPHwO6
Subject: Re: [Buildroot] [PATCH 1/1] package/flutter-sdk-bin/Config.in.host:
 remove comment
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

Adam, All

On 2023-11-24 13:14 -0700, Adam Duskett spake thusly:
> flutter-sdk-bin isn't a rust package.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/flutter-sdk-bin/Config.in.host | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-sdk-bin/Config.in.host
> index a48714ea7f..181a2ee6e5 100644
> --- a/package/flutter-sdk-bin/Config.in.host
> +++ b/package/flutter-sdk-bin/Config.in.host
> @@ -1,4 +1,3 @@
> -# All host rust packages should depend on this option
>  config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
>  	bool
>  	default y if BR2_HOSTARCH = "x86_64"
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
