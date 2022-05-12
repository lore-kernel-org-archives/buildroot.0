Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F8CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDD28416A9;
	Thu, 12 May 2022 19:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0zrJ9lCQ-FQ; Thu, 12 May 2022 19:31:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A502409F4;
	Thu, 12 May 2022 19:31:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E35FD1BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0197409F4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cslPxvXIHbIo for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:31:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77B944011E
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:31:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccab:5af8:e14c:c986])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 633FD19F593;
 Thu, 12 May 2022 21:31:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652383875;
 bh=oNkBX4aCUVlCpXzuwZihR18pCzhG5vVfPhVoc9UkH24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h/SYhIsRx/K+bQt/FIItZ+3sP7cW4nwz01qT6DKsfo1GWkTYujqbCVL8qSa9/9Jzm
 6NlR4fpj4fMs8LAkUWwHWPLX6sH92bnkKr8A1NRBSWfib3VvAPx8ZKm2qjT4EgTvN0
 7MQopHq0RUPwU0tfl8U3uu0gZn2GHxU0BTXA29KJDCfxhGHGgyg9W7PvvNuWOLFOHg
 tmM166CcEyi+tPmDEZJsTQ6VfFmZc+8bfpRHxHLFGRotM6Rcc4p+AVLNgWeSxh+rkK
 piIvxEfXo6zas0b1BkjCLjupaoWgNTzuDWVA3aslgRp5X1nKNGzvW0ptucKNrS+hys
 mggUIxfZXc1gA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 May 2022 21:31:13 +0200
Date: Thu, 12 May 2022 21:31:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220512193113.GA1597494@scaer>
References: <20220512182720.757182-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512182720.757182-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfont2: remove
 autoreconf
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

Bernd, All,

On 2022-05-12 20:27 +0200, Bernd Kuhls spake thusly:
> Forgotten in commit e6f8c403fe6c9909d2d3f5fd897c3057b7677192 which
> removed 0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/x11r7/xlib_libXfont2/xlib_libXfont2.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> index 6a71761f4e..fb0bba879c 100644
> --- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> +++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> @@ -12,8 +12,6 @@ XLIB_LIBXFONT2_LICENSE_FILES = COPYING
>  XLIB_LIBXFONT2_CPE_ID_VENDOR = x
>  XLIB_LIBXFONT2_CPE_ID_PRODUCT = libxfont
>  XLIB_LIBXFONT2_INSTALL_STAGING = YES
> -# 0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
> -XLIB_LIBXFONT2_AUTORECONF = YES
>  XLIB_LIBXFONT2_DEPENDENCIES = \
>  	freetype \
>  	xlib_libfontenc \
> -- 
> 2.30.2
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
