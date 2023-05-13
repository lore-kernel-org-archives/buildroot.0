Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1355C77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 11:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF9784AEB;
	Sat, 13 May 2023 11:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF9784AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XqSypSK8iyDx; Sat, 13 May 2023 11:53:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79A5D84A89;
	Sat, 13 May 2023 11:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79A5D84A89
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 179BA1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 11:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4C0E84A89
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 11:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4C0E84A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MSPm7BXRB2r5 for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 11:53:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8926C84A86
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8926C84A86
 for <buildroot@buildroot.org>; Sat, 13 May 2023 11:53:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id BB8E319F732;
 Sat, 13 May 2023 13:53:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 13:53:15 +0200
Date: Sat, 13 May 2023 13:53:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230513115315.GO2582048@scaer>
References: <20221007133912.2869000-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221007133912.2869000-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683978798;
 bh=2iusXmQzEdhdFy8Lqf5F3SixhAGiOAq/U9FcEr7VxY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mwRwni3pgBRRsz2gwR23tTMKZEAo/rWz+mj49B4X4kFO0G4su4VOEUSpHzFg1ZBT0
 d0DWzbX+DKgc/p+GGtvmUPQPGWPVuw/bE+MX1nn5Ca6Qr9lsXBsWCFZ2P8KCBIyFXP
 LoOyGG43i2WWXKe66zIhcmpmOFXrusgwiYs1CvKhrGXEOHSHkYsLrtZ2qewLZ1jTAi
 HbZzjn8zsxr0RQmXqwv2fHNDQC42Dak/ZjNyfURxaLYfh493b1OLQace+/u1P0fIGb
 FS5mAKcY3aoaGCBM8bvpZuAm2K1WvlIZ+itJGkzxOgP6uk2Lf0RnuA3uK4BlM0nLQW
 O1SNfzZqYso8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mwRwni3p
Subject: Re: [Buildroot] [PATCH 1/2] package/libglib2: bump to version 2.74.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,
On 2022-10-07 07:39 -0600, James Hilliard spake thusly:
> Drop patch which is now upstream.
> 
> Replace pcre with pcre2 dependency.
> 
> Drop no longer supported fam option.
> 
> COPYING hash changed due to formatting changes.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 2970d5a7a9..a0dea81c3f 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBGLIB2_VERSION_MAJOR = 2.72
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
> +LIBGLIB2_VERSION_MAJOR = 2.74
> +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0

We now have 2.76.1 (with a patch pending for 2.76.2), so I've marked
this bump as superseded, thansk!

Regards,
Yann E. MORIN.

>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>  LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
>  LIBGLIB2_LICENSE = LGPL-2.1+
> @@ -24,7 +24,6 @@ endif
>  
>  HOST_LIBGLIB2_CONF_OPTS = \
>  	-Ddtrace=false \
> -	-Dfam=false \
>  	-Dglib_debug=disabled \
>  	-Dlibelf=disabled \
>  	-Dselinux=disabled \
> @@ -35,12 +34,12 @@ HOST_LIBGLIB2_CONF_OPTS = \
>  
>  LIBGLIB2_DEPENDENCIES = \
>  	host-pkgconf host-libglib2 \
> -	libffi pcre zlib $(TARGET_NLS_DEPENDENCIES)
> +	libffi pcre2 zlib $(TARGET_NLS_DEPENDENCIES)
>  
>  HOST_LIBGLIB2_DEPENDENCIES = \
>  	host-gettext \
>  	host-libffi \
> -	host-pcre \
> +	host-pcre2 \
>  	host-pkgconf \
>  	host-util-linux \
>  	host-zlib
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
