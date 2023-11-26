Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4D9C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F19E60BEF;
	Sun, 26 Nov 2023 21:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F19E60BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3IzMpJ4MSEXi; Sun, 26 Nov 2023 21:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6CEC60671;
	Sun, 26 Nov 2023 21:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6CEC60671
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA3E31BF40A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 835D480F50
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 835D480F50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GOg4k-aliJkO for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:36:45 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BC8280F4C
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BC8280F4C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BB7C078034E;
 Sun, 26 Nov 2023 22:36:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 22:36:41 +0100
Date: Sun, 26 Nov 2023 22:36:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Message-ID: <20231126213641.GH3177259@scaer>
References: <AS1P250MB06085F35DEC1B0AF6F37C41AA9B9A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS1P250MB06085F35DEC1B0AF6F37C41AA9B9A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701034603;
 bh=o2adlCc3UCOfQC2rzmOrsD+5gRUHUvxPSDNE/u4oiJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mfc1fTfTStKYy/3PrR+mAlJGa++FUwn3ZhN7O8iHIkoaNekUp0SzEWtjdZqDrUTDz
 +d6HChnsfMKjffYPd57b4i9+gkuFxScBCm+K5BgpV9J6n5Q834pZQLKtHd9ywUDv3V
 r/ZmwwVZWIcOY7rT7vicbFI8OvHw4lIWiY0vyh4ro2Y/N7qCayaoiq68RkgJ7Sk/Hx
 mu/bAferF8uXw8c9IC5c5gWFYy0rqrUBcLC7uO8vsg3ZJdl7ThnYGWIv5GIMHwONYt
 pms9ymbwJc7U0rkHMBB2r/UOdLhtQy2F8Xxp/YLWOjYD/EVKUdWq1ILSvVwEaS258k
 JRhlj7Hys/X3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Mfc1fTfT
Subject: Re: [Buildroot] [PATCH] package/libzenoh-pico: needs threads
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alex, All,

On 2023-11-23 07:10 +0000, Michel Alex spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/c9138c32157042aa5bb1bfd3a8446e4c9361d0f5/
> 
> Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
> ---
>  package/libzenoh-pico/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libzenoh-pico/Config.in b/package/libzenoh-pico/Config.in
> index 093c6d4f75..cb61b0de55 100644
> --- a/package/libzenoh-pico/Config.in
> +++ b/package/libzenoh-pico/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBZENOH_PICO
>         bool "libzenoh-pico"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
>         help
>           zenoh-pico is the Eclipse zenoh implementation that targets
>           constrained devices and offers a native C API. It is fully

Your patch is badly mangled: the leading TABs have been replaced by
spaces, so I had to manually fix it before applying.

Applied to master, thanks.

Regards,
Yann E. MORIN.

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
