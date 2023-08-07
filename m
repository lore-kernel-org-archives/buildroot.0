Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A9CC001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E39408E9;
	Mon,  7 Aug 2023 21:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19E39408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZiI8Y9ve1x9w; Mon,  7 Aug 2023 21:31:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DED3740894;
	Mon,  7 Aug 2023 21:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DED3740894
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCBD41BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1F6340894
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1F6340894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lq2AQyYGWBb5 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:31:39 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A57B540566
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A57B540566
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d6ff:7cb6:900b:4575])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5A587B00515;
 Mon,  7 Aug 2023 23:31:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 07 Aug 2023 23:31:31 +0200
Date: Mon, 7 Aug 2023 23:31:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230807213131.GA421096@scaer>
References: <20230807145839.2375839-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807145839.2375839-1-thomas.devoogdt@barco.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691443896;
 bh=MXYpxFOFKQXqZY+FpvsilBxXvUSb13LUZ+vMpisdoS0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mHxwLYzZlKgcLqAb54/reLXqL+5cxuUj+jkNOCkaxO9ASNLZ+PeyI0o4H5jxXrfVN
 XnRSV2zXCbDDk3JF6RcTz05Lz36pklSkbtYXqv+cJMQMyvt0+frWlW376U0cbmt/Iz
 DO0gwa49qlHAd/sKLdEyX0NxfKHODJvYnO+8hrULAJiizvzWNvcY4S7LEXT6FqV/MF
 kgZIZtLwt/kAGmnxcLwGaCStl9LhORPfhYQKJYSmfgTgp0YhHiduzytiXx3sWzlRW8
 nlTmiUG5D/SVTc9fPClUP04DoWwbGH7/vOjizpewP0/Y98z/DfOwh/7vhhHIimBc4F
 H3MJZ8pfhvHsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mHxwLYzZ
Subject: Re: [Buildroot] [PATCH v1 1/3 next] package/qt6/qt6serialport: use
 the CMAKE_NINJA flag
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

Thanks for this series. Thomas P. applied it before I had a chance to
reply, so:

Is there an issue with qt6svg, or did you just miss it?

Regards,
Yann E. MORIN.

On 2023-08-07 16:58 +0200, Thomas Devoogdt spake thusly:
> Use the newly introduce backend option (4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606)
> to specify what cmake backend to use, instead of special-coding it's use.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  package/qt6/qt6serialport/qt6serialport.mk | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
> index 497719d4ec..bdb16dd892 100644
> --- a/package/qt6/qt6serialport/qt6serialport.mk
> +++ b/package/qt6/qt6serialport/qt6serialport.mk
> @@ -10,6 +10,8 @@ QT6SERIALPORT_SOURCE = qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT
>  QT6SERIALPORT_INSTALL_STAGING = YES
>  QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
>  
> +QT6SERIALPORT_CMAKE_BACKEND = ninja
> +
>  QT6SERIALPORT_LICENSE = \
>  	GPL-2.0+ or LGPL-3.0, \
>  	GPL-3.0 with exception (tools), \
> @@ -25,7 +27,6 @@ QT6SERIALPORT_LICENSE_FILES = \
>  	LICENSES/Qt-GPL-exception-1.0.txt
>  
>  QT6SERIALPORT_CONF_OPTS = \
> -	-GNinja \
>  	-DQT_HOST_PATH=$(HOST_DIR) \
>  	-DBUILD_WITH_PCH=OFF \
>  	-DQT_BUILD_EXAMPLES=OFF \
> @@ -33,19 +34,6 @@ QT6SERIALPORT_CONF_OPTS = \
>  
>  QT6SERIALPORT_DEPENDENCIES = \
>  	host-pkgconf \
> -	host-ninja \
>  	qt6base
>  
> -define QT6SERIALPORT_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SERIALPORT_BUILDDIR)
> -endef
> -
> -define QT6SERIALPORT_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR)
> -endef
> -
> -define QT6SERIALPORT_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR)
> -endef
> -
>  $(eval $(cmake-package))
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
