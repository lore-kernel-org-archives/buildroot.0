Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD9EC3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 20:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3590541724;
	Thu, 28 Dec 2023 20:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3590541724
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jd-V4GoZ0Phq; Thu, 28 Dec 2023 20:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73BD340852;
	Thu, 28 Dec 2023 20:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73BD340852
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1753C1BF342
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 20:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E32F3414EC
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 20:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E32F3414EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljkGDWHvY_oY for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 20:44:00 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B41F540167
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 20:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B41F540167
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B57CDB0053D;
 Thu, 28 Dec 2023 21:43:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Dec 2023 21:43:55 +0100
Date: Thu, 28 Dec 2023 21:43:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZY3eC5BDc92fXTsj@landeda>
References: <20230902133347.3261113-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230902133347.3261113-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703796239;
 bh=DIoWODcUHI+5Vr/znuJr+6RNUEn+Uh0pL5eIJm43uzU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tng3rqETry1MkQTyoIdJuDUuSJbWFNuxXQtaQg1F0fFmmHwUGlOS1JQyebA0FUW/8
 /5ZsCLa+I9FA/7shFgLXdeIfdLY30NgmGOTKjnsjTLyeyuQ1wXDsV7acfaVVW7Rllk
 a+Ktu7lI6hDwwzTErLPDcBWzOk9JmBYzRIw3G5O7oK9ZqmnVdbmxq10kdeqRkoz36F
 EiokvfJ6fKZJEPtEm81Bgv+5NaerrNS8GGbhvp+OS7PD8z2aUllmV+Yz9XXv/2xLaY
 U8aTugmAClmTYcJOSBKUvOFaF0W+UkV7aUu91FvhQydkze3lJl8GL90x3BR3uhUAzJ
 yB4850YfRpjMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tng3rqET
Subject: Re: [Buildroot] [PATCH] package/pkg-qmake.mk: drop host-perl
 dependency
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-09-02 15:33 +0200, Thomas Petazzoni via buildroot spake thusly:
> Since commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e ("package/qt5:
> bump packages to latest kde submodule versions"), the
> QT_HEADERS_SYNC_HOOK hook no longer calls the syncqt.pl script, so
> host-perl is no longer needed as a dependency of running this
> hook (and as a dependency of building Qt).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-qmake.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
> index fdaddf08df..ccf78692e8 100644
> --- a/package/pkg-qmake.mk
> +++ b/package/pkg-qmake.mk
> @@ -50,7 +50,6 @@ $(2)_DEPENDENCIES 		+= qt5base
>  endif
>  
>  ifeq ($$($(2)_SYNC_QT_HEADERS),YES)
> -$(2)_DEPENDENCIES 		+= host-perl
>  $(2)_PRE_CONFIGURE_HOOKS        += QT_HEADERS_SYNC_HOOK
>  endif
>  
> -- 
> 2.41.0
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
