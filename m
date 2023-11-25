Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6A1C4167B
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 21:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5758C60A4F;
	Sat, 25 Nov 2023 21:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5758C60A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlYj3DZitu3h; Sat, 25 Nov 2023 21:26:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4201608B7;
	Sat, 25 Nov 2023 21:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4201608B7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B32C51BF473
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C25B813B0
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 21:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C25B813B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svirOgl2qFD4 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 21:26:54 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B3FC8149A
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 21:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B3FC8149A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:a9ce:514c:eb15:225c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6E10013F899;
 Sat, 25 Nov 2023 22:26:49 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Nov 2023 22:26:49 +0100
Date: Sat, 25 Nov 2023 22:26:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231125212649.GO3177259@scaer>
References: <20231001091616.1771725-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231001091616.1771725-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700947612;
 bh=Tiy8M/p7uyBoYbdprbMYbo4yvb/rlghmhVZYkuoSZbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lo5LSt7gUxOtpbk+IQEfQXn42wvwFeIV32Bn3nLPgaG9rEGsWeSvC5qxZmJZ2Qbaa
 h89VhHJkpd7uiJWQlGWzqGuPHXoRc1SdGXOCm7/r4a+ztxkShY2FUTWY9aK0nWBBX6
 DzBmlV/6dUMv4Vr/LbN9XDq9RnUwAZOrRwlv3nl+9LpELXZPtTWPH69TjVa8uZVXus
 y+LGnUlTg5mOmCpoSX7rt1fWFuZIH2L0YNooTOyOvozN7w21ORBAOZGYEydLL2nLpd
 T7P39HnVf73VRfj5Izq+i1YJUTcaXCqRpYyEtdOiYj3eIVG45TLIZGPviFane/7S5A
 /nrVefYwfA8kQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lo5LSt7g
Subject: Re: [Buildroot] [PATCH 1/1] package/scons: switch from distutils to
 setuptools
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-10-01 03:16 -0600, James Hilliard spake thusly:
> distutils will be dropped with python 3.12.
> 
> Remove no longer required --install-lib install option which was
> originally added in b08979477d65203b9b90c88d2a00246342c0b56a to work
> around a gentoo bug which predates scons using our python
> infrastructure and is unlikely to be relevant at all anymore.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

scons has been bumped and switched to setuptools by Adam in commit
ab3d5a5f5e9b (package/scons: bump version to 4.5.2), now.

So this patch no longer applies and is no longer needed.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/scons/scons.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/scons/scons.mk b/package/scons/scons.mk
> index 6b75d3ddca..170c443fbe 100644
> --- a/package/scons/scons.mk
> +++ b/package/scons/scons.mk
> @@ -8,10 +8,7 @@ SCONS_VERSION = 3.1.2
>  SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
>  SCONS_LICENSE = MIT
>  SCONS_LICENSE_FILES = LICENSE.txt
> -SCONS_SETUP_TYPE = distutils
> -
> -HOST_SCONS_INSTALL_OPTS = \
> -	--install-lib=$(HOST_DIR)/lib/scons-$(SCONS_VERSION)
> +SCONS_SETUP_TYPE = setuptools
>  
>  $(eval $(host-python-package))
>  
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
